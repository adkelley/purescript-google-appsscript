// module Google.AppsScript.HTML.HtmlService
//
"use strict";


exports.htmlService = function () {
    return HtmlService;
}

exports.createHtmlOutputFromFileImpl = function (file, html) {
    return function () {
        return html.createHtmlOutputFromFile(file);
    };
};

exports.createHtmlOutputImpl = function (file, html) {
    return function () {
        return html.createHtmlOutput(file);
    };
};
