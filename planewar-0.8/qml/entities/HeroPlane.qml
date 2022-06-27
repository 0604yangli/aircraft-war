import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: heroPlane
    // the enityId should be set by the level file!
    entityType: "heroPlane"

    property alias inputActionsToKeyCode: twoAxisController.inputActionsToKeyCode
    property alias image: image

    // gets accessed to insert the input when touching the HUDController
    property alias controller: twoAxisController

    readonly property real forwardForce: 8000 * world.pixelsPerMeter

    Component.onCompleted: {
        console.debug("heroPlane.onCompleted()")
        console.debug("heroPlane.x:", x)
        var mapped = mapToItem(world.debugDraw, x, y)
        console.debug("heroPlane.x world:", mapped.x)
    }

    Image {
        id: image
        source: "/root/image_airwar/hero.png"

        anchors.centerIn: parent
        width: boxCollider.width
        height: boxCollider.height

        property list<Item> imagePoints: [
            // this imagePoint can be used for creation of the rocket
            // it must be far enough in front of the car that they don't collide upon creation
            // the +30 might have to be adapted if the size of the rocket is changed
            Item {x: image.width/2+30}
        ]

    }

    // this is used as input for the BoxCollider force & torque properties
    TwoAxisController {
        id: twoAxisController

        // call the logic function when an input press (possibly the fire event) is received
        onInputActionPressed: handleInputAction(actionName)
    }

    BoxCollider {
        id: boxCollider

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

        // this is applied every physics update tick
        force: Qt.point(twoAxisController.yAxis*forwardForce, twoAxisController.xAxis*forwardForce)

        Component.onCompleted: {
            console.debug("heroPlane.physics.x:", x)
            var mapped = mapToItem(world.debugDraw, x, y)
            console.debug("heroPlane.physics.x world:", mapped.x)
        }

        fixture.onBeginContact: {
            var fixture = other
            var body = other.getBody()
            var component = other.getBody().target
            var collidingType = component.entityType

            //var
            console.debug("heroPlane contact with: ", other, body, component)
            console.debug("heroPlane collided entity type:", collidingType)

            console.debug("heroPlane contactNormal:", contactNormal, "x:", contactNormal.x, "y:", contactNormal.y)

        }
    }

    function handleInputAction(action) {
        if( action === "fire") {
            // x&y of this component are 0..
            console.debug("creating weapon at current position x", heroPlane.x, "y", heroPlane.y)
            console.debug("image.imagePoints[0].x:", image.imagePoints[0].x, ", image.imagePoints[0].y:", image.imagePoints[0].y)

            // this is the point that we defined in Car.qml for the rocket to spawn
            var imagePointInWorldCoordinates = mapToItem(level,image.imagePoints[0].x, image.imagePoints[0].y)
            console.debug("imagePointInWorldCoordinates x", imagePointInWorldCoordinates.x, " y:", imagePointInWorldCoordinates.y)

            // create the rocket at the specified position with the rotation of the car that fires it
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Rocket.qml"), {"x": imagePointInWorldCoordinates.x, "y": imagePointInWorldCoordinates.y, "rotation": heroPlane.rotation})

        }
    }
}
