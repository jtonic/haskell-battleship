{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}

module Tmp.Kafka.Serde.Model
( ShotEvent(..)
, schema'ShotEvent
) where

import Data.Avro.Deriving

deriveAvroFromByteString [r|
{
  "type": "record",
  "name": "ShotEvent",
  "namespace": "ro.jtonic.apps.battleship.avro",
  "fields": [
    { "name": "tournamentId", "type": "string" },
    { "name": "gameId", "type": "string" },
    { "name": "roundNo", "type": "int" },
    { "name": "x", "type": "int" },
    { "name": "y", "type": "int" }
  ]
}
|]
