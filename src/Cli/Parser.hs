module Cli.Parser(
    optionsParser
) where

import           Cli.Type            (Commands (..), Options (..),
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
        (O.long "output-format-string" <> O.help "Output the result as string")

oCommands :: O.Parser Commands
oCommands =
  O.subparser
    (O.command "engine" $
     O.info oEngine $ O.progDesc "Start the game engine.")
  <|> O.subparser
    (O.command "client" $
     O.info oClient $ O.progDesc "Run the client app.")

  where
    oEngine :: Parser Commands
    oEngine =
      Engine <$> oEngineName <*> oEngineDefaultTimeout
    oEngineName :: Parser String
    oEngineName =
      O.strOption $ O.long "engine-name" <> O.help "The engine name."
    oEngineDefaultTimeout :: Parser Int
    oEngineDefaultTimeout =
      O.option auto $
      O.long "engine-default-timeout" <>
      O.value -1 <>
      O.help "Default engine timeout"

    oClient =
      Client <$> oClientPort <*> oClientTimeout
    oClientPort :: Parser Int
    oClientPort = O.option auto $ O.long "client-port" <> O.value 8080 <> O.help "Client port"
    oClientTimeout :: Parser Int
    oClientTimeout = O.option auto $ O.long "client-timeout" <> O.value -1 <> O.help "Client timeout"

optionsParser :: O.Parser Options
optionsParser =
  Options <$> oCommands <*> oVerbosity <*> oOutputFormat <*> oDryRun <*>
  oSaveState
  where
    oVerbosity =
      O.switch (O.long "verbose" <> O.short 'v' <> O.help "verbosity")
    oDryRun = O.switch (O.long "dry-run" <> O.help "Dry run the command")
    oSaveState =
      O.switch
        (O.long "save-state" <>
         O.help
           "Save the state of the command. Useful for subsequent state base commands.")
