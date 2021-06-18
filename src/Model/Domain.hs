module Model.Domain (
    Target,
    target
) where

data Target = Target {
    x :: Int
    , y :: Int
} deriving (Show)

target :: Target
target = Target 10 20
