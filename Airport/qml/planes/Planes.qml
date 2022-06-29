import QtQuick 2.0
import Felgo 3.0
import "../entities"

Item {
    id: level
    width: parent.width
    height: parent.width

    property int planeEnemys: 0
    // maximum number of planes
    property int planeEnemysMax : 5


    //     starts the game
    function start() {
        entityManager.createEntityFromUrl(Qt.resolvedUrl("../entities/PlaneHero.qml"));
        spawnPlane_enemy1.start();
        spawnPlane_enemy2.start();
    }

    // clear all plane_enemy1s and reset properties to start values
    function reset() {
        spawnPlane_enemy1.stop();
        spawnPlane_enemy2.stop();
        entityManager.removeEntitiesByFilter(["planeEnemy"]);
        entityManager.removeEntitiesByFilter(["planeHero"]);
        planeEnemys = 0;
    }

    // create plane_enemy
    Timer {
        id: spawnPlane_enemy1
        interval: 3000 // milliseconds
        repeat: true
        triggeredOnStart: false
        onTriggered: {
            // after every 2s we create a new plane
            //                entityManager.createEntityFromUrl(Qt.resolvedUrl("../entities/PlaneEnemy.qml"));
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/PlaneEnemy.qml"),{"inputActionsToKeyCode": {
                                                                    "up": Qt.Key_W,
                                                                    "down": Qt.Key_S,
                                                                    "left": Qt.Key_A,
                                                                    "right": Qt.Key_D,
                                                                    "fire": Qt.Key_Space
                                                                }});
            planeEnemys++;

            // if the maximum number of planes is reached, we stop the timer and therefore the plane creation
            if(planeEnemys === planeEnemysMax) {
                // delete all plane enemy eneities and stop all timer
                level.reset();
            }
        }
    }

    // create plane_enemy
    Timer {
        id: spawnPlane_enemy2
        interval: 7500 // milliseconds
        repeat: true
        triggeredOnStart: false
        onTriggered: {
            // after every 2s we create a new plane
            entityManager.createEntityFromUrl(Qt.resolvedUrl("../entities/PlaneEnemy.qml"));
            planeEnemys++;
        }
    }
}


