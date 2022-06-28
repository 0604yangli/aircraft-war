/***************************************

    name:       zhuyuhao
    student ID: 2020051615059
    effort:     Main.qml
    time:       2022-06-28

****************************************/

import Felgo 3.0
import QtQuick 2.0
import "parts"
import "entities"

GameWindow {
    id: window
    screenWidth: 512
    screenHeight: 768

    activeScene: scene

    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    // for creating and destroying entities at runtime (bullets)
    EntityManager {
        id: entityManager
        entityContainer: level
    }

    Scene {
        id: scene
        width: 512
        height: 768


        // background image
        GameBackground {
            id: gamebackground
        }
//        Image {
//            id: background
//            source: "../assets/img/asphalt_background.png"
//            // since we are using a simple Image element to define our background, we stretch it to avoid any kind of black borders on any device
//            width: parent.width*1.8
//            height: parent.height*1.8
//            anchors.fill: parent
//        }

        // use a physics world because we need collision detection
        PhysicsWorld {
            id: world
            updatesPerSecondForPhysics: 60
        }


        GameTitle{
            id: gamename
        }

        Labels{
            id: labels
        }

        Buttons {
            id: buttons

            // response event after clicking the playbutton
            playButton.onClicked: {
                console.log("clicked the play button");

                // game start timing
                timers.timer_1.start();
//                timers.plane_enemy1.start();
                planeEnemy1.start();

                // background start slidering
                gamebackground.start();
                window.state = "playgame"

            }

            // response event after clicking the practicebutton
            practiceButton.onClicked: {
                console.log("clicked the practice button");
            }

            // response event after clicking the rankbutton
            rankButton.onClicked: {
                console.log("clicked the rank button");
            }

            // response event after clicking the aboutbutton
            aboutButton.onClicked: {
                console.log("clicked the about button");
            }
        }

        Level {
            id: level
        }

        PlaneEnemy1{
            id: planeEnemy1
        }

        Wall {
            id: border_bottom

            height: 1
    //        y:500
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
        }
        Wall {
            id: border_left
            width: 1
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
            }
        }

        Wall {
            id: border_right
            width: 1
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
        }

        focus: true
        // forward the input keys to plane_hero
        Keys.forwardTo: [level.plane_hero2.controller]
    }

    state: "initial"


    Timers{
        id: timers

        timer_1.onTriggered: {
            labels.time += 1;
            if (labels.time === 120){
                timer_1.stop();
            }
        }
    }


    states: [
        // initial state
        State{
            name: "initial"
            PropertyChanges { target: labels;            visible: false}
            PropertyChanges { target: gamename;          visible: true }
            PropertyChanges { target: level.plane_hero2; visible: false}
            PropertyChanges { target: buttons;           visible: true }
        },

        // play game begin
        State {
            name: "playgame"
            PropertyChanges {
                target: level.plane_hero2
                visible: true
                focus: true
            }
            PropertyChanges {
                target: planeEnemy1
                visible: false

            }
            PropertyChanges { target: labels;                   visible: true }
            PropertyChanges { target: gamename;                 visible: false}
            PropertyChanges { target: buttons.playButton;       visible: false}
            PropertyChanges { target: buttons.practiceButton;   visible: false}
            PropertyChanges { target: buttons.rankButton;       visible: false}
            PropertyChanges { target: buttons.aboutButton;      visible: false}
        }

    ]
}


