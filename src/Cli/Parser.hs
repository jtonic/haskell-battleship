module Cli.Parser(
    optionsParser
) where

import           Cli.Type            (Command (..), Options (..),
                                      OutputFormat (..))
import           Options.Applicative as O
import           RIO

oOutputFormat :: O.Parser OutputFormat
oOutputFormat = oOutputFormatString O.<|> oOutputFormatFile
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
    (O.command "new-tenant" $
     O.info oNewTenant $ O.progDesc "Onboard a new tenant")
  where
    oNewTenant =
      NewTenant <$> oTenantName <*> oIpcGroup <*> oTemplateDir <*> oOutputDir
    oTenantName =
      O.strOption $ O.long "tenant-name" <> O.help "The name of the new tenant"
    oIpcGroup =
      O.strOption $
      O.long "ipc-group" <>
      O.value "A" <>
      O.help "The IPC group the new tenant is gonna be deployed on"
    oTemplateDir =
      O.strOption $
      O.long "template-dir" <>
      O.value "../new_tenant_template" <>
      O.help
        "The template directory used to generate the new tenant configuration" <>
      O.metavar "DIR"
    oOutputDir =
      O.strOption $
      O.long "output-dir" <>
      O.help
        "The directory where the new template configuration will be saved into" <>
      O.metavar "DIR"

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
