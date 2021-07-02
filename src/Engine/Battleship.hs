{-# LANGUAGE NamedFieldPuns    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-unused-matches #-}

module Engine.Battleship where

import           RIO
import           RIO.Text
import           RIO.Time
import           Util.Log (infoM)

data Engine = Engine {
        engineName      :: String
        , engineTimeout :: Int
    } deriving (Show)


loggerName :: String
loggerName = "Battleship"

run' :: Engine -> IO ()
run' eng = do
    runRIO eng $ startApp >> sayTime >> stopApp

startApp :: RIO Engine ()
startApp = do
    eng <- ask
    say $ "Starting the engine " <> pack (engineName eng) <> " ..."

stopApp :: RIO Engine ()
stopApp = do
    eng <- ask
    say "Stopping the engine."

sayTime :: RIO env ()
sayTime = do
    now <- getCurrentTime
    say $ "Started at time: " <> pack (show now)

say :: Text -> RIO env ()
say msg = do
    liftIO $ infoM "Battleship" $ unpack msg
