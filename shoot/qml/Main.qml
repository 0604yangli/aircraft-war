import Felgo 3.0
import QtQuick 2.0

GameWindow {
    id: gameWindow
    screenWidth: 512
    screenHeight: 768

    function fair(){
        bulletImage.x=heroplaneImage.x+40
    }

    BackgroundImage{
        id:backgroundImage
        anchors.fill: parent
        source: "/root/image_airwar/img_bg_level_2.jpg"
    }

    Image {
        id:heroplaneImage
        focus: true
        source: "/Aircraft_war1.0/untitled4/image_airwar/hero.png"
        x: screenWidth / 2  - 40
        y: screenHeight / 2

        Keys.onUpPressed: heroplaneImage.y -= 20
        Keys.onDownPressed: heroplaneImage.y += 20
        Keys.onLeftPressed: heroplaneImage.x -= 20
        Keys.onRightPressed: heroplaneImage.x += 20
    }

    Image {

        property int xPosition:heroplaneImage.x+40
        id: bulletImage
        source: "/Aircraft_war1.0/untitled4/image_airwar/bullet_1.png"
        x:xPosition
        //onXChanged: x=xPosition
//        y: heroplaneImage.y - 25
        y: heroplaneImage.y
//        NumberAnimation on y {
//            from: heroplaneImage.y + 400
//            to: 0
//            duration: 2000
//            loops: Animation.Infinite
//            running:true

//        }
    }
    PropertyAnimation {
        target: bulletImage
        property: "y"
        from: heroplaneImage.y+400
        to: 0
        duration: 2000
        loops: Animation.Infinite
        running:true

    }
    PropertyAnimation {
        target: bulletImage
        property: "x"
        from: heroplaneImage.x + 300
        to: heroplaneImage.x + 300
        duration: 2000
        loops: Animation.Infinite
        running:true

    }

    //    NumberAnimation on y {
    //                    from: heroplaneImage.y
    //        to: 0
    //        duration: 2000
    //        loops: Animation.Infinite
    //        running:true
    //    }

    Timer{
        id:bulletTime
        interval: 1000
        repeat: false
        running: true
        triggeredOnStart:true
        onTriggered: {
            console.log("heroplaneImage.y = " +heroplaneImage.y);
            console.log("bulletImage.y=" + bulletImage.y);
        }
    }
}
//    Rectangle{
//         id: enemyplaneR
//         Image{
//             id: enemyplaneImage
//             source: "/Aircraft_war1.0/untitled4/image_airwar/img-plane_1.png"
//         }
//         x:Math.random()
//         x:200
//         y:0

//         NumberAnimation on y {
//             from: 0
//             to: 700
//             duration: 8000
//             loops: Animation.Infinite
//         }
//         Timer{
//             id:enemyplaneTime
//             interval: 1000
//             repeat: true
//             running: true
//             triggeredOnStart:true
//         }
//         Keys.onSpacePressed: console.log(x)
//     }

