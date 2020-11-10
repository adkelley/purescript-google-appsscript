"use strict";

exports.getId = function (file) {
    return function () {
        file.getId();
    }
} // File -> GASEff String

exports.makeCopy = function (file) {
    return function () {
        return file.makeCopy();
    }
} // File -> GASEff File

exports.setName = function (fileName) {
    return function (file) {
        return function () {
            file.setName(fileName);
        }
    }
} // String -> File -> GASEff File