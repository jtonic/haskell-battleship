{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric  #-}

module Tmp.WebApi.Types where

import           Data.Aeson         (FromJSON, ToJSON)
import           Data.Aeson.Types   ()
import           Data.Time.Calendar (Day)
import           RIO

type Message = String

data User = User
  { name              :: String
  , age               :: Int
  , email             :: String
  , registration_date :: Day
  } deriving (Eq, Show, Generic, ToJSON, FromJSON)
