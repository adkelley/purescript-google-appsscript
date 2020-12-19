module Google.AppsScript.Spreadsheet.Utilities (Cell, cellA1ToIndex, showCell) where

import Prelude

import Foreign (Foreign)
import Unsafe.Coerce (unsafeCoerce)

foreign import cellA1ToIndexImpl :: String -> Int -> Foreign

type Cell = { row :: Int
            , column :: Int
            }

showCell :: Cell -> String
showCell cell = "Cell = { row: " <> (show cell.row) <> ", column: " <> (show cell.column) <> " }"

-- | Convert a cell reference from A1Notation to 0-based indices (for arrays)
-- | or 1-based indices (for Spreadsheet Service methods).
-- | cellA1   Cell reference to be converted.
-- | index    Indicate 0 (array) or 1 (i.e. for Spreadsheet Service methods)
-- | Note this function doesn't exist in the Sheets workspace
cellA1ToIndex :: String -> Int -> Cell
cellA1ToIndex cellA1 index =
  mapForeignToCell $ cellA1ToIndexImpl cellA1 index
  where
    mapForeignToCell :: Foreign -> Cell
    mapForeignToCell = unsafeCoerce
