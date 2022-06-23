/***************************************

    name:           yangli
    student ID:     2020051615074
    effort:         Buttons.qml
    time:           2022-06-23

****************************************/

import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0

Item{
    property alias playButton: play
    property alias rankButton: rank
    property alias setButton: set

    width: 150; height: 300
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom:  parent.bottom

    Column{
        anchors.fill: parent
        spacing: 10
        opacity: 0.7
        // Start play button
        GameButton{
            id: play
            width: 150; height: 60
            text: qsTr("PLAY GAME")
        }

        // Rank list button
        GameButton{
            id: rank
            width: 150; height: 60
            text: qsTr("RANK LIST")
        }

        // Set button
        GameButton{
            id: set
            width: 150; height: 60
            text: qsTr("SETTING")
        }
        GameSwitch {
          onCheckedChanged: {
            // .. enter code using the checked value here ..
          }
        }
    }
}
