"use strict";

exports.getBody = function (document) {
    return function () {
        return document.getBody();
    }
}