import QtQuick 2.0

Column {
    id: container

    property date dateTime: new Date()

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: container.dateTime = new Date()
    }

    Text {
        id: time
        anchors.horizontalCenter: parent.horizontalCenter

        color: config.fujiWhite

        text : Qt.formatTime(container.dateTime, "hh:mm")
        
        font.family: config.Font
        font.pointSize: 72
    }

    Text {
        id: date
        anchors.horizontalCenter: parent.horizontalCenter

        color: config.fujiWhite

        text : Qt.formatDate(container.dateTime, "dddd dd, MMMM yyyy")
        
        font.family: config.Font
        font.pointSize: 24
    }

    anchors {
        margins: 10
        top: parent.top
        right: parent.right
    }
}
