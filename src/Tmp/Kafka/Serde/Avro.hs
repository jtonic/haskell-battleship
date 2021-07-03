{-# LANGUAGE OverloadedStrings #-}

module Tmp.Kafka.Serde.Avro where

import           Control.Monad.Trans.Except (ExceptT (ExceptT), runExceptT,
                                             withExceptT)
import           Kafka.Avro
import           Prelude
import           Tmp.Kafka.Serde.Model
import           Util.Log                   (infoM)

loggerName :: String
loggerName = "Avro"

shotEvent :: ShotEvent
shotEvent = ShotEvent "tournament-1" "game-1" 1 100 200

data AvroError =  EncError EncodeError | DecError DecodeError deriving (Show)

run :: IO ()
run = do
    sr <- schemaRegistry "http://localhost:8081"
    res <- runExceptT $ roundTrip sr
    case res of
        Left err  -> infoM loggerName $ show err
        Right msg -> infoM loggerName $ show msg

roundTrip :: SchemaRegistry -> ExceptT AvroError IO ShotEvent
roundTrip sr = do
    enc <- withExceptT EncError (encode' shotEvent)
    withExceptT DecError (decode' enc)
    where
        encode' msg = ExceptT $ encode sr (Subject "shotevent-subject-value") msg
        decode' msg = ExceptT $ decode sr msg
