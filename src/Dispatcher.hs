{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# OPTIONS_GHC -Wno-unused-local-binds #-}

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
    infoM logger "engine cmd"
    let eng = B.Engine {..}
    putStrLn (show eng)
    B.run' eng
    return ()
dispatch Options {command = T.Client {..}} = do
    infoM logger "client cmd"
    let _ = Client {..}
    return ()
