module Cli.Parser(
    optionsParser
) where

import           Cli.Type            (Command (..), Options (..),
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

oCommand :: O.Parser Command
oCommand =
  O.subparser
    (O.command "engine" $
     O.info oEngine $ O.progDesc "Start the game engine.")
  where
    oEngine =
      Engine <$> oEngineName <*> oEngineDefaultTimeout
    oEngineName =
      O.strOption $ O.long "engine-name" <> O.help "The engine name."
    oEngineDefaultTimeout =
      O.option auto $
      O.long "engine-default-timeout" <>
      O.value -1 <>
      O.help "Default engine timeout"

optionsParser :: O.Parser Options
optionsParser =
  Options <$> oCommand <*> oVerbosity <*> oOutputFormat <*> oDryRun <*>
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
