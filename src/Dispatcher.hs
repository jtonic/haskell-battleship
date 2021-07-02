{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# OPTIONS_GHC -Wno-unused-local-binds #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}

module Dispatcher where

import           Cli.Type          as T

import           Engine.Battleship as B
import           Prelude           (putStrLn)
import           RIO
import Util.Log            (infoM)

logger :: String
logger = "Dispatcher"

run :: Options -> IO ()
run = dispatch

dispatch :: Options -> IO ()
dispatch Options {command = T.Engine {..}} = do
    let eng = B.Engine {_engineName = engineName, _engineTimeout = engineTimeout}
    putStrLn (show eng)
    B.run' eng
    return ()
dispatch Options {command = T.Client {..}} = do
    let _ = Client {..}
    return ()
