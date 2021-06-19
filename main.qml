import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import movable_object 1.0;

Window {
    id: root
    minimumWidth: 1080
    minimumHeight: 720
    visible: true
    title: qsTr("QMLProject")
    color: "blue"

    Item {
        id: header
        z: 1
        width: parent.width
        height: 60
        anchors.top: parent.top

        NavPanel {
            id: navigation
            anchors.margins: 7
        }
    }

    StackLayout {
        z: 0
        id: mainContent
        anchors.fill: parent


        currentIndex: navigation.currentIndex

        Item {
            id: first

            Rectangle {
                anchors.fill: parent
                color: "pink"

                ContentBox {
                   anchors.centerIn: parent
                   title: "Данные корабля"
                }
            }
        }

        Item {
            id: second
            Rectangle {
                anchors.fill: parent
                color: "yellow"

                MContainer {
                    id: cont
                    //anchors.centerIn: parent
                    title: "Управление АНПА"

                    Rectangle {
                        id: content1
                        width: 200
                        height: 250
                        color: "pink"

                        ComboBox {
                            currentIndex: -1
                            model: ["First", "Second", "Third"]
                            displayText: currentIndex != -1 ? currentText : "Выбрать команду"

                            anchors.left: parent.left
                            anchors.right: parent.right
                        }

                        CheckBox {
                            text: "Постоянная отправка"
                            anchors.centerIn: parent
                        }

                        MButton {
                            text: "Отправить"
                            anchors.bottom: content1.bottom
                            anchors.right: content1.right
                        }
                    }
                }

            }
        }

        Item {
            id: third
            Rectangle {
                anchors.fill: parent
                color: "brown"

                Moveable {
                    id: ship
                    onXPositionChanged: animationX.start()
                    onYPositionChanged: animationY.start()
                }

                MouseArea {
                    id: mouse
                    anchors.fill: parent
                    hoverEnabled: true

                    onPositionChanged: {
                        moveable.xPosition = mouseX
                        moveable.yPosition = mouseY
                    }
                }

                Rectangle {
                    id: box
                    width: 100
                    height: 100
                    x: 150
                    y: 150

                    NumberAnimation on x {
                        id: animationX
                        duration: 300
                        to: moveable.xPosition
                    }

                    NumberAnimation on y {
                        id: animationY
                        duration: 300
                        to: moveable.yPosition
                    }

                    Ship {}
                }

            }
        }
    }
}
