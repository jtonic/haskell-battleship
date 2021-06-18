module Battleship (
    run
) where

import Model.Domain ( target )

run :: IO ()
run = do
    print target
