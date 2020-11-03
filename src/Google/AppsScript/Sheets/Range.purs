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
  ) where

import Data.Function.Uncurried (Fn3, runFn3)
import Foreign (Foreign)
import Google.AppsScript.AppsScript (GASEff)
import Google.AppsScript.Sheets.Types (Row, Column, Formula, Range)

-- | Returns a string description of the range, in A1 notation.
foreign import getA1Notation :: Range -> GASEff String

foreign import getCellImpl :: Fn3 Range Row Column (GASEff Range)

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

-- | Returns a given cell within a range.
getCell :: Row -> Column -> Range -> GASEff Range
getCell row col range = runFn3 getCellImpl range row col
