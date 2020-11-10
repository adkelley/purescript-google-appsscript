module Google.AppsScript.Drive.File
  ( getId
  , makeCopy
  , setName
  ) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Drive.Types (File)

-- | Gets the ID of the File.
foreign import getId :: File -> GASEff String

-- | Creates a copy of the file.
foreign import makeCopy :: File -> GASEff File

-- | Sets the name of the File.
foreign import setName :: String -> File -> GASEff File
