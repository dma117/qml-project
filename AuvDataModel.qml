import QtQuick 2.0
import AUVData 1.0
import QtQml.Models 2.12
import QtQuick.Layouts 1.12

ListModel {
    readonly property AUVData displayedData : AUVData { }

    Component.onCompleted: {
        append({name: "Высота", value: displayedData.height.toFixed(2), units: "м", chosen: true})
        append({name: "Глубина", value: displayedData.deep.toFixed(2), units: "м", chosen: true})
        append({name: "Скорость", value: displayedData.speed.toFixed(2), units: "м/с", chosen: true})
        append({name: "Курс", value: displayedData.direction.toFixed(2), units: "°", chosen: true})
    }
}
