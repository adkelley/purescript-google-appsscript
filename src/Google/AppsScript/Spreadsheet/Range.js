"use strict";

exports.getColumn = function (range) {
    return function () {
        return range.getColumn();
    }
} // Range -> GASEff Int

exports.getRow = function (range) {
    return function () {
        return range.getRow();
    }
} // Range -> GASEff Int

exports.getCellImpl = function (range, row, col) {
    return function () {
        return range.getCell( row, col );
    }
} // Range -> Row -> Column -> GASEff Range

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

exports.getNumRows = function (range) {
    return function () {
        return range.getNumRows();
    }
} // Range -> GASEff Int

exports.getNumColumns = function (range) {
    return function () {
        return range.getNumColumns();
    }
} // Range -> GASEff Int

exports.getA1Notation = function (range) {
    return function () {
        return range.getA1Notation();
    }
}

exports.getValue = function (range) {
    return function () {
        return range.getValue();
    }
} // Range -> GASEff Foreign

exports.getValues = function (range) {
	return function () {
		return range.getValues();
	}
} // Range -> GASEff (Array (Array Foreign))

exports.getFormula = function (range) {
    return function () {
        return range.getFormula();
    }
}

/*
** Using a type constructor 'SetValueArgs' to determine the type of the value argument
** Type constructor values such as Boolean, String, are reserved keywords.  Consequently
** The PureScript compiler prefixes them with '$$'
*/
exports.setValueImpl = function (value) {
    return function (range) {
        return function () {
            switch (value.type_.constructor.name) {
            case "$$Boolean":
                return range.setValue(value.boolean);
                break;
            case "$$Date":
                return range.setValue(value.date());
                break;
            case "Formula":
                return range.setValue(value.formula);
                break;
            case "$$Number":
                return range.setValue(value.number);
                break;
            case "$$String":
                return range.setValue(value.string);
                break;
            default:
                return range;
            };
        };
    };
}; // SetValueArgs -> Range -> GASEff Range
