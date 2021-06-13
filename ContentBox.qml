import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQml 2.12


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
            text: root.title
            anchors {
                centerIn: topRect
            }
            font.pointSize: 10
            font.bold: true
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

        ListView {
            width: bottomRect.width
            height: bottomRect.height

            ListModel {
                id: dataModel

                ListElement {
                    name: "Курс:"
                    value: 45
                    units: "°"
                }
                ListElement {
                    name: "Скорость вперед:"
                    value: 3.25
                    units: "м/с"
                }
                ListElement {
                    name: "Скорость вправо:"
                    value: 100
                    units: "м/с"
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
