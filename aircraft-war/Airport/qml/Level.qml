import QtQuick 2.0
import Felgo 3.0
import "entities"

Item {
    id: level
    width: parent.width
    height: parent.width

    // use this to insert the input action (which car should fire and which to steer) to the right car
    property alias plane_hero2: plane_hero2

//    property alias plane_enemy1: plane_enemy1
//    property alias plane_enemy1going: plane_enemy1going

    Component.onCompleted: {
        console.log("parent:" + parent.width + " " + parent.height)
    }

    PlaneHero {
        id: plane_hero2
        objectName: "plane_hero2"
        variationType: "planeHero2"
        x: 258
        y: 550
        visible:  false
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

//    Wall {
//        id: border_bottom

//        height: 1
////        y:500
//        anchors {
//            left: parent.left
//            right: parent.right
//            bottom: parent.bottom
//        }
//    }
//    Wall {
//        id: border_left
//        width: 1
//        anchors {
//            top: parent.top
//            bottom: parent.bottom
//            left: parent.left
//        }
//    }

//    Wall {
//        id: border_right
//        width: 1
//        anchors {
//            top: parent.top
//            bottom: parent.bottom
//            right: parent.right
//        }
    }
//    PlaneEnemy {
//        id: plane_enemy1
//        objectName: "plane_enemy1"
//        visible: false;
//        focus: false
//        rotation: 0
//        image.source: "../airport-picture/img-plane_1.png"
//    }


//    NumberAnimation{
//        id: plane_enemy1going
//        target: plane_enemy1
//        property: "y"
//        from: -30
//        to: 850
//        duration: 10000  // 10s
//    }



