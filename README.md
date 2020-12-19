# PureScript Google AppScript

PureScript bindings for Google AppScript Services, such as Google Sheets, Google Docs, etc.

## Change log
**0.2.1**

This release has several breaking changes:
1. Restructured the modules name space to better match the Google Workspace Services and Script Services name spaces, such as `Base`, `Spreadsheet`, `Document`, and `Forms`.  For example, in 0.1.0, the module name space `Google.AppsScript.SpreadsheetApp` was transformed to `Google.AppsScript.Sheets.SpreadSheetApp` in 0.2.0. See [Google Apps Script Reference](https://developers.google.com/apps-script/reference) which shows how Google has 
2. By adding new workspace services: (e.g., `Drive`), the `app` function has been renamed to `DriveApp`, `SpreadsheetApp`, `DocumentApp` etc.
3. Nullable methods such as `getActiveSpreadsheet` now return `GASEff (Maybe Spreadsheet)`
4. Optional arguments will be supported using extensible records. This is a work-in-progress to convert methods, such as `Spreadsheet.toast` that take optional arguements. Methods, such as Sheet.getRange2, Sheet.getRange3 will be deprecated.

In addition:
1. Methods are now fully documented based on their Google Apps Script documentation pages.
2. Added numerous methods from Google Workspace Services to `Base`, `Spreadsheet`, `Sheet`, `Range` and `Spreadsheet App`
3. Added `Sheets.ConvertA1` which converts a cell reference from A1Notation to 0-based or 1-based indices. This is a utility function that is not part of Google Services.

## TODO
1. Add tests using dummy spreadsheet
