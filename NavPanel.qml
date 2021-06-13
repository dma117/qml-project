import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Item {
    id: root
    anchors.fill: parent

    TabBar {
        id: leftContent
        width: 500
        spacing: 5

        anchors {
            left: parent.left
        }



        background: Rectangle {
            color: "transparent"
        }

        TabButton {
            background: PressButton {
                text: "Онлайн"
            }
        }

        TabButton {
            background: PressButton {
                text: "Планирование"
            }
        }

        TabButton {
            background: PressButton {

                text: "Симуляция"
            }
        }
    }


    RowLayout {
        id: rightContent
        anchors {
            right: parent.right
        }

        PressButton {
            text: "Плюсик"
        }

        PressButton {
            text: "Шестерёнка"
        }
    }
}
