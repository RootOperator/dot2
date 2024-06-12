import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
  id: userField
  height: inputHeight
  width: inputWidth
  selectByMouse: true
  echoMode: TextInput.Normal
  selectionColor: config.waveBlue2
  renderType: Text.NativeRendering
  font {
    family: config.Font
    pointSize: config.FontSize
    bold: true
  }
  color: config.fujiWhite
  horizontalAlignment: Text.AlignHCenter
  placeholderText: "Username"
  placeholderTextColor: config.fujiWhite
  text: userModel.lastUser
  background: Rectangle {
    id: userFieldBackground
    color: config.sumiInk2
    radius: 3
  }
  transitions: Transition {
    PropertyAnimation {
      properties: "color"
      duration: 300
    }
  }
}
