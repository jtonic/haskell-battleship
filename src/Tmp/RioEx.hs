module Tmp.RioEx where

import RIO
import Prelude (putStrLn)
import RIO.Text (unpack)


data App = App {
    appName:: Text
    , appDescription :: Text
}

run :: IO ()
run = runApp sayHello

runApp :: RIO App a -> IO a
runApp inner = do
    let app = App {
        appName = "RIO App"
        , appDescription = "RIO App Description"
    }
    runRIO app inner

sayHello :: RIO App ()
sayHello = do
    App name _ <- ask
    liftIO $ putStrLn $ "Hello, " <> unpack name <> "!!!"
