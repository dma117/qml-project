import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    ColumnLayout {
        ComboBox {
            currentIndex: -1
            model: ["First", "Second", "Third"]
            displayText: currentIndex != -1 ? currentText : "Выбрать команду"
        }

        CheckBox {
            text: "Постоянная отправка"
        }

        MButton {
            text: "Отправить"
        }
    }
}
