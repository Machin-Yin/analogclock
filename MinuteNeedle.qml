import QtQuick 2.0

Item {
    id: id_root
    property int value: 0
    property int granularity: 60

    Rectangle {
        width: 4
        height: id_root.height * 0.4
        color: "white"
        radius: width/2
        anchors {
            horizontalCenter: id_root.horizontalCenter
            bottom: id_root.verticalCenter
        }
        antialiasing: true
    }

    rotation: 360/granularity * (value % granularity)
    antialiasing: true
}