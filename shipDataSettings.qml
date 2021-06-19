import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import ShipData 1.0

ApplicationWindow {
    flags: Qt.Dialog
    visible: true

    minimumHeight: 250
    minimumWidth: 300

    property string titleWindow: "Настройки"
    property var currentModel
    title: titleWindow

    Rectangle {
        id: settings

        width: parent.width
        height: parent.height

        border {
            color: "gray"
            width: 5
        }

        anchors {
            horizontalCenterOffset: 10
            verticalCenterOffset: 10
        }

        ContentBox {
            width: parent.width
            height: parent.height

            dataModel: currentModel

            dataDelegate: ContentBoxSettingsDelegate { }
        }
    }
}

