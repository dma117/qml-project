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

                MouseArea {
                    id: mouse
                    anchors.fill: parent

                    onClicked: {
                        shipSprite.movable_component.xPosition = mouseX
                        shipSprite.movable_component.yPosition = mouseY
                    }
                }

                PathView {
                    z: 1
                    id: directionLine
                    path: Path {
                        startX: shipSprite.xPrevPos
                        startY: shipSprite.yPrevPos
                        PathLine {
                            x: shipSprite.xPos;
                            y: shipSprite.yPos;
                        }
                    }
                    model: 50
                    delegate: Rectangle {
                        width: 4; height: 4
                        color: "green"
                    }
                }


                Ship {
                    id: shipSprite
                    width: 100
                    height: 100
                    x: 150
                    y: 150
                    onPositionChanged: directionLine.pathChanged()
                }
            }
        }
    }
}
