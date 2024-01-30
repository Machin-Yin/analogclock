import QtQuick 2.0

Item {
    id: id_root

    property var currentDate: new Date()
    property int hours: currentDate.getHours()
    property int minutes: currentDate.getMinutes()
    property int seconds: currentDate.getSeconds()

    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: true

        onTriggered: id_root.currentDate = new Date()
    }

    Rectangle {
        id: id_plate

        anchors.centerIn: parent
        height: Math.min(id_root.width, id_root.height)
        width: height
        radius: width/2
        color: "lightgray"
        border.color: "lightgreen"
        border.width: 1
//        opacity: 0
    }
/*
    Repeater {
        model: 12

        Item {
            id: hourContainer

            property int hour: index
            height: id_plate.height/2
            transformOrigin: Item.Bottom
            rotation: index * 30
            x: id_plate.width/2
            y: 0

            Rectangle {
                height: id_plate.height*0.05
                width: height
                radius: width/2
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 4
            }

            Text {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                x: 0
                y: id_plate.height*0.06
                rotation: 360 - index * 30
                text: hourContainer.hour == 0 ? 12 : hourContainer.hour
                font.pixelSize: id_plate.height*0.1
                font.family: "Comic Sans MS"
            }
        }
    }
    */

    Repeater {
        model: 60

        Item {
            id: hourContainer

            property int hour: index
            height: id_plate.height/2
            transformOrigin: Item.Bottom
            rotation: index * 360/60
            x: id_plate.width/2
            y: 0

            Rectangle {
                height: index%5 === 0 ? id_plate.height*0.05 : id_plate.height*0.03
                width: height/2
//                radius: width/2
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 4
                antialiasing: true
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                y: id_plate.height*0.06
                rotation: -index * 360/60
                text: index%5 === 0 ? hourContainer.hour == 0 ? 12 : hourContainer.hour/5 : ""
                font.pixelSize: id_plate.height*0.1
                font.family: "Comic Sans MS"
//                color: "white"
            }
        }
    }

    Item {
        id: id_hourNeedle
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }
        Rectangle {
            width: 6
            height: id_hourNeedle.height * 0.3
            color: "white"
            radius: width/2
            anchors {
                horizontalCenter: id_hourNeedle.horizontalCenter
                bottom: id_hourNeedle.verticalCenter
            }
            antialiasing: true
        }

        rotation: 360/12 * (id_root.hours%12) + 360/12 * (id_root.minutes/60)
        antialiasing: true
    }

    Item {
        id: id_minuteNeedle
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }
        Rectangle {
            width: 4
            height: id_minuteNeedle.height * 0.35
            color: "white"
            radius: width/2
            anchors {
                horizontalCenter: id_minuteNeedle.horizontalCenter
                bottom: id_minuteNeedle.verticalCenter
            }
            antialiasing: true
        }

        rotation: 360/60 * (id_root.minutes%60)
        antialiasing: true
    }


    Rectangle {
        id: id_center

        anchors.centerIn: parent
        height: id_plate.height*0.1
        width: height
        radius: width/2
        color: "white"
    }

    Item {
        id: id_secondneedle

        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            width: 1
            height: id_secondneedle.height * 0.5
            color: "red"
            anchors {
                horizontalCenter: id_secondneedle.horizontalCenter
            }
            antialiasing: true
            y: id_secondneedle.height * 0.1
        }

        rotation: 360/60 * (id_root.seconds%60)
        antialiasing: true
    }

    Rectangle {
        id: id_red
        anchors.centerIn: parent
        height: id_plate.height*0.05
        width: height
        radius: width/2
        color: "red"
    }
}
