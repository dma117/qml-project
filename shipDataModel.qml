import QtQuick 2.0
import ShipData 1.0
import QtQml.Models 2.12
import QtQuick.Layouts 1.12

ListModel {
    property ShipData displayedData

    Component.onCompleted: {
        append({name: "Курс", value: displayedData.direction.toFixed(2), units: "°", chosen: true})
        append({name: "Скорость вперед", value: displayedData.forwardSpeed.toFixed(2), units: "м/с", chosen: true})
        append({name: "Скорость вправо", value: displayedData.rightSpeed.toFixed(2), units: "м/с", chosen: true})
    }
}
