import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import ShipData 1.0
import movable_object 1.0;
import AUVData 1.0
import AUVDataControl 1.0
import Controller 1.0

Window {
    id: root
    maximumHeight: minimumHeight
    maximumWidth: minimumWidth
    minimumWidth: 1920
    minimumHeight: 1080
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

            Image {
                anchors.fill: parent
                source: "images/map-russian-island.jpg"

                MContainer {
                    x: 30
                    y: 80
                    title: "Данные корабля"

                    ContentBox {
                        width: 250
                        height: 200

                        id: dataShipBox

                        dataModel: ShipDataModel { }

                        dataDelegate: ContentBoxDelegate { }
                    }

                    onSettingsClickedAction: function() {
                        var window = Qt.createQmlObject("ContentBoxSettings {
                                        titleWindow: 'Настройки данных корабля'
                                        currentModel: dataShipBox.dataModel}",
                                        mainContent);
                    }
                }

                MContainer {
                    id: lel
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

                MContainer {
                    id: container
                    title: "Управление АНПА"

                    x: root.width - dataAUVBox.width - 40
                    y: lel.width + 80

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

                Controller {
                    id: controller
                     onOperate: {
                         shipSprite.movable_component.xPosition = xPos
                         shipSprite.movable_component.yPosition = yPos
                     }
                }

                PathView {
                    z: 1
                    id: directionLine
                    path: Path {
                        startX: shipSprite.xPrevPos + shipSprite.width / 2;
                        startY: shipSprite.yPrevPos + shipSprite.height / 2;
                        PathLine {
                            x: shipSprite.xPos + shipSprite.width / 2;
                            y: shipSprite.yPos + shipSprite.height / 2;
                        }
                    }

                    model: modelCount()

                   function modelCount() {
                        var yCenter = shipSprite.height / 2;
                        var xCenter = shipSprite.width / 2;

                        var xCurrent = shipSprite.xPos + shipSprite.width / 2;
                        var yCurrent = shipSprite.yPos + shipSprite.height / 2;

                        var deltaX = Math.abs(xCurrent - (shipSprite.xPrevPos + xCenter));
                        var deltaY = Math.abs(yCurrent - (shipSprite.yPrevPos + yCenter));

                        var result = Math.ceil(Math.sqrt(Math.pow(deltaX, 2) + Math.pow(deltaY, 2)) / 15);
                       console.log(result);
                       return result;
                    }

                    delegate: Rectangle {
                        width: 12; height: 12
                        color: "red"
                    }
                }

                Ship {
                    id: shipSprite
                    width: 100
                    height: 100
                    x: 540
                    y: 360
                }
            }
        }

        Item {
            id: second

            Rectangle {
                anchors.fill: parent
                color: "white"
            }
        }

        Item {
           id: third
           Rectangle {
               anchors.fill: parent
               color: "blue"


           }
       }
    }
}
