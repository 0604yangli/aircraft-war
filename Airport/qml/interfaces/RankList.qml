/*****************************************************************

    name:           yangli
    student ID:     2020051615074
    effort:         RankList.qml
    time:           2022-06-29

******************************************************************/

import QtQuick 2.0
import "../parts"

Rectangle{
    anchors.fill: parent
    visible: false
    color: "grey"
    opacity: 0.5
    ListView{
        width: parent.width
        height: parent.height
        spacing: 5
        model: ListModel{
            id: lm
            Component.onCompleted: {
                lm.append({"score" : label.score});
            }
        }
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

    Labels{
        id: label
        visible: false
    }
}
