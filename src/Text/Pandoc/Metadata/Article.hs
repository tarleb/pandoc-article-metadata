{- |
Copyright: © 2020 Albert Krewinkel
SPDX-License-Identifier: MIT
Maintainer: Albert Krewinkel <albert@zeitkraut.de>

Metadata details of (scholarly) articles.
-}
module Text.Pandoc.Metadata.Article
  ( Article (..)
  , AuthorNotes (..)
  , CorrespondenceInfo (..)
  )
  where

import Data.Text (Text)
import Text.Pandoc.Definition (Block, Inline)

-- | Article info
data Article = Article
  { publisherId :: Maybe Text
  , doi :: Maybe Text
  , pmid :: Maybe Text
  , pmcid :: Maybe Text
  , artAcessId :: Maybe Text -- ^ what's this?
  , heading :: [Inline]
  , categories :: [[Inline]]
  , authorNotes :: Maybe AuthorNotes
  , volume :: Maybe Text
  , issue :: Maybe Text
  , fpage :: Maybe Text -- ^ first page
  , lpage :: Maybe Text -- ^ last page
  }

-- | Author details.
-- FIXME: move to Author?
data AuthorNotes = AuthorNotes
  { corrsp :: [CorrespondenceInfo] -- ^ ID and email
  , conflict :: [Block]  -- ^ conflicts of interest declarations
  , con :: [Block]       -- ^ contributed-by information
  }

-- | Contact info of a corresponding author.
data CorrespondenceInfo = CorrespondenceInfo
  { id :: Int
  , corrEmail :: Text  -- ^ named just @email@ in template
  }
