module DriveApp (getFileById, driveApp) where

import Google.AppsScript.Drive.Types (DriveApp, File)
import Google.AppsScript.AppsScript (GASEff)

-- | Allows scripts to create, find, and modify files and folders in Google Drive.
foreign import driveApp :: GASEff DriveApp


-- | Gets the file with the given ID. Throws a scripting exception if the file 
-- | does not exist or the user does not have permission to access it.
-- | TODO: Handle scriptiing exception gracefully
foreign import getFileById :: String -> DriveApp -> GASEff File

