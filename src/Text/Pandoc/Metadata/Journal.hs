{- |
Copyright: © 2020 Albert Krewinkel
SPDX-License-Identifier: MIT
Maintainer: Albert Krewinkel <albert@zeitkraut.de>

Metadata definitions for (scholarly) journals.
-}
module Text.Pandoc.Metadata
  ( Journal (..)
  )
  where

import Data.Text (Text)
import Text.Pandoc.Definition (Block, Inline)

-- | Journal info
data Journal = Journal
  { journalTitle      :: [Inline]
  , abbrevTitle       :: Maybe Text
  , eIssn             :: Maybe Text -- ^ ISSN for electronic publication
  , pIssn             :: Maybe Text -- ^ ISSN for print publication
  , publisherName     :: Text
  , publisherLocation :: Text
  }
