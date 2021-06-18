import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQml 2.12
import ShipData 1.0

Item {
    id: root
    width: 300
    height: 200
    property string title: ""

    Rectangle {
        id: topRect
        width: root.width
        height: root.height / 3
        color: "gainsboro"
        anchors {
            top: parent.top
        }
        border {
            color: "gray"
            width: 5
        }
        Text {
            id: titleText
            text: root.title
            anchors {
                verticalCenter: topRect.verticalCenter
                left: topRect.left
                leftMargin: topRect.border.width * 3
            }
            font.pointSize: 10
            font.bold: true
        }
        MButton {
            implicitWidth: topRect.height - topRect.border.width * 3
            implicitHeight: topRect.height - topRect.border.width * 3
            transparent: true
            anchors {
                verticalCenter: titleText.verticalCenter
                right: topRect.right
                rightMargin: topRect.border.width * 2
            }

            contentItem: Image {
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                source: "images/settings.png"
            }
         }
    }

    Rectangle {
        id: bottomRect
        y: topRect.y + topRect.height - topRect.border.width
        width: root.width
        height: 3 * root.height / 4

        border {
            color: "gray"
            width: 5
        }

        ShipDataModel {
            id: displayedData
        }

        ListView {
            id: dataList
            width: bottomRect.width
            height: bottomRect.height
            interactive: false

            ListModel {
                id: dataModel


                Component.onCompleted: {
                    append({name: "Курс", value: displayedData.direction.toFixed(2), units: "°"})
                    append({name: "Скорость вперед", value: displayedData.forwardSpeed.toFixed(2), units: "м/с"})
                    append({name: "Скорость вправо", value: displayedData.rightSpeed.toFixed(2), units: "м/с"})
                }
            }

            Component {
                id: dataDelegate

                Column {
                    width: bottomRect.width
                    height: (bottomRect.height - bottomRect.border.width) / dataModel.count

                    Text {
                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: parent.left
                            leftMargin: bottomRect.border.width * 2
                        }
                        text: name
                        font.pointSize: 9
                    }
                    Text {
                        anchors {
                            verticalCenter: parent.verticalCenter
                            right: parent.right
                            rightMargin: bottomRect.border.width * 2
                        }
                        text: value + " " + units
                        font {
                           pointSize: 9
                           bold: true
                        }
                    }
                }
            }

            model: dataModel
            delegate: dataDelegate
        }
    }
}
