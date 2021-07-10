module Tmp.WebApi.Data where


import           Data.Time        (fromGregorian)
import           Tmp.WebApi.Types

newton :: User
newton = User "Isaac Newton"    372 "isaac@newton.co.uk" (fromGregorian 1683  3 1)

einstein :: User
einstein = User "Albert Einstein" 136 "ae@mc2.org"         (fromGregorian 1905 12 1)

users :: [User]
users = [newton, einstein]
