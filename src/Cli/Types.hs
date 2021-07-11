module Cli.Types (
  Options(..),
  OutputFormat(..),
  Command(..),
) where

import           RIO

data Options =
  Options {
    command        :: Command
    , outputFormat :: Maybe OutputFormat
    , verbose      :: Bool
    } deriving (Show)

data OutputFormat
  = OutPutFormatString
  | OutputFormatFile FilePath
  deriving (Show)

data Command =
    Engine {
        engineName                :: String
        , engineTimeout           :: Int
        , engineKafkaBrokerList   :: String
        , engineSchemaRegistryUrl :: String
        , engineHttpPort          :: Int
        , engineSqliteDbPath      :: String
    }
    | Client {
        clientPort         :: Int
        , clientHttpApiUrl :: String
    }

     deriving (Show)
