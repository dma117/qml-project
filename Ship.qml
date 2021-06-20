import QtQuick 2.0
import movable_object 1.0;

Rectangle {

    property var movable_component: move_component

    signal positionChanged;

    property var xPos: 0
    property var yPos: 0
    property var xPrevPos: 0
    property var yPrevPos: 0

    Image {
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: "images/settings.png"
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
        duration: 300
        to: xPos
    }

    NumberAnimation on y {
        id: animationY
        duration: 300
        to: yPos
    }
}
