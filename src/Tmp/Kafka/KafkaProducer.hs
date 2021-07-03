{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}

module Tmp.Kafka.KafkaProducer where

import           Data.Functor   as F
import           Kafka.Consumer (Offset)
import           Kafka.Producer
import           Prelude        (print, putStrLn)
import           RIO
import           RIO.ByteString (getLine)

-- Global producer properties
producerProps :: ProducerProperties
producerProps = brokersList ["localhost:9092"]
             <> sendTimeout (Timeout 10000)
             <> setCallback (deliveryCallback print)
             <> logLevel KafkaLogDebug

-- FIXME: From configuration / cli (optparse-applicative)
targetTopic :: TopicName
targetTopic = "shotevent-topic"

-- FIXME: Avro serde
mkMessage :: Maybe ByteString -> Maybe ByteString -> ProducerRecord
mkMessage k v = ProducerRecord
                  { prTopic = targetTopic
                  , prPartition = UnassignedPartition
                  , prKey = k
                  , prValue = v
                  }

-- Run an example
run :: IO ()
run =
    bracket mkProducer clProducer runHandler >>= print
    where
      mkProducer = newProducer producerProps
      clProducer (Left _)     = return ()
      clProducer (Right prod) = closeProducer prod
      runHandler (Left err)   = return $ Left err
      runHandler (Right prod) = sendMessages prod

sendMessages :: KafkaProducer -> IO (Either KafkaError ())
sendMessages prod = do
  putStrLn "Producer is ready, send your messages!"
  msg1 <- getLine

  -- FIXME: Add avro serialization here
  err1 <- produceMessage prod (mkMessage Nothing (Just msg1))
  forM_ err1 print

  putStrLn "One more time!"
  msg2 <- RIO.ByteString.getLine

  -- FIXME: Add avro serialization here
  err2 <- produceMessage prod (mkMessage (Just "key") (Just msg2))
  forM_ err2 print

  putStrLn "And the last one..."
  msg3 <- getLine
  -- FIXME: Add avro serialization here
  err3 <- produceMessage prod (mkMessage (Just "key3") (Just msg3))
  forM_ err3 print

  putStrLn "Thank you."
  return $ Right ()

-- | An example for sending messages synchronously using the 'produceMessage''
--   function
--
sendMessageSync :: MonadIO m
                => KafkaProducer
                -> ProducerRecord
                -> m (Either KafkaError Offset)
sendMessageSync producer record = liftIO $ do
  -- Create an empty MVar:
  var <- newEmptyMVar

  -- Produce the message and use the callback to put the delivery report in the
  -- MVar:
  res <- produceMessage' producer record (putMVar var)

  case res of
    Left (ImmediateError err) ->
      pure (Left err)
    Right () -> do
      -- Flush producer queue to make sure you don't get stuck waiting for the
      -- message to send:
      flushProducer producer

      -- Wait for the message's delivery report and map accordingly:
      takeMVar var <&> (\case
        DeliverySuccess _ offset -> Right offset
        DeliveryFailure _ err    -> Left err
        NoMessageError err       -> Left err)
