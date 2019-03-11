{-# LANGUAGE OverloadedStrings #-}
module Download
      (
        getImgurGallery
       ,filterTags
      ) where

import Network.Wreq

-- Operators such as (&) and (.~).
import Control.Lens
import Control.Monad
import Control.Monad.IO.Class
import Control.Applicative
import Data.Maybe

-- Conversion of Haskell values to JSON.
import Data.Aeson (toJSON)

-- Easy traversal of JSON data.
import Data.Aeson.Lens (key, nth)

import Text.HTML.TagSoup
import Text.HTML.TagSoup.Match

getImgurGallery identity = do
  r <- get ("https://imgur.com/gallery/" ++ identity)
  let tags = parseTags <$> r ^? responseBody
  return $ maybe [] id tags

filterTags tags =
  mapM_ print [ t | t <- tags,
    tagOpen (\x -> x == "a") (const True) t]
