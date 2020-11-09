"use strict";

exports.activate = function (sheet) {
    return function () {
        return sheet.activate();
    }
} // Sheet -> GASEff Sheet

exports.copyTo = function (sheet) {
    return function (spreadsheet) {
        return function () {
            return sheet.copyTo(spreadsheet);
        }
    }
} // Sheet -> Spreadsheet -> Sheet

exports.getLastColumn = function (range) {
    return function () {
        return range.getLastColumn();
    }
} // Range -> GASEff Column

exports.getLastRow = function (range) {
    return function () {
        return range.getLastRow();
    }
} // Range -> GASEff Row

exports.getMaxRows = function (sheet) {
    return function () {
        return sheet.getMaxRows();
    }
} // Sheet -> GASEff Int

exports.getMaxColumns = function (sheet) {
    return function () {
        return sheet.getMaxColumns();
    }
} // Sheet -> GASEff Int

exports.getName = function (sheet) {
    return function () {
        return sheet.getName();
    }
} //Sheet -> GASEff String

exports.getRange = function (range) {
    return function (sheet) {
        return function () {
            return sheet.getRange(range);
        }
    }
} // String -> Sheet -> GASEff Range

exports.getRange2Impl = function (r, c, sheet) {
    return function () {
        return sheet.getRange(r, c);
    }
} // Fn3 Row Column Sheet (GASEff Range)

exports.getRange3Impl = function (r, c, rs, sheet) {
    return function () {
        return sheet.getRange(r, c, rs);
    }
} // Fn4 Row Column Int Sheet (GASEff Range)

exports.getRange4Impl = function (r, c, rs, cs, sheet) {
    return function () {
        return sheet.getRange(r, c, rs, cs);
    }
} // Fn5 Row Column Int Int Sheet (GASEff Range)

exports.setName = function (name) {
    return function (sheet) {
        return function () {
            return sheet.setName(name);
        }
    }
}
