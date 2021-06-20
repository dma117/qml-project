import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import QtQml 2.12

Component {
    Flow {
        id: flow
        visible: model.chosen
        height: chosen == false ? 0 : implicitHeight

        Text {
            text: model.name + ':'
            font.pointSize: 9
        }
        Text {
            text: model.value + " " + model.units
            font {
               pointSize: 9
               bold: true
            }
        }
    }
}
