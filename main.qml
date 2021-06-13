import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    minimumWidth: 1080
    minimumHeight: 720
    visible: true
    title: qsTr("Hello World")
    color: "blue"

    Item {
        id: header
        width: parent.width
        height: 60
        anchors.top: parent.top

        NavPanel {
            anchors.margins: 7
        }
    }

    Rectangle {
        id: mainContent
        width: parent.width
        height: parent.height - 60
        color: "red"
        anchors {
            bottom: parent.bottom
        }
    }
}
