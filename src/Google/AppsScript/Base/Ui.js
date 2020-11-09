// module Google.AppsScript.Ui

"use strict";

exports.alertImpl = function (buttons, msg, ui) {
    return function () {
        switch (ui.alert(msg)) {
            case ui.Button.CLOSE:
                return buttons[0];
            case ui.Button.OK:
                return buttons[1];
            case ui.Button.CANCEL:
                return buttons[2];
            case ui.Button.YES:
                return buttons[3];
            case ui.Button.NO:
            default:
                return buttons[4];
        }
    }
}

function buttonSet(ui, btns) {
    switch (btns.constructor.name) {
        case 'OkCancel':
            return ui.ButtonSet.OK_CANCEL;
            break;
        case 'YesNo':
            return ui.ButtonSet.YES_NO;
            break;
        case 'YesNoCancel':
            return ui.ButtonSet.YES_NO_CANCEL;
            break;
        case 'OkAlone':
        default:
            return ui.ButtonSet.OK;
            break;
    }
}

exports.alertButtonsImpl = function (buttons, msg, btns, ui) {
    return function () {
        switch (ui.alert(msg, buttonSet(ui, btns))) {
            case ui.Button.CLOSE:
                return buttons[0];
            case ui.Button.OK:
                return buttons[1];
            case ui.Button.CANCEL:
                return buttons[2];
            case ui.Button.YES:
                return buttons[3];
            case ui.Button.NO:
            default:
                return buttons[4];
        }
    }
}

exports.alertTitleImpl = function (buttons, title, msg, btns, ui) {
    return function () {
        switch (ui.alert(title, msg, btnset(ui, btns))) {
            case ui.Button.CLOSE:
                return buttons[0];
            case ui.Button.OK:
                return buttons[1];
            case ui.Button.CANCEL:
                return buttons[2];
            case ui.Button.YES:
                return buttons[3];
            case ui.Button.NO:
            default:
                return buttons[4];
        }
    }
}

exports.showSidebarImpl = function (html, ui) {
    return function () {
        ui.showSidebar(html);
        return {};
    }
}

exports.createAddonMenu = function (ui) {
    return function () {
        return ui.createAddonMenu();
    }
}

// String -> Ui -> GASEff Menu
exports.createMenu = caption => ui => () => ui.createMenu(caption);

// String -> Ui -> GASEff PromptResponse
exports.prompt = prompt => ui => () => ui.prompt(prompt);

// String -> ButtonSet -> Ui -> GASEff PromptResponse
exports.promptButtons = prompt => buttons => ui => () => ui.prompt(prompt, buttonSet(ui, buttons));

// String -> ButtonSet -> Ui -> GASEff PromptResponse
exports.promptTitle = title => prompt => buttons => ui => () => ui.prompt(title, prompt, buttonSet(ui, buttons));


exports.showModalDialogImpl = function (html, title, ui) {
    return function () {
        ui.showModalDialog(html, title);
        return {};
    }
}

exports.showModelessDialogImpl = function (html, title, ui) {
    return function () {
        ui.showModelessDialog(html, title);
        return {};
    }
}
