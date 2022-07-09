/*****************************************************************
    name:           yangli
    student ID:     2020051615074
    effort:         AboutGame.qml
    time:           2022-07-09
******************************************************************/

import QtQuick 2.0

Rectangle{
    anchors.fill: parent
    visible: false
    color: "grey"
    opacity: 0.8
    Text {
        anchors.centerIn: parent
        text: "<h2>Airport war game</h2>
             <p>Game maker<br/>
                Yang Li 2020051615074<br/>
                Zhu Yu Hao 2020051615059<br/>
                Qin Hai Guo 2020051615089</p>
             <p>Game version<br/>
                Airport war v2.0</p>
             <p>Game Description</br>
                planeHero can be hit 5 times by enemy planes and bullets.<br/>
                Add 3 points if you destroy(Bullets hit five times) the blue enemy plane.<br/>
                Add 5 points if you destroy(Bullets hit five times) the red enemy plane.<br/>
                Add 20 points if you destroy(Bullets hit 20 times) boss.<br/>
             </p>"
    }
}
