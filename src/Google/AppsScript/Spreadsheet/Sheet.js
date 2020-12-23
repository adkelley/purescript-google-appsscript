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

exports.getRangeImpl = function (range) {
    return function (sheet) {
        return function () {
            switch (range.notation.constructor.name) {
            case "A1":
                return sheet.getRange(range.a1);
                break;
            case "R1C1":
                return sheet.getRange( range.row, range.column
                                     , range.numRows, range.numColumns
                                     )
                break;
            default:
                throw 'getRange: Arguments must be in A1 or R1C1 Notation'
            };
        };
    };
}; // RangeArgs -> Sheet -> GASEff Range

exports.setName = function (name) {
    return function (sheet) {
        return function () {
            return sheet.setName(name);
        }
    }
}
