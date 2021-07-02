
module Engine.Model.Domain where

import           RIO

type Name = String

type CoordX = Int

type CoordY = Int

-- fixme: temporarily
type UUID = String

newtype Team =
  Team
    { teamName :: Name
    }
  deriving (Show)

newtype Score =
  Score
    { scoreValue :: Int
    }
  deriving (Show)

newtype Matrix a =
  Matrix
    { matrixCanvas :: [[a]]
    }
  deriving (Show)

newtype Id =
  Id
    { idValue :: UUID
    }
  deriving (Show)

newtype Hp =
  Hp
    { remaining :: Int
    }
  deriving (Show)

newtype Symbol =
  Symbol
    { symbolValue :: Char
    }
  deriving (Show)

data TournamentState
  = New
  | Playing
  | Ended
  | Cancelled
  deriving (Show)

data Direction
  = North
  | South
  | West
  | East

data Tournament =
  Tournament
    { tournamentId                            :: String
    , tournamentName                          :: Name
    , tournamentState                         :: TournamentState
    , tournamentNoGames                       :: Int
    , tournamentBattleshipRegistrationTimeout :: Int
    , tournamentShootingTimeout               :: Int
    , tournamentEndRoundsAfterAllTeamsShot    :: Bool
    }
  deriving (Show)

data ScoreDto =
  ScoreDto
    { scoreTeam  :: String
    , scoreScore :: Int
    }
  deriving (Eq, Ord, Show)

data TournamentResult =
  TournamentResult
    { tournamentResultState   :: TournamentState
    , tournamentResultGameId  :: String
    , tournamentResultRoundNo :: Int
    , tournamentResultScores  :: [ScoreDto]
    }
  deriving (Show)

data RegisteredBattleship =
  RegisteredBattleship
    { registeredBattleshipGameId    :: String
    , registeredBattleshipX         :: CoordX
    , registeredBattleshipY         :: CoordY
    , registeredBattleshipDirection :: Direction
    }

data Shot =
  Shot
    { shotX :: CoordX
    , shotY :: CoordY
    }
  deriving (Eq, Ord, Show)

data Result =
  Result
    { resultX      :: CoordX
    , resultY      :: CoordY
    , resultResult :: ShotResult
    }
  deriving (Show)

data ShotResult
  = Miss Score
  | Hit Score
  | Kill Score
  deriving (Show)

data GameRound =
  GameRound
    { gameRoundBattleground :: Matrix BattlegroundCell
    , gameRoundScores       :: [ScoreDto]
    , gameRoundResults      :: [Result]
    }
  deriving (Show)

data BattlegroundCell =
  BattlegroundCell
    { battlegroundCell       :: Cell
    , battlegroundBattleship :: Battleship
    }
  deriving (Show)

data Cell =
  Cell
    { symbol :: Symbol
    , hp     :: Hp
    }
  deriving (Show)

-- fixme: Add the following in the model
{-
data class BodyCell(override val symbol: Symbol) : Cell(symbol, 1.hp)
data class CoreCell(override val symbol: Symbol, override val hp: Hp) : Cell(symbol, hp)
data class BodyCell(override val symbol: Symbol) : Cell(symbol, 1.hp)
object CollisionCell : Cell(Symbol('±'))
-}

data Battleship =
  Battleship
    { battleshipId   :: Id
    , battleshipBody :: Matrix Cell
    }
  deriving (Show)

data BattlegroundCellDto =
  BattlegroundCellDto
    { battlegroundCellDtoHp     :: Int
    , battlegroundCellDtoScores :: [ScoreDto]
    , battlegroundCellResults   :: [Result]
    }
  deriving (Show)

-- fixme: fix the following in model
{-
enum class ShotResult(val score: Score) {
    MISS(0.points), HIT(5.points), KILL(20.points)
}
 -}
