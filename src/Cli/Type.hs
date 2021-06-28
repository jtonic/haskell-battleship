module Cli.Type where

import           RIO

data Options =
  Options {
    command      :: Commands,
    verbose      :: Bool,
    outputFormat :: OutputFormat,
    dryRun       :: Bool,
    saveState    :: Bool
    } deriving (Show)

data OutputFormat
  = OutPutFormatString
  | OutputFormatFile FilePath
  deriving (Show)

data Commands =
    Engine {
        engineName      :: String
        , engineTimeout :: Int
    }
    | Client {
        clientPort      :: Int
        , clientTimeout :: Int
    }

     deriving (Show)
