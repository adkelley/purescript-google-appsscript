"use strict";

exports.setActiveRange = function (range) {
    return function (sheet) {
        return function () {
            return sheet.setActiveRange(range);
        }
    }
} // Range -> Sheet -> GASEff Range

exports.getSheetId = function (sheet) {
    return function () {
        return sheet.getSheetId();
    }
} // Sheet -> GASEff Int

exports.getSheetByNameImpl = function (just) {
    return function (nothing) {
        return function (name) {
            return function (spreadsheet) {
                return function () {
                    const sheet = spreadsheet.getSheetByName(name);
                    return sheet !== null ? just(sheet) : nothing
                }
            }
        }
    }
} // (Sheet -> Maybe Sheet) -> Maybe Sheet -> String -> Spreadsheet -> GASEff (Maybe Sheet)

exports.getSheets = function (spreadsheet) {
    return function () {
        return spreadsheet.getSheets();
    }
}

exports.insertSheet = function (spreadSheet) {
    return function () {
        return spreadSheet.insertSheet();
    }
}

exports.insertSheetIndex = function (index) {
    return function (spreadSheet) {
        return function () {
            return spreadSheet.insertSheet(index);
        }
    }
}