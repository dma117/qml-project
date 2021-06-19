import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import ShipData 1.0
import movable_object 1.0;
import AUVData 1.0

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

                        dataModel: ShipDataModel {
                            displayedData: ShipData { }
                        }

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
                    x: root.width - dataAUVBox.width - 40
                    y: 80
                    title: "Данные АНПА"

                    ContentBox {
                        width: 250
                        height: 200

                        id: dataAUVBox

                        dataModel: AUVDataModel {
                            displayedData: AUVData { }
                        }

                        dataDelegate: ContentBoxDelegate { }
                    }

                    onSettingsClickedAction: function() {
                        var window = Qt.createQmlObject("ContentBoxSettings {
                                        titleWindow: 'Настройки данных корабля'
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
                    id: cont
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
                        ship.xPosition = mouseX
                        ship.yPosition = mouseY
                    }
                }

                Rectangle {
                    width: 100
                    height: 100
                    x: 150
                    y: 150

                    NumberAnimation on x {
                        id: animationX
                        duration: 300
                        to: ship.xPosition
                    }

                    NumberAnimation on y {
                        id: animationY
                        duration: 300
                        to: ship.yPosition
                    }

                    Ship {}
                }

            }
        }
    }
}
