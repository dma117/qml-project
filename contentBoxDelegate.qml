import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import QtQml 2.12

Component {
    Flow {
        visible: chosen
        height: chosen == false ? 0 : implicitHeight

        Text {
            text: name + ':'
            font.pointSize: 9
        }
        Text {
            text: value + " " + units
            font {
               pointSize: 9
               bold: true
            }
        }
    }
}
