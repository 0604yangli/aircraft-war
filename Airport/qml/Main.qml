/***************************************

    name:       yangli
    student ID: 2020051615074
    effort:     Main.qml
    time:       2022-06-23

****************************************/

import Felgo 3.0
import QtQuick 2.0
import "parts"
import "entities"
import "planes"
import "interfaces"

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
        BackgroundImage{
            source: "../assets/img/img_bg_level_1.jpg"
        }

        // background image
        GameBackground {
            id: gamebackground
            visible: false
        }

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

        // rank list interface
        RankList{
            id: rank
        }
        // game over interface
        GameOver{
            id: gameover
        }

        Buttons {
            id: buttons
            maininterfaceButton.onClicked: {
                timers.timer_1.stop();
                labels.score = 0;
                labels.time = 0;
                level.reset();
                window.state = "initial"
            }
            restartButton.onClicked: {
                console.log("clicked the replay button");

                timers.timer_1.stop();
                labels.score = 0;
                labels.time = 0;
                // game restart timing
                timers.timer_1.start();
                level.reset();
                level.start();

                // background start slidering
                gamebackground.start();
                window.state = "playgame"
            }

            // response event after clicking the playbutton
            playButton.onClicked: {
                console.log("clicked the play button");

                timers.timer_1.stop();
                labels.score = 0;
                labels.time = 0;
                // game start timing
                timers.timer_1.start();
                level.reset();
                level.start();

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
                window.state = "ranklist"
            }

            // response event after clicking the aboutbutton
            aboutButton.onClicked: {
                console.log("clicked the about button");
            }
        }

        Planes {
            id: level
        }

//        Wall {
//            id: border_bottom
//            height: 1
//            anchors {
//                left: parent.left
//                right: parent.right
//                bottom: parent.bottom
//            }
//        }
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
//         forward the input keys to plane_hero
        Keys.forwardTo: [level.controller]
    }

    state: "initial"

    Timers{
        id: timers

        timer_1.onTriggered: {
            labels.time += 1;
            if (labels.time === 12){
                window.state = "gameover";
                level.reset();
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
            PropertyChanges { target: buttons;           visible: true }
            PropertyChanges { target: buttons.maininterface_and_restart;           visible: false }
        },

        // play game begin
        State {
            name: "playgame"
            PropertyChanges { target: gamebackground;                   visible: true }
            PropertyChanges { target: labels;                   visible: true }
            PropertyChanges { target: gamename;                 visible: false}
            PropertyChanges { target: buttons.playButton;       visible: false}
            PropertyChanges { target: buttons.practiceButton;   visible: false}
            PropertyChanges { target: buttons.rankButton;       visible: false}
            PropertyChanges { target: buttons.aboutButton;      visible: false}
            PropertyChanges { target: buttons.maininterface_and_restart;           visible: false }
        },

        // rank list
        State {
            name: "ranklist"
            PropertyChanges { target: rank;                 visible: true }
            PropertyChanges { target: labels;                 visible: false }
            PropertyChanges { target: gamebackground;                   visible: false }
            PropertyChanges { target: labels;                   visible: false }
            PropertyChanges { target: gamename;                 visible: false}
            PropertyChanges { target: buttons.playButton;       visible: false}
            PropertyChanges { target: buttons.practiceButton;   visible: false}
            PropertyChanges { target: buttons.rankButton;       visible: false}
            PropertyChanges { target: buttons.aboutButton;      visible: false}
            PropertyChanges { target: buttons.maininterface_and_restart;           visible: false }
        },
        // game over
        State {
            name: "gameover"
            PropertyChanges { target: gameover;                 visible: true }
            PropertyChanges { target: rank;                 visible: false }
            PropertyChanges { target: gamebackground;                   visible: false }
            PropertyChanges { target: labels;                   visible: false }
            PropertyChanges { target: gamename;                 visible: false}
            PropertyChanges { target: buttons.playButton;       visible: false}
            PropertyChanges { target: buttons.practiceButton;   visible: false}
            PropertyChanges { target: buttons.rankButton;       visible: false}
            PropertyChanges { target: buttons.aboutButton;      visible: false}
            PropertyChanges { target: buttons.maininterface_and_restart;           visible: true }
        }
    ]
}


