/*****************************************************************
    name:           yangli
    student ID:     2020051615074
    effort:         RankList.qml
    time:           2022-07-09
******************************************************************/

import QtQuick 2.0

Rectangle{
    property var scores: new Array
    property var time: new Array

    anchors.fill: parent
    visible: false
    color: "grey"
    opacity: 0.5

    function setdata(){
        listModel.clear();
        for(var i = 0; i < scores.length; i++){
            var data = {"score": "Score : " + scores[i]};
            console.debug("data = " + data)
            listModel.append(data);
        }
    }

    ListView{
        width: parent.width
        y: 30
        height: parent.height - 30
        spacing: 10
        model: ListModel{
            id: listModel
        }

        delegate:
            scoredata

    }
    Component {
        id: scoredata
        Rectangle{
            width: parent.width
            height: 40
            Text {
                anchors.centerIn: parent
                text: score
                font.pixelSize: 30
            }
        }
    }


}
