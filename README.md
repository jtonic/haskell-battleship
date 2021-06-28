# haskell-battleship

## Description
Battleship (carrier class) it is a very popular and engaging game. I used to play it extensively in my childhood. So the development of this project has to be a pleasant way of learning Haskell for production.
A short game description could be found on [wikipedia](https://en.wikipedia.org/wiki/Battleship_(game))
This project is about the implementation of the game, and additional companions, in Haskell programming language and using only Haskell ecosystem.

## Goals
1. This project (written entirely in Haskell) is meant to be used along the path of [getting Haskell used in a production project](doc/haskell_to_production.md).
2. This is gonna be used as part of my 2021 PTDP (Personal Technical Development Plan).
   It is split in two phases
    - Phase [a] which spans the first 3 months (starting with March)
    - Phase [b] which spans the rest of the year.
    __Goals:__
      By the end of 2021 the battleship application with all the technologies/technics exposed [here](doc/haskell_to_production.md) shall be implemented.

## How to build and run

1. Build the application in watch mode

    `stack build --fast --file-watch`

2. Test the application in watch mode and

    `stack test --fast --file-watch`

3. Build the application considering the performance ghc switches

    `stack build`

 1. Run the engine cli command

    `stack exec -- battleship engine --engine-name ubots --engine-default-timeout 100  --output-format-string`

 2. Run the client cli command

    `stack exec -- battleship client --output-format-string`



## Useful links
1. [Learning material](./doc/learning_material.md)
