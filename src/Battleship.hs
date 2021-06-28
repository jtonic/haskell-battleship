{-# LANGUAGE NamedFieldPuns, OverloadedStrings #-}

module Battleship where

import           RIO
import           RIO.Text
import           RIO.Time
import Util.Log (infoM)

loggerName :: String
loggerName = "Battleship"

data App = App {
    appName          :: Text
    , appDescription :: Text
}

run :: IO ()
run = do
    let app :: App
        app = App {
            appName = "Battleship"
            , appDescription = "Battleship game"
            }
    runRIO app $ startApp >> sayTime >> stopApp

startApp :: RIO App ()
startApp = do
    App name desc <- ask
    say $ "Starting the app." <> " Name: " <> name <> ", desc: " <> desc

stopApp :: RIO App ()
stopApp = do
    App name desc <- ask
    say $ "Stopping the app." <> " Name: " <> name <> ", desc: " <> desc

sayTime :: RIO env ()
sayTime = do
    now <- getCurrentTime
    say $ "Started at time: " <> pack (show now)

say :: Text -> RIO env ()
say msg = do
    liftIO $ infoM "Battleship" $ unpack msg
