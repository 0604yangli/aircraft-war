/*****************************************************************
    name:           yangli
    student ID:     2020051615074
    effort:         Wall.qml
                    Creating wall
    time:           2022-06-27
******************************************************************/
import QtQuick 2.0

import Felgo 3.0

EntityBase {
    id: entity
    entityType: "wall"

    BoxCollider {
        id: boxCollider
        bodyType: Body.Static
        // the size of the collider is the same as the one from entity by default
    }

    Rectangle {
        anchors.fill: parent
        // this could be set to true for debugging
        visible: false
    }
}
