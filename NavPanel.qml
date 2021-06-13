import QtQuick 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Item {
    id: root
    anchors.fill: parent
    property int currentIndex: leftContent.currentIndex

    TabBar {
        id: leftContent
        anchors.left: parent.left
        width: 500
        spacing: 5
        background: Rectangle { color: "transparent" }

        MTabButton {
            text: "Онлайн"
        }

        MTabButton {
            text: "Планирование"
        }

        MTabButton {
            text: "Симуляция"
        }
    }


    RowLayout {
        id: rightContent
        anchors.right: parent.right

        MButton {
            implicitWidth: leftContent.height
            implicitHeight: leftContent.height
             contentItem: Image {
                 anchors.fill: parent
                 source: "images/plus.png"
             }
        }

       MButton {
           implicitWidth: leftContent.height
           implicitHeight: leftContent.height
            contentItem: Image {
                anchors.fill: parent
                source: "images/settings.png"
            }
        }
    }
}
