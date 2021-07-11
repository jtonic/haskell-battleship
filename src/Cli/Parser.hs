module Cli.Parser(
    optionsParser
) where

import           Cli.Types           (Command (..), Options (..),
                                      OutputFormat (..))
import           Options.Applicative as O
import           RIO

oOutputFormat :: O.Parser OutputFormat
oOutputFormat = oOutputFormatString <|> oOutputFormatFile
  where
    oOutputFormatFile = OutputFormatFile <$> outputFormatFile
    outputFormatFile =
      O.strOption
        (O.long "output-format-file" <>
         O.help "Output the result as file" <> O.metavar "FILE")
    oOutputFormatString :: O.Parser OutputFormat
    oOutputFormatString =
      O.flag'
        OutPutFormatString
        (O.long "output-format-string" <> O.help "Output the result as string (default)")

oCommands :: O.Parser Command
oCommands =
  O.hsubparser
    (O.command "engine" (O.info oEngine $ O.progDesc "Start the game engine.")
     <> O.commandGroup "Engine command:" <> O.metavar "Engine COMMAND")
  <|> O.hsubparser
    (O.command "client" (O.info oClient $ O.progDesc "Run the client app.")
    <> O.commandGroup "Client command:" <> O.metavar "Client COMMAND")

  where
    oEngine :: Parser Command
    oEngine =
      Engine <$> oEngineName <*> oEngineDefaultTimeout <*> oEngineKafkaBrokerList <*> oSchemaRegistryUrl <*> oHttpPort <*> oSqliteDbPath
    oEngineName =
      O.strOption $ O.long "engine-name" <> O.help "The engine name."
    oEngineDefaultTimeout =
      O.option auto $  O.long "engine-default-timeout" <> O.value -1 <> O.showDefault <> O.help "Default engine timeout (-1 means no timeout)"
    oEngineKafkaBrokerList =
      O.option auto $ O.long "kafka-broker-list" <> O.value "localhost:9092" <> O.showDefault <> O.metavar "URL" <> O.help "Kafka brokers list"
    oSchemaRegistryUrl =
      O.option auto $ O.long "schema-registry-url" <> O.value "http://localhost:8081" <> O.showDefault <> O.metavar "URL" <> O.help "Avro schema registry URL."
    oHttpPort =
      O.option auto $  O.long "http-port" <> O.value 8080 <> O.showDefault <> O.metavar "INT" <> O.help "Server http port"
    oSqliteDbPath =
      O.option auto $ O.long "sql-lite-db-path" <> O.value "companion/db/battleship.db" <> O.showDefault <> O.metavar "FILE" <> O.help "Kafka brokers list"

    oClient =
      Client <$> oClientPort <*> oClientHttpApiUrl
    oClientPort :: Parser Int
    oClientPort = O.option auto $ O.long "client-port" <> O.value 8080 <> O.showDefault <> O.help "Client port"
    oClientHttpApiUrl = O.option auto $ O.long "client-http-api-url" <> O.value "localhost:8080" <> O.showDefault <> O.help "Web (Http) API url"

optionsParser :: O.Parser Options
optionsParser =
  Options <$> oCommands <*> optional oOutputFormat <*> oVerbosity
  where
    oVerbosity = O.switch $ O.long "verbose" <> O.short 'v' <> O.help "verbosity"
