module DriveApp (getFileById, driveApp) where

import Data.Maybe (Maybe(..))
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Drive.Types (DriveApp, File)

-- | Allows scripts to create, find, and modify files and folders in Google Drive.
foreign import driveApp :: GASEff DriveApp

-- | Gets the file with the given ID. Throws a scripting exception if the file 
-- | does not exist or the user does not have permission to access it.
foreign import getFileByIdImpl ::
  (File -> Maybe File) -> Maybe File -> String -> DriveApp -> GASEff (Maybe File)

getFileById :: String -> DriveApp -> GASEff (Maybe File)
getFileById = getFileByIdImpl Just Nothing
