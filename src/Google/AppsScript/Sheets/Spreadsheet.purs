module Google.AppsScript.Sheets.Spreadsheet
( Spreadsheet
, getSheetId
, setActiveRange
) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Sheets.Sheet (Sheet)
import Google.AppsScript.Sheets.Range (Range)

-- | Access and modify Google Sheets files.
foreign import data Spreadsheet :: Type

-- | Returns the ID of the sheet represented by this object.
foreign import getSheetId :: Sheet -> GASEff Int

-- | Sets the specified range as the active range in the active sheet, with 
-- | the top left cell in the range as the current cell.
foreign import setActiveRange :: Range -> Sheet -> GASEff Range