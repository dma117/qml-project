import QtQuick 2.0
import QtQuick.Controls 2.0

Button {
    id: control

    contentItem: Text {
        text: qsTr("Button")
    }

    background: Rectangle {
        implicitWidth: control.width
        implicitHeight: control.height
        opacity: enabled ? 1 : 0.3
        border.width: 1
        border.color: "#000"
        color: control.down ? "lightgray" : "#fff"
    }
}
