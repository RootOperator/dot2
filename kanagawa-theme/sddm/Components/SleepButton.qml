import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    implicitHeight: sleepButton.height
    implicitWidth: sleepButton.width
    Button {
        id: sleepButton
        height: inputHeight
        width: inputHeight
        hoverEnabled: true
        icon {
            source: Qt.resolvedUrl("../icons/sleep.svg")
            height: height
            width: width
            color: config.fujiWhite
        }
        background: Rectangle {
            id: sleepButtonBg
            color: config.sumiInk1
            radius: 3
        }
        states: [
            State {
                name: "hovered"
                when: sleepButton.hovered
                PropertyChanges {
                    target: sleepButtonBg
                    color: config.sumiInk2
                }
            }
        ]
        transitions: Transition {
            PropertyAnimation {
                properties: "color"
                duration: 300
            }
        }
        onClicked: sddm.suspend()
    }
}
