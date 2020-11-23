"use strict";

exports.driveApp = function () {
    return DriveApp;
} // DriveApp

//exports.getFileById = function (id) {
//    return function (driveApp) {
//        return function () {
//            return driveApp.getFileById(id);
//        }
//    }
//}

// TODO: User Either to report scripting exception
exports.getFileByIdImpl = function(just) {
    return function (nothing) {
        return function (id) {
            return function (driveApp) {
                return function () {
                    try {
                      return just(driveApp.getFileById(id));
                    } catch (e) {
                        return nothing;
                    }
                }
            }
        }
    }
}