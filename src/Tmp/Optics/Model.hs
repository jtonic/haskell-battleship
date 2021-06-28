{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE InstanceSigs #-}

module Tmp.Optics.Model where


import RIO (IO, Monad (return))
import Prelude ( String, Double, Show, (+), print )

data Atom = Atom { _element :: String, _point :: Point } deriving (Show)
data Point = Point { _x :: Double, _y :: Double } deriving (Show)

data Molecule = Molecule { _atoms :: [Atom] } deriving (Show)

atom :: Atom
atom = Atom { _element = "C", _point = Point { _x = 1.0, _y = 2.0 } }

shiftAtomX :: Atom -> Atom
shiftAtomX (Atom e (Point x y)) = Atom e (Point (x + 1) y)

run :: IO ()
run = do
    let atm = shiftAtomX atom
    print atm
    return ()
