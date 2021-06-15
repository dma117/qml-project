import QtQuick 2.0
import QtQml 2.12

Rectangle {
    id: container
    property string title: qsTr('')
    default property alias content: contentWrapper.children

    Binding {
        target: container;
        property: "implicitWidth";
        value: contentWrapper.childrenRect.width + contentWrapper.anchors.margins * 2;
        delayed: true;
    }

    Binding {
        target: container;
        property: "implicitHeight";
        value: contentWrapper.childrenRect.height + contentWrapper.anchors.margins * 2;
        delayed: true;
    }

    Rectangle {
        id: containerHead
        width: container.width
        height: container.height / 3
        color: "gainsboro"
        anchors.top: parent.top
        z: 100

        border {
            color: "gray"
            width: 5
        }

        Text {
            text: container.title
            anchors.centerIn: containerHead
            font.pointSize: 10
            font.bold: true
        }
    }

    Rectangle {
        id: containderBody
        width: container.width
        height: 3 * container.height / 4
        y: containerHead.y + containerHead.height - containerHead.border.width
        z: 100
        border {
            color: "gray"
            width: 5
        }

        Rectangle {
            id: contentWrapper
            anchors.fill: parent
            anchors.margins: 10
            color: "white"
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: container
        drag.target: container
        drag.axis: Drag.XAndYAxis
        z: 0
    }
}
