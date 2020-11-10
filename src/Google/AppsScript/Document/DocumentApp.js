"use strict";

exports.documentApp = function () {
    return DocumentApp;
} // GASEff DocumentApp

exports.create =  function (name) {
    return function (documentApp) {
        return function () {
            return documentApp.create(name);
        }
    }
} // String -> DocumentApp -> GASEff Document