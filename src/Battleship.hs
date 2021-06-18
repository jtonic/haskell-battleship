{-# LANGUAGE OverloadedStrings #-}

module Battleship (
    run
) where

import           RIO
import           RIO.Text
import           RIO.Time
import           System.IO (hPutStrLn)

data App = App {
    appName          :: Text
    , appDescription :: Text
    , appHandle      :: Handle
}

run :: IO ()
run = do
    let app :: App
        app = App {
            appName = "Battleship"
            , appDescription = "Battleship game"
            , appHandle = stderr
            }
    runRIO app $ do
        startApp >> showTime
        stopApp

startApp :: RIO App ()
startApp = do
    App name desc _ <- ask
    say $ "Stopping the app." <> " Name: " <> name <> ", desc: " <> desc

stopApp :: RIO App ()
stopApp = do
    App name desc _ <- ask
    say $ "Stopping the app." <> " Name: " <> name <> ", desc: " <> desc

showTime :: RIO App ()
showTime = do
    now <- getCurrentTime
    say $ "Started at time: " <> pack (show now)

say :: Text -> RIO App ()
say msg = do
    App _ _ h <- ask
    liftIO $ hPutStrLn h $ unpack msg
