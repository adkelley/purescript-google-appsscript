module Google.AppsScript.Spreadsheet.Sheet
  ( activate
  , copyTo
  , getLastColumn
  , getLastRow
  , getMaxColumns
  , getMaxRows
  , getName
  , getRange
  , setName
  , Notation(..)
  , RangeArgs
  ) where

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Spreadsheet.Types (Column, Range, Row, Sheet, Spreadsheet)

-- | Activates this sheet. Does not alter the sheet itself, only the parent's 
-- | notion of the active sheet.
foreign import activate :: Sheet -> GASEff Sheet

-- | Copies the sheet to a given spreadsheet, which can be the same spreadsheet as the source. 
-- | The copied sheet is named "Copy of [original name]".
foreign import copyTo :: Sheet -> Spreadsheet -> GASEff Sheet

-- | Returns the position of the last column that has content.
foreign import getLastColumn :: Range -> GASEff Column

-- | Returns the position of the last row that has content.
foreign import getLastRow :: Range -> GASEff Row

-- | Returns the current number of columns in the sheet, regardless of content.
foreign import getMaxColumns :: Sheet -> GASEff Int

-- | Returns the current number of rows in the sheet, regardless of content.
foreign import getMaxRows :: Sheet -> GASEff Int

-- | Returns the name of the sheet.
foreign import getName :: Sheet -> GASEff String

data Notation = R1C1 | A1 | Undefined

type RangeArgs = { notation :: Notation
                 , a1 :: String
                 , row :: Int
                 , column :: Int
                 , numRows :: Int
                 , numColumns :: Int
                 }

foreign import getRangeImpl :: RangeArgs -> Sheet -> GASEff Range

-- TODO: Handle Notation = Undefined
-- TODO: Handle minimum # of parameters must be row, column
getRange :: (RangeArgs -> RangeArgs) -> Sheet -> GASEff Range
getRange mkArgs sheet =
  let args = mkArgs { notation: Undefined
                    , a1: ""
                    , row: 0, column: 0
                    , numRows: 1, numColumns: 1
                    }
  in getRangeImpl args sheet
  

---- | Sets the sheet name.
foreign import setName :: String -> Sheet -> GASEff Sheet
