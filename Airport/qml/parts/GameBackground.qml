/***************************************

    name:           yangli
    student ID:     2020051615074
    effort:         GmaeBackGround.qml
    time:           2022-06-27

****************************************/

import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property var bg1: "../../assets/img/img_bg_level_1.jpg"
    property var bg2: "../../assets/img/img_bg_level_2.jpg"
    property var bg3: "../../assets/img/img_bg_level_3.jpg"
    property var bg4: "../../assets/img/img_bg_level_4.jpg"
    property var bg5: "../../assets/img/img_bg_level_5.jpg"

    height: parent.height
    width: parent.width

    focus: false
    // backSlider beginning
    function start() {
        backSlider.start();
        console.log("backSlider beginning");
    }

    ListView{
        id: maps
        width: parent.width
        height: parent.height * 11
        y: -768 * 10

        // 倒排视图
        verticalLayoutDirection: ListView.VerticalBottomToTop

        model: 12
        delegate: Component {
            id: ima
            Image {
                id: backimage
//                source: "../../assets/img/img_bg_level_5.jpg"
                source: bg2
            }
        }

        // background slider animation
        NumberAnimation{
            id: backSlider
            target: maps
            property: "y"
            to: 768
            duration: 120000  // 120s
        }

    }
}


