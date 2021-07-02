{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Tmp.Optics.Ex2 where

import           Lens.Micro.TH
import           Prelude
import           RIO

data Foo =
  Foo
    { _x :: Int
    , _y :: Bool
    }
  deriving (Show)

makeLensesWith (lensRules & generateLazyPatterns .~ True) ''Foo

-- $(makeLenses ''Foo)
lensedFoo :: Foo
lensedFoo = undefined & x .~ 8 & y .~ True

run :: IO ()
run = do
  print lensedFoo
  let x' = view x lensedFoo
   in print x'
  let y' = view y lensedFoo
   in print y'
  let modif = set x (view x lensedFoo + 10) lensedFoo in print modif

