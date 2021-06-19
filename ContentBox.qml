import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQml 2.12

ListView {
    id: dataList
    Layout.fillHeight: true
    Layout.fillWidth: true
    interactive: false

    property var dataModel
    property var dataDelegate

    model: dataModel
    delegate: dataDelegate
}
