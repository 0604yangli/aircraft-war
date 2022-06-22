import Felgo 3.0
import QtQuick 2.0
//import Image 1.0

GameWindow {
    id: gameWindow

    screenWidth: 512
    screenHeight: 768

    GameBackGround {
        id: gamebackground
    }

    //        SequentialAnimation on opacity {
    //            loops: Animation.Infinite
    //            PropertyAnimation {
    //                to: 0
    //                duration: 1000 // 1 second for fade out
    //            }
    //            PropertyAnimation {
    //                to: 1
    //                duration: 1000 // 1 second for fade in
    //            }
    //        }


    PlayGame{
        id: play_signal

        onClicked:  {
            play_signal.visible = false;
            mainPlane.visible = true;
            gamebackground.start();

            // 点击开始按钮后，mainPlane获取焦点
            play_signal.focus = false;
            mainPlane.focus = true;
        }
    }

    Image {
        id: mainPlane
        visible: false;
        source: "../飞机大战素材/hero.png"
        x: 240; y: 700
//        focus: true    // 此处定义焦点无效
        Text{
            text: activeFocus ? "I have focus" : "I have not focus"
        }
//        KeyNavigation.up: Keys.topRight
//        KeyNavigation.down: Keys.bottomLeft

        //        PlaneImage{
        //            name: "1.hero"
        //            onNameChanged: mainPlane.source = "../飞机大战素材/hero2.png"
        //        }

        Keys.onUpPressed: y -= 10
        Keys.onDownPressed: y += 10
        Keys.onLeftPressed: x -= 10
        Keys.onRightPressed: x += 10
    }


}

