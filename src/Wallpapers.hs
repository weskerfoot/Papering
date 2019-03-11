{-# LANGUAGE OverloadedStrings #-}
module Wallpapers
    ( getWallPapers
    , setBackground
    , loopBackgrounds
    ) where

import System.Directory
import System.Process

import Control.Applicative
import Control.Concurrent
import Download

fiveMinutes = 300000000

getWallPapers = do
  home <- getHomeDirectory
  setCurrentDirectory (home ++ "/wallpapers")
  wallpapers <- (listDirectory $ home ++ "/wallpapers")
  sequence $ makeAbsolute <$> wallpapers

setBackground :: FilePath -> IO ()
setBackground path = callCommand $ "/usr/bin/feh --bg-scale " ++ path

loopBackgrounds images = forkIO $ loopBackgrounds' (cycle images) where
  loopBackgrounds' (image:images) = do
    setBackground image
    threadDelay fiveMinutes
    loopBackgrounds' images
