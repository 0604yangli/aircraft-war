/*****************************************************************
    name:           yangli
    student ID:     2020051615074
    effort:         GameOver.qml
                    Screen to be displayed at the end of the game

    time:           2022-06-29
******************************************************************/

import QtQuick 2.0
import "../parts"

Rectangle{
    visible: false
    color: "grey"
    opacity: 0.5
    anchors.fill: parent
    Text {
        anchors.centerIn: parent
        text: "Game Over!\nYour score : " + labels.score
        color: "red"
        font.pixelSize: 38
    }
}
