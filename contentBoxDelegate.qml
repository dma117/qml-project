import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQml 2.12

Component {
    Flow {
        Text {
            text: name
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
