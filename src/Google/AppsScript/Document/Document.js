"use strict";

exports.getBody = function (document) {
    return function () {
        return document.getBody();
    }
}

exports.element = {};

exports.getUrl = function (document) {
    return function () {
        return document.getUrl();
    };
}; // Document -> GASEff String

exports.getName = function (document) {
    return function () {
        return document.getName();
    };
}; // Document -> GASEff String
