/*****************************************************************
    name:           yangli        zhuyuhao      qinhaiguo
    student ID:     2020051615074 2020051615059 2020051615089
    effort:         BulletEnemy1.qml
                    Bullets used by plane enemy1
    time:           2022-07-09
******************************************************************/

import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: entity
    entityType: "bullet"

    Component.onCompleted: applyForwardImpulse();

    property alias image: image

    BoxCollider {
        id: boxCollider

        // the image and the physics will use this size; this is important as it specifies the mass of the body! it is in respect to the world size
        width: 50
        height: 20

        anchors.centerIn: parent

        density: 0.003
        friction: 0.4
        restitution: 0.5
        body.bullet: true

        // we prevent the physics engine from applying rotation to the rocket, because we will do it ourselves
        body.fixedRotation: true

        property var lastWall: null

        fixture.onBeginContact: {
            var fixture = other;
            var body = other.getBody();
            var otherEntity = body.target

            // get the entityType of the colliding entity
            var collidingType = otherEntity.entityType

            if(collidingType === "planeHero" || collidingType === "planeEnemy" || collidingType === "bulletHero") {
                entity.removeEntity();
                return;
            }
        }
    }

    Image {
        id: image
        source: "../../assets/img/bullet_6.png"
        anchors.centerIn: parent
        width: boxCollider.width
        height: boxCollider.height
    }

    function applyForwardImpulse() {
        var power = 1500
        var rad = entity.rotation / 180 * Math.PI

        //can't use body.toWorldVector() because the rotation is not instantly
        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))
        boxCollider.body.applyLinearImpulse(localForward, boxCollider.body.getWorldCenter())
    }

}
