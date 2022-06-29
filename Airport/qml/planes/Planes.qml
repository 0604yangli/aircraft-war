/***************************************
    name:           yangli
    student ID:     2020051615074
    effort:         Planes.qml
                    Dynamic creation of various plane
    time:           2022-06-29
****************************************/
import QtQuick 2.0
import Felgo 3.0
import "../entities"

Item {
    id: level
    width: parent.width
    height: parent.width

    property int planeEnemys: 0
    // maximum number of planes
    property int planeEnemysMax : 33


    //     starts the game
    function start() {
//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/PlaneHero.qml"),{"inputActionsToKeyCode": {
//                                                                "up": Qt.Key_W,
//                                                                "down": Qt.Key_S,
//                                                                "left": Qt.Key_A,
//                                                                "right": Qt.Key_D,
//                                                                "fire": Qt.Key_Space
//                                                            }});

        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/PlaneHero.qml"),{"focus":
                                                                "true"
                                                            });
//        entityManager.createEntityFromUrl(Qt.resolvedUrl("../entities/PlaneHero.qml"));
//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/PlaneHero.qml"),{"id": "planehero"});

        spawnPlane_enemyboss.start();
        spawnPlane_enemy1.start();
        spawnPlane_enemy2.start();
    }

    // clear all plane_enemy1s and reset properties to start values
    function reset() {
        spawnPlane_enemy1.stop();
        spawnPlane_enemy2.stop();
        spawnPlane_enemyboss.stop();
        entityManager.removeEntitiesByFilter(["planeEnemy"]);
        entityManager.removeEntitiesByFilter(["planeHero"]);
        entityManager.removeEntitiesByFilter(["planeBoss"]);
        planeEnemys = 0;
    }

    // create plane_enemy1
    Timer {
        id: spawnPlane_enemy1
        interval: 5000 // milliseconds
        repeat: true
        triggeredOnStart: false
        onTriggered: {
            // after every 3s we create a new plane
            entityManager.createEntityFromUrl(Qt.resolvedUrl("../entities/PlaneEnemy1.qml"));
            //            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/PlaneEnemy.qml"),{"image.source": "../../assets/img/img-plane_6.png"});
            planeEnemys++;

            // if the maximum number of planes is reached, we stop the timer and therefore the plane creation
            if(planeEnemys === planeEnemysMax &&  labels.time === 120) {
                // delete all plane enemy eneities and stop all timer
                level.reset();
            }
        }
    }

    // create plane_enemy2
    Timer {
        id: spawnPlane_enemy2
        interval: 8000 // milliseconds
        repeat: true
        triggeredOnStart: false
        onTriggered: {
            // after every 2s we create a new plane
            entityManager.createEntityFromUrl(Qt.resolvedUrl("../entities/PlaneEnemy2.qml"));
            planeEnemys++;
        }
    }

    // create plane_enemy boss
    Timer {
        id: spawnPlane_enemyboss
        interval: 70000 // milliseconds
        repeat: false
        running: false
        triggeredOnStart: false
        onTriggered: {
            entityManager.createEntityFromUrl(Qt.resolvedUrl("../entities/Boss.qml"));
        }
    }
}


