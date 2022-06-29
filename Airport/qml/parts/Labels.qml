/*****************************************************************
    name:           yangli
    student ID:     2020051615074
    effort:         Labels.qml
    time:           2022-06-24
******************************************************************/
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

RowLayout{
    property alias scoreLabel: scorelabel
    property alias timerLabel: timerlabel

    property int score: 0
    property int time : 0

    width: parent.width
    Text{
        id: scorelabel
        Layout.minimumWidth: 200
        Layout.maximumWidth: 200
        text: "得分 : " + score + "分"
        font.pixelSize: 25
    }

    Text{
        id: timerlabel
        Layout.minimumWidth: 512/2
        Layout.maximumWidth: 512/2
        text: "时间 : " + time + "s"
        font.pixelSize: 25
    }
}
