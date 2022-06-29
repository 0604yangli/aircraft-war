/***************************************
    name:           yangli
    student ID:     2020051615074
    effort:         Buttons.qml
    time:           2022-06-29
****************************************/

import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0

Item{
    property alias maininterface_and_restart: maininterface_and_restart
    property alias maininterfaceButton: maininterface
    property alias restartButton: restart

    property alias playButton: play
    property alias practiceButton: practice
    property alias rankButton: rank
    property alias aboutButton: about
    property alias audioButton: audio

    anchors.fill: parent

    Item{
        id: maininterface_and_restart
        width: parent.width
        height: 100
        anchors.bottom: parent.bottom
        GameButton{
            id: maininterface
            width: 160; height: parent.height
            anchors.left: parent.left
            visible: false
            opacity: 0.7
            Text{
                text: qsTr("Return")
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 30
            }
        }
        GameButton{
            id: restart
            width: 160; height: parent.height
            anchors.right: parent.right
            visible: false
            opacity: 0.7
            Text{
                text: qsTr("Restart")
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 30
            }
        }
    }

    Column{
        width: 200; height: 350; y: 360
        spacing: 15
        opacity: 0.7
        anchors.horizontalCenter: parent.horizontalCenter

        // Pass mode button
        GameButton{
            id: play
            width: parent.width; height: 80
            Text{
                text: qsTr("PASS MODE")
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 18
            }
        }

        // Practice mode button
        GameButton{
            id: practice
            width: parent.width; height: 80
            Text{
                text: qsTr("PRACTICE MODE")
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 18
            }
        }

        // Rank list button
        GameButton{
            id: rank
            width: parent.width; height: 80
            Text{
                text: qsTr("RANK LIST")
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 18
            }
        }

        // About button
        GameButton{
            id: about
            width: parent.width; height: 80
            //            text: qsTr("ABOUT GAME")

            //            GameStyle{
            //                buttonTextColor: "red"

            //            }

            Text{
                text: qsTr("ABOUT GAME")
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 18
            }
        }
    }
    BackgroundMusic{
        source: "../../assets/wav/bg.wav"
        autoPlay: true
        GameSwitch {
            id: audio
            y:6
            anchors.right: parent.right
            onCheckedChanged: {
                // .. enter code using the checked value here ..
            }
        }
    }
}
