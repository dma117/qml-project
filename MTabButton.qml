import QtQuick 2.0
import QtQuick.Controls 2.0

TabButton {
    id: control
    text: "Button"
    font.bold: focus ? true : false

    contentItem: Text {
        text: control.text
        font: control.font
        color: "#000"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        border.width: 1
        border.color: "#000"
        color: control.focus ? "lightgray" : "#fff"
    }
}
