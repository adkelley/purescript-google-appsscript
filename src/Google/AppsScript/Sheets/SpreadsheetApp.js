"use strict";

// SpreadsheetApp functions

exports.app = function () {
   return SpreadsheetApp;
}

exports.getActiveRange = function (sheet) {
    return function () {
        return sheet.getActiveRange();
    }
} // SpreadsheetApp -> GASEff Range

exports.getUi = function (app) {
    return function () {
        return app.getUi();
    }
}

exports.openById = function (id) {
    return function (app) {
        return function () {
            return app.openById(id)
        }
    }
} // String -> SpreadsheetApp -> GASEff Spreadsheet

exports.getActiveRange = function (sheet) {
    return function () {
        return sheet.getActiveRange();
    }
} // SpreadsheetApp -> GASEff Range

exports.setActiveRange = function (range) {
    return function (sheet) {
        return function () {
            return sheet.setActiveRange(range);
        }
    }
} // Range -> Sheet -> GASEff Range

exports.getActiveSheet = function (app) {
    return function () {
       return app.getActiveSheet();
    }
} // SpreadsheetApp -> GASEff Sheet

exports.setActiveSheet = function (sheet) {
    return function (app) {
        return function () {
            return app.setActiveSheet(sheet);
        }
   }
} // SpreadsheetApp -> Sheet -> GASEff Sheet