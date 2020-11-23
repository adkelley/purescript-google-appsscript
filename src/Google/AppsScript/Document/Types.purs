module Google.AppsScript.Document.Types
  ( Body
  , Document
  , DocumentApp
  , Element
  ) where

-- | The document service creates and opens Documents that can be edited.
foreign import data DocumentApp :: Type

-- | A document, containing rich text and elements such as tables and lists.
-- | Documents may be opened or created using DocumentApp.
foreign import data Document :: Type

-- | the active document body section
foreign import data Body :: Type

-- | A generic element. Document contents are represented as elements. For 
-- | example, ListItem, Paragraph, and Table are elements and inherit all of the 
-- | functions defined by Element, such as getType().
foreign import data Element :: Type

