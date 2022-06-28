import QtQuick 2.0
import Felgo 3.0

import "entities"

PlaneEnemy {
    property int planeEnemys: 0
    // maximum number of balloons
    property int planeEnemysMax : 5


    id: planeEnemy
    objectName: "planeEnemy1"

//     starts the game
    function start() {
        spawnPlane_enemy.start();
    }

    // clear all plane_enemy1s and reset properties to start values
    function reset() {
        entityManager.removeEntitiesByFilter(["planeEnemy"])
        planeEnemys = 0
    }

    // create plane_enemy
    Timer {
        id: spawnPlane_enemy
        interval: 5000 // milliseconds
        repeat: true
        triggeredOnStart: false
        onTriggered: {
            // after every 2s we create a new plane
            entityManager.createEntityFromUrl(Qt.resolvedUrl("entities/PlaneEnemy.qml"));
            planeEnemys++;
            // if the maximum number of balloons is reached, we stop the timer and therefore the balloon creation
            if(planeEnemys === planeEnemysMax) {
                // delete all plane enemy eneities
                reset();
                stop();
            }
        }
    }
    // It is forbidden to automatically fire bullets from statically created enemy plane
    Component.onCompleted: planeEnemy.bulletshoot.stop();
}
