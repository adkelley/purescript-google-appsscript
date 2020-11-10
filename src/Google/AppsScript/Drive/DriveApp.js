"use strict";

exports.driveApp = function () {
    return DriveApp;
} // DriveApp

exports.getFileById = function (id) {
    return function (driveApp) {
        return function () {
            return driveApp.getFileById(id);
        }
    }
}