/***************************************

    name:           yangli
    student ID:     2020051615074
    effort:         Planes.qml
    time:           2022-06-23

****************************************/
import QtQuick 2.0

Item {
    property alias heroPlane: heroPlane
    property alias enemyPlane1: enemyPlane1
    property alias enemyPlane2: enemyPlane2
    property alias enemyPlane3: enemyPlane3
    property alias enemyPlane4: enemyPlane4
    property alias enemyPlane5: enemyPlane5

    width: parent.width; height: parent.height

    function creatEnemyplane1(){
        enemyPlane1.visible = true;
        enemyPlane1.x = Math.random()* 500;
        console.log("Math.random()* 500 = " + Math.random()* 500);
        enemyPlane1.y = 0;
    }

    Image{
        id: heroPlane
        visible: false;
        source: "../airport-picture/hero.png"

        // initial coordinates
        x: 220 ; y: 650

        Keys.onUpPressed:  y -= 20
        Keys.onDownPressed: y += 20
        Keys.onLeftPressed: x -= 20
        Keys.onRightPressed: x += 20
    }

    Image{
        id: enemyPlane1
        visible: false;
        source: "../airport-picture/img-plane_1.png"
    }

    Image{
        id: enemyPlane2
        visible: false;
        source: "../airport-picture/img-plane_2.png"
    }

    Image{
        id: enemyPlane3
        visible: false;
        source: "../airport-picture/img-plane_3.png"
    }

    Image{
        id: enemyPlane4
        visible: false;
        source: "../airport-picture/img-plane_4.png"
    }

    Image{
        id: enemyPlane5
        visible: false;
        source: "../airport-picture/img-plane_5.png"
    }

}
