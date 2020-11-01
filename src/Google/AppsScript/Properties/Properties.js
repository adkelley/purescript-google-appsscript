"use strict";

exports.deleteAllProperties = function (p) {
    return function () {
        return p.deleteAllProperties();
    }
} //::Properties -> GASEff Properties
exports.deletePropertyImpl = function (key, p) {
    return function () {
        return p.deleteProperty(key);
    }
} //::String -> Properties -> GASEff Properties
exports.getKeys = function (p) {
    return function () {
        return p.getKeys();
    }
} //::Properties -> GASEff (Array String)
exports.getProperties = function (p) {
    return function () {
        return p.getProperties();
    }
} //::Properties -> GASEff Props
exports.getPropertyImpl = function (key, p) {
    return function () {
        return p.getProperty(key);
    }
} //::String -> Properties -> GASEff String
exports.setPropertiesImpl = function (props, p) {
    return function () {
        return p.setProperties(props);
    }
} //::Props -> Properties -> GASEff Properties
exports.setPropertyImpl = function (key, value, p) {
    return function () {
        return p.setProperty(key, value);
    }
} //::String -> String -> Properties -> GASEff Properties
