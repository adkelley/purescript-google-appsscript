module Google.AppsScript.Spreadsheet.Types
  ( Column
  , Formula
  , Id
  , Range
  , Row
  , Sheet
  , Sheets
  , Spreadsheet
  , SpreadsheetApp
  ) where

type Column
  = Int

type Formula
  = String

type Id
  = String

type Row
  = Int

-- | Access and modify spreadsheet ranges.
foreign import data Range :: Type

-- | Access and modify spreadsheet sheets.
foreign import data Sheet :: Type

type Sheets = Array Sheet

-- | Access and modify Google Sheets files.
foreign import data Spreadsheet :: Type

-- | Access and create Google Sheets files
foreign import data SpreadsheetApp :: Type
