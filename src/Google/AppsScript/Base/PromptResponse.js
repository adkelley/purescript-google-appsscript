"use strict";

// PromptResponse -> GASEff String
exports.getResponseText = promptResponse => () => promptResponse.getResponseText();

// PromptReponse -> GASEff Button
exports.getSelectedButtonImpl = function (buttons, promptResponse, ui) {
    return function () {
        switch (promptResponse.getSelectedButton()) {
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