"use strict";

exports.replaceText = function (searchPattern) {
    return function (replacement) {
        return function (body) {
            return function () {
                return body.replaceText(searchPattern, replacement);
            }
        }
    }
}