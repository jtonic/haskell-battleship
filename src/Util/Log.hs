module Util.Log (
    module Util.Log,
    LOG.infoM,
    LOG.warningM,
    LOG.errorM,
    LOG.criticalM,
) where

import           Data.Function
import           RIO
import           System.Log.Formatter      as LOG
import           System.Log.Handler        as LOG hiding (setLevel)
import           System.Log.Handler.Simple as LOG
import           System.Log.Logger         as LOG

initLogger :: IO ()
initLogger = do
  logger <- LOG.getRootLogger
  handler <- LOG.streamHandler stdout LOG.INFO
  let f = LOG.simpleLogFormatter "[$time : $loggername : $prio] $msg"
  LOG.saveGlobalLogger $
    logger
      & LOG.setHandlers [LOG.setFormatter handler f]
      & LOG.setLevel LOG.INFO
