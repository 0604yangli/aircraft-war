/***************************************

    name:       yangli
    student ID: 2020051615074
    effort:     Main.qml
    time:       2022-06-23

****************************************/

import Felgo 3.0
import QtQuick 2.0


GameWindowApplicationWindow {
    id: gameWindow

    screenWidth: 512
    screenHeight: 768


    GameBackGround {
        id: gamebackground
    }

    Buttons {
        id: buttons

        playButton.onClicked: {
            buttons.visible = false;
            mainPlane.visible = true;
            console.log("clicked the play button")

            gamebackground.start();

            // 点击开始按钮后，mainPlane获取焦点
            buttons.focus = false;
            mainPlane.focus = true;
        }

    }


    Image {
        id: mainPlane
        visible: false;
        source: "../airport-picture/hero.png"
        x: 220 ; y: 650
        //        focus: true    // 此处定义焦点无效
        //        Text{
        //            text: activeFocus ? "I have focus" : "I have not focus"
        //        }

        //        KeyNavigation.up: Keys.topRight
        //        KeyNavigation.down: Keys.bottomLeft

        //        Keys.onUpPressed: (event)=>{
        //                              if (y <768 && y > 0)
        //                                y -= 20;
        //                              else event.accepted = false;
        //}
        Keys.onUpPressed:  y -= 20
        Keys.onDownPressed: y += 20
        Keys.onLeftPressed: x -= 20
        Keys.onRightPressed: x += 20
    }
}



