{-# LANGUAGE RecordWildCards #-}

module Tmp.PatternMatching where

import           Cli.Types as CT
import           Prelude   (print)
import           RIO

data Action = Engine' {engineName :: String} | Client' {clientPort :: Int} | Unknown deriving (Show)

engineConf :: Options
engineConf = Options {
         command = Engine {
           engineName = "ubots"
           , engineTimeout = 100
           , engineKafkaBrokerList = "localhost:9092"
           , engineSchemaRegistryUrl = "http://localhost:8081"
           , engineHttpPort = 8080
           , engineSqliteDbPath = "companion/db/battleship.db"
         }
         , verbose = False
         , outputFormat = Just OutPutFormatString
       }

clientConf :: Options
clientConf = Options {
         command = Client {
           clientPort = 8080
           , clientHttpApiUrl = "localhost:8080"
         }
         , verbose = False
         , outputFormat = Just OutPutFormatString
       }

dispatch :: Options -> Action
dispatch Options {command = Engine{..}} = Engine' engineName
dispatch Options {command = Client{..}} = Client' clientPort


run :: IO ()
run = do
    print $ dispatch engineConf
    print $ dispatch clientConf
