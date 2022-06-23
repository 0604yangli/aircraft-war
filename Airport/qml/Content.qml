/***************************************

    name:       yangli
    student ID: 2020051615074
    effort:     Content.qml
    time:       2022-06-23

****************************************/

import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.0


Item {
    id: gameFramework
    implicitHeight: 768
    implicitWidth: 512

    state: "initial"

    GameBackGround {
        id: gamebackground
    }

    GameName{
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

            gameFramework.state = "playgame"

            // game start timing
            timers.timer_1.start();
            // background start slidering
            gamebackground.start();

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
    Timers{
        id: timers

        timer_1.onTriggered: {
            labels.time += 1;
            createEnemies();
            if (labels.time === 100)
                timer_1.stop();
        }
    }

    Planes {
        id: planes
    }


    function createEnemies(){
        if( labels.time % 7 === 2){
            planes.creatEnemyplane1();
        }
        console.log("labels.time = " + labels.time);
    }

    function enemiesGo(){

    }


    states: [
        // initial state
        State{
            name: "initial"
            PropertyChanges { target: labels;           visible: false}
            PropertyChanges { target: gamename;         visible: true }
            PropertyChanges { target: planes.heroPlane; visible: false}
            PropertyChanges { target: buttons;          visible: true }
        },

        // play game begin
        State {
            name: "playgame"
            PropertyChanges {
                target: planes.heroPlane
                visible: true
                focus: true
            }
            PropertyChanges { target: labels;                   visible: true }
            PropertyChanges { target: gamename;                 visible: false}
            PropertyChanges { target: buttons.playButton;       visible: false}
            PropertyChanges { target: buttons.practiceButton;   visible: false}
            PropertyChanges { target: buttons.rankButton;       visible: false}
            PropertyChanges { target: buttons.aboutButton;      visible: false}
            PropertyChanges { target: buttons.audioButton;      visible: true }
        }

    ]
}



