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
    property alias enemyPlane1Go: enemyPlane1Go

    property alias enemyPlane2: enemyPlane2
    property alias enemyPlane2Go: enemyPlane2Go

    property alias enemyPlane3: enemyPlane3
    property alias enemyPlane3Go: enemyPlane3Go

    property alias enemyPlane4: enemyPlane4
    property alias enemyPlane4Go: enemyPlane4Go

    property alias enemyPlane5: enemyPlane5
    property alias enemyPlane5Go: enemyPlane5Go

    width: parent.width; height: parent.height

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
    NumberAnimation{
        id: enemyPlane1Go
        target: enemyPlane1
        property: "y"
        from: -30
        to: 768
        duration: 10000  // 10s
    }

    Image{
        id: enemyPlane2
        visible: false;
        source: "../airport-picture/img-plane_2.png"
    }
    NumberAnimation{
        id: enemyPlane2Go
        target: enemyPlane2
        property: "y"
        from: -30
        to: 768
        duration: 10000  // 10s
    }

    Image{
        id: enemyPlane3
        visible: false;
        source: "../airport-picture/img-plane_3.png"
    }
    NumberAnimation{
        id: enemyPlane3Go
        target: enemyPlane3
        property: "y"
        from: -30
        to: 768
        duration: 10000  // 10s
    }

    Image{
        id: enemyPlane4
        visible: false;
        source: "../airport-picture/img-plane_4.png"
    }
    NumberAnimation{
        id: enemyPlane4Go
        target: enemyPlane4
        property: "y"
        from: -30
        to: 768
        duration: 10000  // 10s
    }

    Image{
        id: enemyPlane5
        visible: false;
        source: "../airport-picture/img-plane_5.png"
    }
    NumberAnimation{
        id: enemyPlane5Go
        target: enemyPlane5
        property: "y"
        from: -30
        to: 768
        duration: 10000  // 10s
    }

}
