import QtQuick 2.0
import QtQuick.Controls 2.0

Button {
    id: control
    property bool transparent: false

    contentItem: Text {
        text: qsTr("Button")
    }

    background: Rectangle {
        implicitWidth: control.width
        implicitHeight: control.height
        opacity: enabled ? 1 : 0.3
        border.width: transparent ? 0 : 1
        border.color: "#000"
        color: control.down ? "lightgray" : (transparent ? "transparent" : "#fff")
    }
}
