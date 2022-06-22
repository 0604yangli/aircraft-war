import QtQuick 2.0
import QtQuick.Controls 2.0

Button{
    width: 512; height: 100
    visible: true
    anchors.centerIn: parent
    opacity: 0.5

    Text {
        anchors.centerIn:  parent
        text: "PLAY GAME"
        font.pixelSize: 28
        color: "#ffff00"
    }
}

