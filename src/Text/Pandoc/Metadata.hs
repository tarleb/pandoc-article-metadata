{- |
Copyright: © 2020 Albert Krewinkel
SPDX-License-Identifier: MIT
Maintainer: Albert Krewinkel <albert@zeitkraut.de>

Metadata definitions for scholarly articles.
-}

module Text.Pandoc.Metadata
  ( ScholarlyArticle (..)
  , AuthorDetails (..)
  , AuthorInfo (..)
  , BaseInfo (..)
  , Date (..)
  , Journal (..)
  )
where

import Data.Text (Text)
import Text.Pandoc.Definition (Block, Inline)
import Text.Pandoc.Metadata.Journal (Journal (..))

-- | Scholarly article metadata.
data ScholarlyArticle = ScholarlyArticle
  { baseInfo    :: BaseInfo
  , journal     :: Journal
  }

-- | Core metadata information on a scholarly article.
data BaseInfo = BaseInfo
  { abstract    :: [Block]
  , author      :: [AuthorInfo]
  , date        :: Date
  , description :: Text
  , institute   :: [InstituteName]
  , keywords    :: [Text]
  , subtitle    :: [Inline]
  , title       :: [Inline]
  }

-- | Name of an institution with which an author is affiliated.
type InstituteName = [Inline]

-- | Destructured publication date.
data Date = Date
  { iso8601 :: Text
  , day     :: Text
  , month   :: Text
  , year    :: Text
  }

-- | Author metadata: either just a full name, or complete info including
-- surname and given names, and optionally contact info and affiliations.
data AuthorInfo
  = AuthorInfoFullName Text
  | AuthorInfoDetails AuthorDetails

data AuthorDetails = AuthorDetails
  { surname :: Text
  , givenNames :: Text
  , email :: Maybe Text
  , orcid :: Maybe Text
  , corId :: Maybe Int   -- ^ corresponding author ID
  , affId :: [Int]       -- ^ author affiliation ID
  }
