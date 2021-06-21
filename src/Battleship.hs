{-# LANGUAGE NamedFieldPuns #-}

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
    runRIO app $ startApp >> sayTime >> stopApp

startApp :: RIO App ()
startApp = do
    App name desc _ <- ask
    say $ "Starting the app." <> " Name: " <> name <> ", desc: " <> desc

stopApp :: RIO App ()
stopApp = do
    App name desc _ <- ask
    say $ "Stopping the app." <> " Name: " <> name <> ", desc: " <> desc

sayTime :: HasHandle env => RIO env ()
sayTime = do
    now <- getCurrentTime
    say $ "Started at time: " <> pack (show now)

say :: HasHandle env => Text -> RIO env ()
say msg = do
    h <- view handleL
    liftIO $ hPutStrLn h $ unpack msg

switchHandle :: HasHandle env => Handle -> RIO App env -> RIO App env
switchHandle h = local (set handleL h)

class HasHandle env where
    handleL :: Lens' env Handle

instance HasHandle Handle where
    handleL = id

instance HasHandle App where
    handleL = lens appHandle (\x y -> x {appHandle = y} )
