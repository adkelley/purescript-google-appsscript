// module Google.AppsScript.Menu
"use strict";


exports.addItemImpl = function (caption, funcName, menu) {
    return function () {
        return menu.addItem( caption, funcName );
    }
}

exports.addToUi = function (menu) {
    return function () {
       return menu.addToUi();
    }
} // Menu -> GASEff Void

exports.addSubMenu = function (submenu) {
    return function (menu) {
        return menu.addSubMenu( submenu );
    }
}

exports.addSeparator = function (menu) {
    return function () {
        return menu.addSeparator();
    }
}
