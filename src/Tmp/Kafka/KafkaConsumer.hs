{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Tmp.Kafka.KafkaConsumer where

import           Kafka.Consumer
import           Prelude        (print)
import           RIO
import           Util.Log       (infoM)

loggerName :: String
loggerName = "KafkaConsumer"

-- Global consumer properties
consumerProps :: ConsumerProperties
consumerProps = brokersList ["localhost:9092"] --FIXME: from config/optparse-alternative
             <> groupId "consumer_example_group" --FIXME: from config/optparse-alternative
             <> noAutoCommit
             <> setCallback (rebalanceCallback printingRebalanceCallback)
             <> setCallback (offsetCommitCallback printingOffsetCallback)
             <> logLevel KafkaLogInfo

-- Subscription to topics
consumerSub :: Subscription
consumerSub = topics ["shotevent-topic"]  --FIXME: from config/optparse-alternative
           <> offsetReset Earliest

run :: IO ()
run = do
    print $ cpLogLevel consumerProps
    res <- bracket mkConsumer clConsumer runHandler
    print res
    where
      mkConsumer = newConsumer consumerProps consumerSub
      clConsumer (Left err) = return (Left err)
      clConsumer (Right kc) = maybe (Right ()) Left <$> closeConsumer kc
      runHandler (Left err) = return (Left err)
      runHandler (Right kc) = processMessages kc

-------------------------------------------------------------------
processMessages :: KafkaConsumer -> IO (Either KafkaError ())
processMessages kafka = do
    mapM_ (\_ -> do
                   msg <- pollMessage kafka (Timeout 1000)
                   --FIXME: avro serde
                   infoM loggerName $ "Message: " <> show msg
                   err <- commitAllOffsets OffsetCommit kafka
                   infoM loggerName $ "Offsets: " <> maybe "Committed." show err
          ) [0 :: Integer .. 10]
    return $ Right ()

printingRebalanceCallback :: KafkaConsumer -> RebalanceEvent -> IO ()
printingRebalanceCallback _ e = case e of
    RebalanceBeforeAssign ps ->
        infoM loggerName $ "[Rebalance] About to assign partitions: " <> show ps
    RebalanceAssign ps ->
        infoM loggerName $ "[Rebalance] Assign partitions: " <> show ps
    RebalanceBeforeRevoke ps ->
        infoM loggerName $ "[Rebalance] About to revoke partitions: " <> show ps
    RebalanceRevoke ps ->
        infoM loggerName $ "[Rebalance] Revoke partitions: " <> show ps

printingOffsetCallback :: KafkaConsumer -> KafkaError -> [TopicPartition] -> IO ()
printingOffsetCallback _ e ps = do
    -- TODO: replace with hslogger
    infoM loggerName ("Offsets callback:" ++ show e)
    mapM_ (print . (tpTopicName &&& tpPartition &&& tpOffset)) ps
