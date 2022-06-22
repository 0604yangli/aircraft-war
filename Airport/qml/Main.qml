import Felgo 3.0
import QtQuick 2.0
//import Image 1.0

GameWindow {
    id: gameWindow

    screenWidth: 512
    screenHeight: 768

    GameBackGround {
        id: background
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
        z:1
        id: play_signal
    }

    Image {
        id: mainPlane
        source: "../飞机大战素材/hero.png"
        x: 240; y: 700
        focus: true
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

