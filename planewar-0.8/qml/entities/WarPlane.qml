import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: warPlane
    rotation: 90
    // the enityId should be set by the level file!
    entityType: "warPlane"

//    property alias war_inputActionsToKeyCode: war_twoAxisController.inputActionsToKeyCode
    property alias war_image: war_image

    // gets accessed to insert the input when touching the HUDController
//    property alias war_controller: war_twoAxisController

    readonly property real war_forwardForce: 8000 * world.pixelsPerMeter

    Component.onCompleted: {
        console.debug("warPlane.onCompleted()")
        console.debug("warPlane.x:", x)
        var mapped = mapToItem(world.debugDraw, x, y)
        console.debug("warPlane.x world:", mapped.x)
    }

    Image {
        id: war_image
        source: "/root/image_airwar/img-plane_7.png"

        anchors.centerIn: parent
        width: war_boxCollider.width
        height: war_boxCollider.height

        property list<Item> imagePoints: [
            // this imagePoint can be used for creation of the rocket
            // it must be far enough in front of the car that they don't collide upon creation
            // the +30 might have to be adapted if the size of the rocket is changed
            Item {x: war_image.width/2+30}
        ]

    }

    // this is used as input for the BoxCollider force & torque properties
//    TwoAxisController {
//        id: war_twoAxisController

        // call the logic function when an input press (possibly the fire event) is received
//        onInputActionPressed: handleInputAction(actionName)
//    }

    BoxCollider {
        id: war_boxCollider

        // the image and the physics will use this size; this is important as it specifies the mass of the body! it is in respect to the world size
        width: 60
        height: 100

        anchors.centerIn: parent

        density: 0.02
        friction: 0.4
        restitution: 0.5
        body.bullet: true
        body.linearDamping: 10
        body.angularDamping: 15
        body.fixedRotation: true

        property var lastWall: null

        fixture.onBeginContact: {
            var fixture = other;
            var body = other.getBody();
            var otherEntity = body.target

            // get the entityType of the colliding entity
            var collidingType = otherEntity.entityType

            if( collidingType === "rocket" ||
                    collidingType === "wall") {
                warPlane.removeEntity()

                return
            }

            //can't hit the same wall twice, but onBeginContact called again after rotation has changed
            if(otherEntity === lastWall) {
                return;
            }
            lastWall = otherEntity

            //apply law of reflection, all calculations in degrees
//            var normalAngle = 180 / Math.PI * Math.atan2(contactNormal.y, contactNormal.x)
//            var angleDiff = normalAngle - entity.rotation
//            var newAngle = entity.rotation + 2 * angleDiff + 180

            // manually set the entity rotation, because it is the target and its rotation will be used for the physics body
//            entity.rotation = newAngle

            // it's important to clear the old velocity before applying the impulse, otherwise the rocket would get faster every time it collides with a wall!
            war_boxCollider.body.linearVelocity = Qt.point(0,0)

//            applyForwardImpulse();
        }

    }
//    Component.onCompleted: {
////      x = utils.generateRandomValueBetween(0,balloonScene.width-sprite.width)
//      x = utils.generateRandomValueBetween(100,400)
//      y = 80
//    }
}
