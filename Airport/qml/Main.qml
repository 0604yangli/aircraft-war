/***************************************
    name:       yangli
    student ID: 2020051615074
    effort:     Main.qml
    time:           2022-07-09
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
    // for creating and destroying entities at runtime (bullets)
    EntityManager {
        id: entityManager
        entityContainer: level
    }

    //    Loader
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
        // about game interface
        AboutGame{
            id: about
        }

        Buttons {
            id: buttons
            maininterfaceButton.onClicked: {
                console.log("clicked the maininterface button");
                timer.stop();
                // save score to rank list
                if (labels.score !== 0){
                    rank.scores.push(labels.score);
                    rank.scores.sort(function (a, b) {
                        return a - b
                    });
                }
                labels.score = 0;
                labels.time = 0;
                level.reset();
                window.state = "initial"
            }
            restartButton.onClicked: {
                console.log("clicked the replay button");
                timer.stop();
                // save score to rank list
                if (labels.score !== 0){
                    rank.scores.push(labels.score);
                    rank.scores.sort(function (a, b) {
                        return a - b
                    });
                }
                labels.score = 0;
                labels.time = 0;

                // game restart timing
                timer.start();
                // remove all plane enemies
                level.reset();
                level.start();

                // background start slidering
                gamebackground.start();
                window.state = "playgame"
            }

            // response event after clicking the playbutton
            playButton.onClicked: {
                console.log("clicked the play button");
                timer.stop();
                labels.score = 0;
                labels.time = 0;

                // game start timing
                timer.start();
                // remove all plane enemies
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
                rank.setdata()
            }

            // response event after clicking the aboutbutton
            aboutButton.onClicked: {
                console.log("clicked the about button");
                window.state = "aboutgame"
            }
        }

        Planes {
            id: level
            z: 1
        }

        // make walls for the left and right sides
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
        Wall {
            id: border_bottom
            width: 1
            anchors {
                //                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
        }

        focus: true
        //         forward the input keys to plane_hero
        Keys.forwardTo: [level.planehero.controller]
    }

    // initial interface
    state: "initial"
    // time the game after it starts. The game lasts 120s
    Timer{
        id:timer
        interval: 1000
        repeat: true
        running: false
        triggeredOnStart: false
        onTriggered: {
            labels.time += 1;
            //            if (labels.time === 100){
            if (labels.time === 100){
                window.state = "gameover";
                level.reset();
                timer.stop();
            }
        }
    }

    states: [
        // initial state
        State{
            name: "initial"
            PropertyChanges { target: labels;            visible: false}
            PropertyChanges { target: gamename;          visible: true }
            PropertyChanges { target: rank;            visible: false}
            PropertyChanges { target: buttons;           visible: true }
            PropertyChanges { target: buttons.restartButton;           visible: false }
            PropertyChanges { target: buttons.maininterfaceButton;           visible: false }
            PropertyChanges { target: about;                 visible: false }
        },

        // play game begin
        State {
            name: "playgame"
            PropertyChanges { target: gamebackground;                   visible: true }
            PropertyChanges { target: labels;                   visible: true }
            PropertyChanges { target: rank;            visible: false}
            PropertyChanges { target: gamename;                 visible: false}
            PropertyChanges { target: buttons.playButton;       visible: false}
            PropertyChanges { target: buttons.practiceButton;   visible: false}
            PropertyChanges { target: buttons.rankButton;       visible: false}
            PropertyChanges { target: buttons.aboutButton;      visible: false}
            PropertyChanges { target: buttons.restartButton;           visible: false }
            PropertyChanges { target: buttons.maininterfaceButton;           visible: false }
            PropertyChanges { target: about;                 visible: false }
        },

        // rank list
        State {
            name: "ranklist"
            PropertyChanges { target: rank;                 visible: true }
            PropertyChanges { target: gamebackground;                   visible: false }
            PropertyChanges { target: labels;                   visible: false }
            PropertyChanges { target: gamename;                 visible: false}
            PropertyChanges { target: buttons.playButton;       visible: false}
            PropertyChanges { target: buttons.practiceButton;   visible: false}
            PropertyChanges { target: buttons.rankButton;       visible: false}
            PropertyChanges { target: buttons.aboutButton;      visible: false}
            PropertyChanges { target: buttons.restartButton;           visible: false }
            PropertyChanges { target: about;                 visible: false }
            PropertyChanges { target: buttons.maininterfaceButton;           visible: true }
        },

        // about game
        State {
            name: "aboutgame"
            PropertyChanges { target: about;                 visible: true }
            PropertyChanges { target: rank;                 visible: false }
            PropertyChanges { target: gamebackground;                   visible: false }
            PropertyChanges { target: labels;                   visible: false }
            PropertyChanges { target: gamename;                 visible: false}
            PropertyChanges { target: buttons.playButton;       visible: false}
            PropertyChanges { target: buttons.practiceButton;   visible: false}
            PropertyChanges { target: buttons.rankButton;       visible: false}
            PropertyChanges { target: buttons.aboutButton;      visible: false}
            PropertyChanges { target: buttons.restartButton;           visible: false }
            PropertyChanges { target: buttons.maininterfaceButton;           visible: true }
        },

        // game over
        State {
            name: "gameover"
            PropertyChanges { target: gameover;                 visible: true }
            PropertyChanges { target: rank;                 visible: false }
            PropertyChanges { target: gamebackground;                   visible: false }
            PropertyChanges { target: about;                 visible: false }
            PropertyChanges { target: labels;                   visible: false }
            PropertyChanges { target: gamename;                 visible: false}
            PropertyChanges { target: buttons.playButton;       visible: false}
            PropertyChanges { target: buttons.practiceButton;   visible: false}
            PropertyChanges { target: buttons.rankButton;       visible: false}
            PropertyChanges { target: buttons.aboutButton;      visible: false}
            PropertyChanges { target: buttons.restartButton;           visible: true }
            PropertyChanges { target: buttons.maininterfaceButton;           visible: true }
        }
    ]
}


