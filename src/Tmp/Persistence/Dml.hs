{-# LANGUAGE OverloadedStrings #-}

module Tmp.Persistence.Dml (
    saveMessage,
    getMessages
) where

import           Database.SQLite.Simple (Only (Only, fromOnly), execute, query_,
                                         withConnection)
import           RIO
import           Tmp.WebApi.Types       (Message)

saveMessage :: FilePath -> Message -> IO ()
saveMessage dbFile msg = withConnection dbFile
    $ \conn -> execute conn "INSERT INTO messages VALUES (?)" (Only msg)

getMessages :: FilePath -> IO [Message]
getMessages dbFile = do
    fmap (map fromOnly)
        $ withConnection dbFile
        $ \conn -> query_ conn "SELECT msg FROM messages"
