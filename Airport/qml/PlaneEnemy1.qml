import QtQuick 2.0
import Felgo 3.0

import "entities"

PlaneEnemy {
    property int plane_enemy1s: 0
    // maximum number of balloons
    property int plane_enemy1sMax : 100

    id: plane_enemy1
    objectName: "plane_enemy1"




    // starts the game
    function start() {
        spawnPlane_enemy1.start();
//        plane_enemy1going.start();
    }

    // clear all plane_enemy1s and reset properties to start values
    function reset() {
        entityManager.removeEntitiesByFilter(["plane_enemy1"])
        plane_enemy1s = 0
    }

    // create balloons with short intervals in between, creating a nice animation at the start
    Timer {
        id: spawnPlane_enemy1
        interval: 1000 // milliseconds
        repeat: true
        onTriggered: {
            // after every 20ms we create a new plane
            entityManager.createEntityFromUrl(Qt.resolvedUrl("entities/PlaneEnemy.qml"));
            plane_enemy1s++;

//            plane_enemy1going.start();
            // if the maximum number of balloons is reached, we stop the timer and therefore the balloon creation
            if(plane_enemy1s === plane_enemy1sMax) {
                running = false
            }
        }
    }
}
