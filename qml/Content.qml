<<<<<<< Updated upstream:qml/Content.qml
///***************************************

//    name:       yangli
//    student ID: 2020051615074
//    effort:     Content.qml
//    time:       2022-06-23

//****************************************/

//import Felgo 3.0
//import QtQuick 2.0
//import QtQuick.Controls 2.0


//Item {
//    id: gameFramework
//    implicitHeight: 768
//    implicitWidth: 512

//    state: "initial"

//    GameBackGround {
//        id: gamebackground
//    }

//    GameName{
//        id: gamename
//    }

//    Labels{
//        id: labels

//    }

//    Buttons {
//        id: buttons

//        // response event after clicking the playbutton
//        playButton.onClicked: {
//            console.log("clicked the play button");

//            // game start timing
//            timers.timer_1.start();

//            // background start slidering
//            gamebackground.start();
//            gameFramework.state = "playgame"

//        }

//        // response event after clicking the practicebutton
//        practiceButton.onClicked: {
//            console.log("clicked the practice button");
//        }

//        // response event after clicking the rankbutton
//        rankButton.onClicked: {
//            console.log("clicked the rank button");
//        }

//        // response event after clicking the aboutbutton
//        aboutButton.onClicked: {
//            console.log("clicked the about button");
//        }
//    }
//    Timers{
//        id: timers

//        timer_1.onTriggered: {

//            if(labels.time == 0)
//                // enemy1 creating
//                timers.timerplane1.start();

//            if(labels.time == 5)
//                // enemy2 creating
//                timers.timerplane2.start();

//            if(labels.time == 10){
//                createEnemy3();
//                planes.enemyPlane3Go.start();
//                // enemy3 creating
//                timers.timerplane3.start();
//            }

//            if(labels.time == 15)
//                // enemy4 creating
//                timers.timerplane4.start();

//            if(labels.time == 20){
//                // enemy5 creating
//                timers.timerplane5.start();
//            }

//            labels.time += 1;
//            if (labels.time === 120){
//                timer_1.stop();
//                timerplane1.stop();
//                timerplane2.stop();
//                timerplane3.stop();
//                timerplane4.stop();
//                timerplane5.stop();

//                planes.enemyPlane1.visible = false;
//                planes.enemyPlane2.visible = false;
//                planes.enemyPlane3.visible = false;
//                planes.enemyPlane4.visible = false;
//                planes.enemyPlane5.visible = false;
//            }
//        }


//        timerplane1.onTriggered: {
//            createEnemy1();
//            planes.enemyPlane1Go.start();
//        }
//        timerplane2.onTriggered: {
//            createEnemy2();
//            planes.enemyPlane2Go.start();
//        }
//        timerplane3.onTriggered: {
//            createEnemy3();
//            planes.enemyPlane3Go.start();
//        }
//        timerplane4.onTriggered: {
//            createEnemy4();
//            planes.enemyPlane4Go.start();
//        }

//        timerplane5.onTriggered: {
//            createEnemy5();
//            planes.enemyPlane5Go.start();
//        }

//    }


//    Planes {
//        id: planes
//    }

//    Bullets{
//        id: bullets
//    }


//    function createEnemy1(){
//            planes.enemyPlane1.visible = true;
//            planes.enemyPlane1.x = Math.random()* 430;
//            console.log("Math.random()* 430 = " + Math.random()* 430);
////            bullets.bullet11.visible = true;
////            bullets.bullet11.x = planes.enemyPlane1.x + 40;
////            bullets.bullet11.y = planes.enemyPlane1.y + 55;
////        if (labels.time === 3 || labels.time === 13 || labels.time === 23 ){
////            bullets.bullet11.visible = true;
////            bullets.bullet11.x = planes.enemyPlane1.x + 40;
////            bullets.bullet11.y = planes.enemyPlane1.y + 55;
////        }
////        if (labels.time === 6 || labels.time === 16 || labels.time === 26 ){
////            bullets.bullet12.visible = true;
////            bullets.bullet12.x = planes.enemyPlane1.x + 40;
////            bullets.bullet12.y = planes.enemyPlane1.y + 55;
////        }
////        if (labels.time === 9 || labels.time === 19 || labels.time === 29 ){
////            bullets.bullet13.visible = true;
////            bullets.bullet13.x = planes.enemyPlane1.x + 40;
////            bullets.bullet13.y = planes.enemyPlane1.y + 55;
////        }

//        console.log("labels.time = " + labels.time);
//    }

//    function createEnemy2(){
//            planes.enemyPlane2.visible = true;
//            planes.enemyPlane2.x = Math.random()* 430;
//            console.log("Math.random()* 430 = " + Math.random()* 430);
//    }
//    function createEnemy3(){
//            planes.enemyPlane3.visible = true;
//            planes.enemyPlane3.x = Math.random()* 430;
//            console.log("Math.random()* 430 = " + Math.random()* 430);
//    }
//    function createEnemy4(){
//            planes.enemyPlane4.visible = true;
//            planes.enemyPlane4.x = Math.random()* 430;
//            console.log("Math.random()* 430 = " + Math.random()* 430);
//    }
//    function createEnemy5(){
//            planes.enemyPlane5.visible = true;
//            planes.enemyPlane5.x = Math.random()* 430;
//            console.log("Math.random()* 430 = " + Math.random()* 430);
//    }
//    function enemiesGo(){
//        if(labels.time < 100){
//            planes.enemyPlane1.y += 5;
//            bullets.bullet11.y += 12;
//            bullets.bullet12.y += 12;
//            bullets.bullet13.y += 12;
//        }
//        console.log("planes.enemyPlane1.y = " + planes.enemyPlane1.y);
//    }


//    states: [
//        // initial state
//        State{
//            name: "initial"
//            PropertyChanges { target: labels;           visible: false}
//            PropertyChanges { target: gamename;         visible: true }
//            PropertyChanges { target: planes.heroPlane; visible: false}
//            PropertyChanges { target: buttons;          visible: true }
//        },

//        // play game begin
//        State {
//            name: "playgame"
//            PropertyChanges {
//                target: planes.heroPlane
//                visible: true
//                focus: true
//            }
//            PropertyChanges { target: labels;                   visible: true }
//            PropertyChanges { target: gamename;                 visible: false}
//            PropertyChanges { target: buttons.playButton;       visible: false}
//            PropertyChanges { target: buttons.practiceButton;   visible: false}
//            PropertyChanges { target: buttons.rankButton;       visible: false}
//            PropertyChanges { target: buttons.aboutButton;      visible: false}
//            PropertyChanges { target: buttons.audioButton;      visible: true }
//        }

//    ]
//}



=======
>>>>>>> Stashed changes:Airport/qml/Content.qml
