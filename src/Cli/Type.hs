module Cli.Type where

import           RIO

data Options =
  Options {
    command      :: Command,
    verbose      :: Bool,
    outputFormat :: OutputFormat,
    dryRun       :: Bool,
    saveState    :: Bool
    } deriving (Show)

data OutputFormat
  = OutPutFormatString
  | OutputFormatFile FilePath
  deriving (Show)

data Command =
    Engine {
        engineName  :: String
        , engineDefaultTimeout :: Int
     } deriving (Show)
