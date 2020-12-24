module Google.AppsScript.Document.Document ( element
                                           , getBody
                                           , getUrl
                                           , getName
                                           ) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Document.Types (Body, Document, Element)

foreign import getBody :: Document -> GASEff Body

-- | Similar to unit, return an empty element object. Note this is not part of
-- | Google Apps Script but useful when finding/replacing text in a document body
foreign import element :: Element

-- | Retrieves the URL to access the current document.
foreign import getUrl :: Document -> GASEff String

-- | Retrieves the title of the current document.
foreign import getName :: Document -> GASEff String
