import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import ShipData 1.0
import movable_object 1.0;
import AUVData 1.0
import AUVDataControl 1.0

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

                MContainer {
                    x: 30
                    y: 80
                    title: "Данные коробля"

                    ContentBox {
                        width: 250
                        height: 200

                        id: dataShipBox

                        dataModel: ShipDataModel { }

                        dataDelegate: ContentBoxDelegate {
//                           view.model.setProperty(index, "value", value * 2);
//                           MouseArea {
//                               anchors.fill: parent
//                              onContainsMouseChanged: ListView.model.setProperty(index, "value", value * 2)
//                           }
                        }
                    }

                    onSettingsClickedAction: function() {
                        var window = Qt.createQmlObject("ContentBoxSettings {
                                        titleWindow: 'Настройки данных корабля'
                                        currentModel: dataShipBox.dataModel}",
                                        mainContent);
                    }
                }

                MContainer {
                    x: root.width - dataAUVBox.width - 40
                    y: 80
                    title: "Данные АНПА"

                    ContentBox {
                        width: 250
                        height: 200

                        id: dataAUVBox

                        dataModel: AUVDataModel { }

                        dataDelegate: ContentBoxDelegate { }
                    }

                    onSettingsClickedAction: function() {
                        var window = Qt.createQmlObject("ContentBoxSettings {
                                        titleWindow: 'Настройки данных АНПА'
                                        currentModel: dataAUVBox.dataModel}",
                                        mainContent);

                    }
                }
            }
        }

        Item {
            id: second

            Rectangle {
                anchors.fill: parent
                color: "yellow"

                MContainer {
                    id: container
                    title: "Управление АНПА"

                    width: 250
                    height: 200

                    ComboBox {
                        id: comboBox
                        anchors.left: parent.left
                        anchors.right: parent.right

                        currentIndex: -1
                        model: ["First", "Second", "Third"]
                        displayText: currentIndex != -1 ? currentText : "Выбрать команду"
                        font.pointSize: 9
                    }

                    CheckBox {
                        width: parent.width
                        text: "Постоянная отправка"
                        font.pointSize: 9
                        anchors.top: comboBox.bottom
                    }

                    MButton {
                        width: parent.width / 2

                        anchors {
                            bottom: parent.bottom
                            horizontalCenter: parent.horizontalCenter
                        }

                        text: "Отправить"
                        font.pointSize: 9
                    }

                    onSettingsClickedAction: function() {
                        var window = Qt.createQmlObject("AUVControlSettings {
                                        titleWindow: 'Настройки управления АНПА'}",
                                        mainContent);

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

                    onPositionChanged: {
                        ship.xPosition = mouseX
                        ship.yPosition = mouseY
                    }
                }

                Rectangle {
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
                }
            }
        }
    }
}
