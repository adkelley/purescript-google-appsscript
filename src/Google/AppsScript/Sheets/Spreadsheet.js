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

exports.getSheetByNameImpl = function (name) {
    return function (spreadsheet) {
        return function () {
           return spreadsheet.getSheetByName(name);
        }
    }
} // String -> Spreadsheet -> GASEff (Nullable Sheet)

exports.getSheets = function (spreadsheet) {
    return function () {
        return spreadsheet.getSheets();
    }
}

exports.insertSheet = function (spreadsheet) {
    return function () {
        return spreadsheet.insertSheet();
    }
}

exports.insertSheetIndex = function (index) {
    return function (spreadsheet) {
        return function () {
            return spreadsheet.insertSheet(index);
        }
    }
}

exports.setActiveSheet = function (sheet) {
    return function (spreadsheet) {
        return function () {
            return spreadsheet.setActiveSheet(sheet);
        }
    }
}