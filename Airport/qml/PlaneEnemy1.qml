import QtQuick 2.0
import Felgo 3.0

import "entities"

PlaneEnemy {
    property int plane_enemy1s: 0
    // maximum number of balloons
    property int plane_enemy1sMax : 5

    id: plane_enemy1
    objectName: "plane_enemy1"

    // starts the game
    function start() {
        spawnPlane_enemy1.start();
    }

    // clear all plane_enemy1s and reset properties to start values
    function reset() {
        entityManager.removeEntitiesByFilter(["plane"])
        plane_enemy1s = 0
    }

    // create plane_enemy1
    Timer {
        id: spawnPlane_enemy1
        interval: 5000 // milliseconds
        repeat: true
        triggeredOnStart: false
        onTriggered: {
            // after every 2s we create a new plane
            entityManager.createEntityFromUrl(Qt.resolvedUrl("entities/PlaneEnemy.qml"));
            plane_enemy1s++;

            // if the maximum number of balloons is reached, we stop the timer and therefore the balloon creation
            if(plane_enemy1s === plane_enemy1sMax) {
                // delete all plane enemy eneities
                reset();
                stop();
            }
        }
    }

    // It is forbidden to automatically fire bullets from statically created enemy plane
    Component.onCompleted: plane_enemy1.bulletshoot.stop();
}
