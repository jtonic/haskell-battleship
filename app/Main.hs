module Main where

import           Cli.Parser
import           Dispatcher  (run)
import           Options.Applicative as O
import           RIO
import           Util.Log            (infoM, initLogger)

main :: IO ()
main = do
    initLogger
    opts' <- execParser opts
    infoM "Main" $ show opts'
    run opts'
    return ()
    where
        opts = info (optionsParser <**> helper)
            (fullDesc
            <> progDesc "Battleship"
            <> header "Battleship game"
            )
