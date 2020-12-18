module Google.AppsScript.Sheets.Spreadsheet
  ( getSheetId
  , getSheetByName
  , getSheets
  , setActiveRange
  , insertSheet
  , insertSheetIndex
  , setActiveSheet
  , toast
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Sheets.Types (Range, Sheet, Sheets, Spreadsheet)

-- | Returns the ID of the sheet represented by this object.
foreign import getSheetId :: Sheet -> GASEff Int

foreign import getSheetByNameImpl :: String -> Spreadsheet -> GASEff (Nullable Sheet)

-- | Returns a sheet with the given name.
getSheetByName :: String -> Spreadsheet -> GASEff (Maybe Sheet)
getSheetByName name spreadsheet = toMaybe <$> getSheetByNameImpl name spreadsheet

-- | Gets all the sheets in this spreadsheet.
foreign import getSheets :: Spreadsheet -> GASEff Sheets

-- | Sets the specified range as the active range in the active sheet, with 
-- | the top left cell in the range as the current cell.
foreign import setActiveRange :: Range -> Sheet -> GASEff Range

-- | Inserts a new sheet into the spreadsheet, using a default sheet name. 
-- | The new sheet becomes the active sheet.
foreign import insertSheet :: Spreadsheet -> GASEff Sheet

-- | Inserts a new sheet into the spreadsheet at the given index. 
-- | The new sheet becomes the active sheet.
foreign import insertSheetIndex :: Int -> Spreadsheet -> GASEff Sheet

-- | Sets the given sheet to be the active sheet in the spreadsheet. The Google 
-- | Sheets UI displays the chosen sheet unless the sheet belongs to a different spreadsheet.
foreign import setActiveSheet :: Sheet -> Spreadsheet -> GASEff Sheet

type ToastArgs = {msg :: String , title :: String , timeoutSeconds :: Int}

-- | Shows a popup window in the lower right corner of the spreadsheet with the given message.
foreign import toastImpl :: ToastArgs -> Spreadsheet -> GASEff Unit

toast :: (ToastArgs -> ToastArgs) -> Spreadsheet -> GASEff Unit
toast mkToastArgs spreadsheet =
  let args = mkToastArgs { msg: "", title: "", timeoutSeconds: 5}
  in toastImpl args spreadsheet
