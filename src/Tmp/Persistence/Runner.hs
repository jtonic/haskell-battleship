module Tmp.Persistence.Runner where

import           RIO

import           RIO.FilePath
import           System.Directory.Extra
import           System.IO.Extra
import           Tmp.Persistence.Ddl    (initDB)
import           Tmp.Persistence.Dml    (getMessages, saveMessage)

run :: IO ()
run = do
    dbFile <- getOrCreateDbFile defaultDbPath
    initDB dbFile
    saveMessage dbFile "This is it!"
    msgs <- getMessages dbFile
    mapM_ print msgs
    where
        defaultDbPath = "companion/db/battleship.db" :: FilePath
        getOrCreateDbFile filePath = do
            unlessM (doesFileExist filePath) (createDirectoryIfMissing True $ takeDirectory filePath)
            return filePath

