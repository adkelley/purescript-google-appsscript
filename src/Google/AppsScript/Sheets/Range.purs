module Google.AppsScript.Sheets.Range
  ( getA1Notation
  , getCell
  , getColumn
  , getFormula
  , getLastColumn
  , getLastRow
  , getNumColumns
  , getNumRows
  , getRow
  , getValue
  , getValues
  , setDateValue
  , setStringValue
  ) where

import Data.Function.Uncurried (Fn3, runFn3)
import Foreign (Foreign)
import Data.JSDate (JSDate)

import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Sheets.Types (Row, Column, Formula, Range)

-- | Returns a string description of the range, in A1 notation.
foreign import getA1Notation :: Range -> GASEff String

-- | Returns the starting column position for this range.
foreign import getColumn :: Range -> GASEff Column

-- | Returns the formula (A1 notation) for the top-left cell of the range, or 
-- | an empty string if the cell is empty or doesn't contain a formula.
foreign import getFormula :: Range -> GASEff Formula

-- | Returns the end column position.
foreign import getLastColumn :: Range -> GASEff Column

-- | Returns the end row position.
foreign import getLastRow :: Range -> GASEff Row

-- | Returns the number of columns in this range.
foreign import getNumColumns :: Range -> GASEff Int

-- | Returns the number of rows in this range.
foreign import getNumRows :: Range -> GASEff Int

-- | Returns the row position for this range.
foreign import getRow :: Range -> GASEff Row

-- | Returns the value of the top-left cell in the range.
foreign import getValue :: Range -> GASEff Foreign

-- | Returns a two-dimensional array of values, indexed by row, then by column.
-- | The values may be of type Number, Boolean, Date, or String, depending on the value of the cell. 
-- | Empty cells are represented by an empty string in the array. The array is indexed from [0][0].
foreign import getValues :: Range -> GASEff (Array (Array Foreign))

-- | Sets the value of the range. The value can be numeric, 
-- | string, boolean or date. If it begins with '=' it is interpreted as a formula.
foreign import setStringValue :: String -> Range -> GASEff Range
foreign import setDateValue :: JSDate -> Range -> GASEff Range

-- | Returns a given cell within a range.
getCell :: Row -> Column -> Range -> GASEff Range
getCell row col range = runFn3 getCellImpl range row col

foreign import getCellImpl :: Fn3 Range Row Column (GASEff Range)