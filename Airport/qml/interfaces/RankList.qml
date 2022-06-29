/*****************************************************************
    name:           yangli
    student ID:     2020051615074
    effort:         RankList.qml
    time:           2022-06-29
******************************************************************/

import QtQuick 2.0
import "../parts"

Rectangle{
    property int score: 0

    anchors.fill: parent
    visible: false
    color: "grey"
    opacity: 0.5
    ListView{
        width: parent.width
        height: parent.height
        spacing: 5
        model: 1
        delegate: Rectangle{
            width: parent.width
            height: 30
            Text {
                anchors.centerIn: parent
                text: "score       :        " + score
                font.pixelSize: 30
            }
        }
    }

}
