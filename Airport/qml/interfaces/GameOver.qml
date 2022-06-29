/*****************************************************************

    name:           yangli
    student ID:     2020051615074
    effort:         GameOver.qml
    time:           2022-06-29

******************************************************************/

import QtQuick 2.0
import "../parts"

Rectangle{
    anchors.fill: parent
    visible: false
    color: "grey"
    opacity: 0.5

    Text {
        id: gameover
        anchors.centerIn: parent
        text: "Game Over !"
        font.pixelSize: 30
    }
}
