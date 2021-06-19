import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

Component {
    Flow {
        CheckBox {
            width: settings.width
            text: name
        }
    }
}
