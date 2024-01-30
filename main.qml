import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 320
    height: 240
    title: qsTr("Hello World")
    color: "lightblue"

    Clock {
        id: clock
        anchors.centerIn: parent
        width:  136
        height: 136
    }
}

