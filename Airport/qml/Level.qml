import QtQuick 2.0
import Felgo 3.0
import "entities"

Item {
    id: level
    width: parent.width
    height: parent.width

    // use this to insert the input action (which car should fire and which to steer) to the right car
    property alias plane_hero2: plane_hero2

    property alias plane_enemy1: plane_enemy1
    property alias plane_enemy1going: plane_enemy1going


    Plane {
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

    //    property list<Plane> enemyPlane : [

    Plane{
        id: plane_enemy1
        objectName: "plane_enemy1"
        visible: false;
        focus: false
        rotation: 0
        image.source: "../airport-picture/img-plane_1.png"

        //        property list<Item> imagePoints: [
        //            // this imagePoint can be used for creation of the bullet
        //            // it must be far enough in front of the p;plane that they don't collide upon creation
        //            // the +30 might have to be adapted if the size of the rocket is changed
        //            Item {x: plane_enemy1.width/2+30}
        //        ]
        //        function autoBullet() {
        //            var imagePointInWorldCoordinates = mapToItem(level,plane_enemy1.imagePoints[0].x, plane_enemy1.imagePoints[0].y)
        //            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Bullet.qml"), {"x": imagePointInWorldCoordinates.x - 30, "y": imagePointInWorldCoordinates.y + 80, "rotation": 90})
        //        }
    }
    //    ]


    NumberAnimation{
        id: plane_enemy1going
        target: plane_enemy1
        property: "y"
        from: -30
        to: 850
        duration: 10000  // 10s
    }

}
