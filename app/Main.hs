{-# LANGUAGE OverloadedStrings #-}
module Main where

import Wallpapers

main :: IO ()
main = do
  wallpapers <- getWallPapers
  loopBackgrounds wallpapers
  print "starting"
