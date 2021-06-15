import QtQuick 2.0
import QtQuick.Controls 2.0

Button {
    id: control

    contentItem: Text {
             text: control.text
             font: control.font
             opacity: enabled ? 1.0 : 0.3
             color: "#000"
             horizontalAlignment: Text.AlignHCenter
             verticalAlignment: Text.AlignVCenter
             elide: Text.ElideRight
         }

         background: Rectangle {
             implicitHeight: 40
             opacity: enabled ? 1 : 0.3
             color: control.down ? "lightgray" : "#fff"
             border.color: "#000"
             border.width: 1
             radius: 2
         }
}
