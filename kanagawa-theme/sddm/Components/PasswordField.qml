import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: passwordField
    focus: true
    selectByMouse: true
    placeholderText: "Password"
    placeholderTextColor: config.fujiWhite
    echoMode: TextInput.Password
    passwordCharacter: "•"
    passwordMaskDelay: config.PasswordShowLastLetter
    selectionColor: config.waveBlue2
    renderType: Text.NativeRendering
    font.family: config.Font
    font.pointSize: config.FontSize
    font.bold: true
    color: config.fujiWhite
    horizontalAlignment: TextInput.AlignHCenter
    background: Rectangle {
        id: passFieldBackground
        radius: 3
        color: config.sumiInk2
    }
    transitions: Transition {
        PropertyAnimation {
            properties: "color"
            duration: 300
        }
    }
}
