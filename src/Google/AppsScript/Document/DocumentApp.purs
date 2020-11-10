module Google.AppsScript.Document.DocumentApp (documentApp, create) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Document.Types (Document, DocumentApp)

-- | The document service creates and opens Documents that can be edited.
foreign import documentApp :: GASEff DocumentApp

-- | Creates and returns a new document.
foreign import create :: String -> DocumentApp -> GASEff Document