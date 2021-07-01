{-# LANGUAGE RecordWildCards #-}

module Tmp.PatternMatching where

import           Cli.Type as CT
import           RIO
import Prelude (print)

data Action = Engine' {engineName :: String} | Client' {clientPort :: Int} | Unknown deriving (Show)

engineConf :: Options
engineConf = Options {
         command = Engine {
           engineName = "ubots"
           , engineTimeout = 100
         }
         , verbose = False
         , outputFormat = OutPutFormatString
         , dryRun = False
         , saveState = False
       }

clientConf :: Options
clientConf = Options {
         command = Client {
           clientPort = 8080
           , clientTimeout = 50000
         }
         , verbose = False
         , outputFormat = OutPutFormatString
         , dryRun = False
         , saveState = False
       }

dispatch :: Options -> Action
dispatch Options {command = Engine{..}} = Engine' engineName
dispatch Options {command = Client{..}} = Client' clientPort


run :: IO ()
run = do
    print $ dispatch engineConf
    print $ dispatch clientConf
