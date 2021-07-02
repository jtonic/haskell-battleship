{-# LANGUAGE NamedFieldPuns    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# OPTIONS_GHC -Wno-unused-matches #-}

module Engine.Battleship where

import           Lens.Micro.TH
import           RIO
import           RIO.Text
import           RIO.Time
import           Util.Log      (infoM)

data Engine = Engine {
        _engineName      :: String
        , _engineTimeout :: Int
    } deriving (Show)

makeLenses ''Engine

loggerName :: String
loggerName = "Battleship"

run' :: Engine -> IO ()
run' eng = do
    infoM loggerName $ show eng
    runRIO eng $ startEng >> switchAppName "modified" >> sayTime >> stopEng

startEng :: RIO Engine ()
startEng = do
    eng <- ask
    say $ "Starting the engine '" <> pack (view engineName eng) <> "' ..."

switchAppName :: Text -> RIO Engine ()
switchAppName postfix = do
    eng <- ask
    let eng' = set engineName (view engineName eng <> "-" <> unpack postfix) eng
    say $ "Engine name changed from '" <> pack (view engineName eng) <> "' to '" <> pack (view engineName eng') <> "'."

stopEng :: RIO Engine ()
stopEng = do
    eng <- ask
    say "Stopping the engine."

sayTime :: RIO env ()
sayTime = do
    now <- getCurrentTime
    say $ "Started at time: " <> pack (show now)

say :: Text -> RIO env ()
say msg = do
    liftIO $ infoM "Battleship" $ unpack msg
