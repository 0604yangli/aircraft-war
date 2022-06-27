import QtQuick 2.0

import Felgo 3.0
import "entities"

Item {
    id: level

    property int balloons: 0
    property int balloonsMax : 10
    width: parent.width
    height: parent.height

    // use this to insert the input action (which car should fire and which to steer) to the right car
    property alias player_red: heroPlane_red
//    property alias player_blue: car_blue

    // background of the level
    Image {
        id: playgroundImage
        source: "/root/image_airwar/img_bg_level_2.jpg"
        anchors.fill: parent
    }

    HeroPlane {
        id: heroPlane_red
        objectName: "heroPlane_red"
        variationType: "heroPlaneRed"
        x: 512 /2
        y: 600
        // rotation in degrees clockwise
        rotation: -90
        inputActionsToKeyCode: {
            "up": Qt.Key_Up,
            "down": Qt.Key_Down,
            "left": Qt.Key_Left,
            "right": Qt.Key_Right,
            "fire": Qt.Key_Space
        }

    }

    WarPlane{
        id: warPlane
        objectName: "warPlane"
        variationType: "warPlane"
        function start(){
            war.start();
        }

//        x:100
//        y:100
        Timer {
          id: war
          interval: 200 // milliseconds
          repeat: true
//          triggeredOnStart: true
          onTriggered: {
              console.log("aaaaaaaaaaaaaaaaaaaaaaaaaaaa")
            entityManager.createEntityFromUrl(Qt.resolvedUrl("entities/WarPlane.qml"));
            warPlane.x = utils.generateRandomValueBetween(100,400)
            warPlane.y = 80
            balloons++
            if(balloons===balloonsMax) {
              running = false
    //          gameRunning = true
    //          infoText.text = "Hurry!"
            }
          }
        }
    }

//    function start() {
//      war.start()
//    }

    Wall {
        id: border_bottom

        height: 2
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    Wall {
        id: border_top

        height: 2
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    Wall {
        id: border_left
        width: 2
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
    }

    Wall {
        id: border_right
        width: 2
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }
    }
}
