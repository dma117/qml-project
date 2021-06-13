import QtQuick 2.0
import QtQuick.Controls 2.0

Button {
    id: control
    text: "Button"

    background: Rectangle {
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        border.width: 1
        border.color: "black"
        color: control.down ? "#17a81a" : "#21bfaf"
        radius: 2
    }
}
