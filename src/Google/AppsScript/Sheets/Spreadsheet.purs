module Google.AppsScript.Sheets.Spreadsheet
( getSheetId
, setActiveRange
) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Sheets.Types (Range, Sheet)


-- | Returns the ID of the sheet represented by this object.
foreign import getSheetId :: Sheet -> GASEff Int

-- | Sets the specified range as the active range in the active sheet, with 
-- | the top left cell in the range as the current cell.
foreign import setActiveRange :: Range -> Sheet -> GASEff Range