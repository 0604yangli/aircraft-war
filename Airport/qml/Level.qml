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
            "up": Qt.Key_W,
            "down": Qt.Key_S,
            "left": Qt.Key_A,
            "right": Qt.Key_D,
            "fire": Qt.Key_Space
        }
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

}

