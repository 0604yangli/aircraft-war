/***************************************

    name:           yangli
    student ID:     2020051615074
    effort:         GmaeBackGround.qml
    time:           2022-06-23

****************************************/

import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: name
    height: 768

    function start() {
        backSlider.start();
//        myTimer.start();
        console.log("backSlider beginning");
    }

    ListView{
        id: maps
        height: parent.height * 11
        y: -768 * 10
        width: 640
        // 倒排视图
        verticalLayoutDirection: ListView.VerticalBottomToTop

        model: 12
        delegate: Component {
            id: ima
            Image {
                id: backimage
                source: "../airport-picture/img_bg_level_1.jpg"
            }
        }

        // background slider animation
        NumberAnimation{
            id: backSlider
            target: maps
            property: "y"
            to: 768
            duration: 100000  // 100s
        }

    }
//    RadioButton {
//        text: "start"
//        anchors.top: parent
//        opacity: 0.7
//        onClicked: ()=>{
//                       console.log("click")
//                       backSlider.start();
//                   }
//    }



//    Component.onCompleted: {
//               backSlider.start();
//        console.log("maps.y = " + maps.y);
//           }
}


