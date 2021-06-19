import QtQuick 2.0
import QtQml 2.12
import QtQuick.Controls 2.5

Rectangle {
    id: container
    property string title: qsTr('')
    default property alias content: contentWrapper.children
    property var onSettingsClickedAction

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
        height: titleText.height * 3
        color: "gainsboro"
        anchors.top: parent.top
        z: 100

        border {
            color: "gray"
            width: 5
        }

        Text {
            id: offset
            text:  "  "
            anchors {
                verticalCenter: containerHead.verticalCenter
            }
            font.pointSize: 10
            font.bold: true
        }

        Text {
            id: titleText
            text: offset.text + container.title
            anchors {
                verticalCenter: containerHead.verticalCenter
            }
            font.pointSize: 10
            font.bold: true
        }

        MButton {
            id: settingsButton
            implicitWidth: titleText.height * 2
            implicitHeight: titleText.height * 2
            transparent: true
            anchors {
                verticalCenter: titleText.verticalCenter
                right: containerHead.right
                rightMargin: {
                    var availableOffset = ((containerHead.width - titleText.width -
                                          containerHead.border.width * 4)- width) / 2;

                    if (availableOffset < 0) {
                        containerHead.border.width;
                    } else {
                        Math.min(offset.width, availableOffset);
                    }
                }
            }

            contentItem: Image {
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                source: "images/settings.png"
            }

            onClicked: onSettingsClickedAction()
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
