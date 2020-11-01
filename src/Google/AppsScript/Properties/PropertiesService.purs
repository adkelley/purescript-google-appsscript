module Google.AppsScript.Properties.PropertiesService
( Properties
, getDocumentProperties
, getScriptProperties
, getUserProperties
) where

import Google.AppsScript.AppsScript (GASEff)

foreign import data Properties :: Type

-- | Gets a property store (for this script only) that all users can access 
-- | within the open document, spreadsheet, or form.
foreign import getDocumentProperties :: GASEff Properties

-- | Gets a property store that all users can access, but only within this script.
foreign import getScriptProperties :: GASEff Properties

-- | Gets a property store that only the current user can access, and only within 
-- | this script.
foreign import getUserProperties :: GASEff Properties
