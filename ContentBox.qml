import QtQuick 2.0
import QtQuick.Layouts 1.12


Item {
    id: root
    width: 300
    height: 200

    Rectangle {
        id: topRect
        width: root.width
        height: root.height / 3
        color: "red"
        anchors {
            top: parent.top
        }
        border {
            color: "gray"
            width: 5
        }
    }

    Rectangle {
        id: bottomRect
        y: topRect.y + topRect.height - topRect.border.width
        width: root.width
        height: 3 * root.height / 4
        color: "green"
        border {
            color: "gray"
            width: 5
        }
    }
}
