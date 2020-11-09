module Google.AppsScript.Sheets.Sheet
  ( activate
  , copyTo
  , getLastColumn
  , getLastRow
  , getMaxColumns
  , getMaxRows
  , getName
  , getRange
  , getRange2
  , getRange3
  , getRange4
  , setName
  ) where

import Data.Function.Uncurried (Fn3, Fn5, Fn4, runFn5, runFn4, runFn3)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Sheets.Types (Column, Range, Row, Spreadsheet, Sheet)

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

foreign import getRange :: String -> Sheet -> GASEff Range

foreign import getRange2Impl :: Fn3 Row Column Sheet (GASEff Range)

foreign import getRange3Impl :: Fn4 Row Column Int Sheet (GASEff Range)

foreign import getRange4Impl :: Fn5 Row Column Int Int Sheet (GASEff Range)

foreign import setName :: String -> Sheet -> GASEff Sheet

getRange2 :: Row -> Column -> Sheet -> GASEff Range
getRange2 row col sheet = runFn3 getRange2Impl row col sheet

getRange3 :: Row -> Column -> Int -> Sheet -> GASEff Range
getRange3 row col rows sheet = runFn4 getRange3Impl row col rows sheet

getRange4 :: Row -> Column -> Int -> Int -> Sheet -> GASEff Range
getRange4 row col rows cols sheet = runFn5 getRange4Impl row col rows cols sheet
