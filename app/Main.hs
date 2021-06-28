module Main where

import           Battleship
import           Cli.Parser
import           Options.Applicative as O
import           RIO
import           Util.Log            (infoM, initLogger)

main :: IO ()
main = do
    initLogger
    opts' <- O.execParser opts
    infoM "Main" $ show opts'
    run opts'
    where
        opts = info (optionsParser <**> helper)
            (fullDesc
            <> progDesc "Battleship"
            <> header "Battleship game"
            )
