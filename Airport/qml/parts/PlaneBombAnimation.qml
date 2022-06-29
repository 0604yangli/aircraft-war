/***************************************

    name:           yangli
    student ID:     2020051615074
    effort:         PlaneBombAnimation
    time:           202-06-28

****************************************/

import QtQuick 2.0

// bomb animation
Item{
    Component.onCompleted: console.log("`````bomb annimation creating");
    property alias bomb: bomb

    anchors.fill: parent

    SequentialAnimation{
        id: bomb
        running: false
        ScriptAction{ script: bombimage.goalSprite = "bombover";}
        ScriptAction{ script: {bombimage.goalSprite = ""; bombimage.jumpTo("bombstart");}}
    }
    SpriteSequence{
        anchors.centerIn:  parent
        id: bombimage; width: parent.width ; height: parent.height; goalSprite: ""
        Sprite{
            name: "bombstart"; source: "../../assets/img/bomb.png"
            frameCount: 1;
            frameX:88; frameY: 145
            frameWidth: parent.width; frameHeight: parent.width; frameDuration: 500
            to: {"bomb2": 1}
        }
        Sprite{
            name: "bomb2"; source: "../../assets/img/bomb.png"
            frameCount: 1;
            frameX:0; frameY: 132
            frameWidth: parent.width; frameHeight: parent.width; frameDuration: 500
            to: {"bomb3": 1}
        }
        Sprite{
            name: "bomb3"; source: "../../assets/img/bomb.png"
            frameCount: 1;
            frameX:0; frameY: 62
            frameWidth: parent.width; frameHeight: parent.width; frameDuration: 400
            to: {"bomb4": 1}
        }
        Sprite{
            name: "bomb4"; source: "../../assets/img/bomb.png"
            frameCount: 1;
            frameX:93; frameY: 0
            frameWidth: parent.width; frameHeight: parent.width; frameDuration: 200
            to: {"bomb5": 1}
        }
        Sprite{
            name: "bomb5"; source: "../../assets/img/bomb.png"
            frameCount: 1;
            frameX:0; frameY: 0
            frameWidth: parent.width; frameHeight: parent.width; frameDuration: 100
            to: {"bomb6": 1}
        }
        Sprite{
            name: "bomb6"; source: "../../assets/img/bomb.png"
            frameCount: 1;
            frameX:93; frameY: 61
            frameWidth: parent.width; frameHeight: parent.width; frameDuration: 50
            to: {"bombover": 1}
        }
        Sprite{
            name: "bombover"; source: "../../assets/img/bomb.png"
            frameCount: 1;
            frameX:89; frameY: 108
            frameWidth: parent.width; frameHeight: parent.width; frameDuration: 50
            to: {"bombover": 1}
        }
    }
}
