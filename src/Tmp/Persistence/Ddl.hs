{-# LANGUAGE OverloadedStrings #-}

module Tmp.Persistence.Ddl where

import           Database.SQLite.Simple (execute_, withConnection)
import           RIO

initDB :: FilePath -> IO ()
initDB dbFile = withConnection dbFile $ \conn ->
    execute_ conn
    "CREATE TABLE IF NOT EXISTS messages (msg text not null)"
