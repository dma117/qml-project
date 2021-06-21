import QtQuick 2.0
import movable_object 1.0;

Rectangle {

    property var movable_component: move_component
    color: "transparent"

    property var xPos: 540
    property var yPos: 360
    property var xPrevPos: 540
    property var yPrevPos: 360

    Image {
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: "images/ship.png"
    }

    Moveable {
        id: move_component
        onXPositionChanged: {xPos = message; animationX.start(); }
        onYPositionChanged: {yPos = message; animationY.start(); }
        onXPrevChanged: xPrevPos = message
        onYPrevChanged: yPrevPos = message
    }

    NumberAnimation on x {
        id: animationX
        duration: 1500
        to: xPos
    }

    NumberAnimation on y {
        id: animationY
        duration: 1500
        to: yPos
    }
}
