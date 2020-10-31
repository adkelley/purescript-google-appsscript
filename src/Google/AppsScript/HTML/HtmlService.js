// module Google.AppsScript.HTML.HtmlService
//
"use strict";

exports.createHtmlOutputFromFileImpl = function (file, html) {
    return function () {
        return html.createHtmlOutputFromFile(file);
    }
}