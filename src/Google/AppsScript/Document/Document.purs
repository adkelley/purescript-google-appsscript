module Google.AppsScript.Document.Document (getBody) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Document.Types (Body, Document)

foreign import getBody :: Document -> GASEff Body