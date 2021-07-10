{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE KindSignatures             #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE QuasiQuotes                #-}
{-# LANGUAGE RankNTypes                 #-}
{-# LANGUAGE ScopedTypeVariables        #-}
{-# LANGUAGE TypeOperators              #-}


module Tmp.WebApi.Server where

import           Control.Monad.Extra        ()
import           Control.Monad.Reader       ()
import           Data.Attoparsec.ByteString ()
import           Data.List                  ()
import           Data.Maybe                 ()
import           Data.String.Conversions    ()
import           Data.String.Interpolate    (__i'L, i)
import qualified Network.Wai.Handler.Warp   as W
import           RIO                        hiding (Handler)
import           Servant
import           Tmp.WebApi.Data            (users)
import           Tmp.WebApi.Types
import System.IO.Extra

type UserAPI = "users" :> Get '[JSON] [User]
             :<|> "users" :> ReqBody '[JSON] User
                         :> Post '[JSON] NoContent


newUser :: User -> Handler NoContent
newUser u = do
    liftIO $ putStrLn [__i'L|
        Create user:
        #{show u}
    |]
    return NoContent


server :: Server UserAPI
server = getUsers
    :<|> newUser
    where
        getUsers :: Handler [User]
        getUsers = return users


userAPI :: Proxy UserAPI
userAPI = Proxy

app1 :: Application
app1 = serve userAPI server

run :: IO ()
run = do
    putStrLn [i|Starting the HTTP server on port #{port}...|]
    W.run port app1

    where
        port = 8080

users' :: [User]
users' = users

