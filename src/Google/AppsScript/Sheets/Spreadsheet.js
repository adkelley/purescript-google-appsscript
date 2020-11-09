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
} //Sheet -> GASEff Int

exports.getSheets = function (spreadSheet) {
    return function () {
        return spreadSheet.getSheets();
    }
}
