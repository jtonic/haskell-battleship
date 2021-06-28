{-# LANGUAGE NamedFieldPuns, OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-matches #-}

module Battleship where

import           RIO
import           RIO.Text
import           RIO.Time
import Util.Log (infoM)
import Cli.Type

loggerName :: String
loggerName = "Battleship"

run :: Options -> IO ()
run opt = do
    runRIO opt $ startApp >> sayTime >> stopApp

startApp :: RIO Options ()
startApp = do
    opt <- ask
    say $ "Starting the app. Verbose mode: " <> pack (show $ verbose opt)
    -- say $ "Starting the app." <> " Name: " <> opt <> ", desc: " <> desc

stopApp :: RIO Options ()
stopApp = do
    opt <- ask
    say $ "Stopping the app."
    -- say $ "Stopping the app." <> " Name: " <> name <> ", desc: " <> desc

sayTime :: RIO env ()
sayTime = do
    now <- getCurrentTime
    say $ "Started at time: " <> pack (show now)

say :: Text -> RIO env ()
say msg = do
    liftIO $ infoM "Battleship" $ unpack msg
