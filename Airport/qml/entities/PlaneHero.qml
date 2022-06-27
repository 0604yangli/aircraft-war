
import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: plane
    // the enityId should be set by the level file!
    entityType: "plane"
    property alias plane_fair: plane_fair1
    property alias inputActionsToKeyCode: twoAxisController.inputActionsToKeyCode
    property alias image: image

    // gets accessed to insert the input when touching the HUDController
    property alias controller: twoAxisController

    readonly property real forwardForce: 1000 * world.pixelsPerMeter

    Component.onCompleted: {
        console.debug("planeHero.onCompleted()")
        console.debug("planeHero.x:", x)
        var mapped = mapToItem(world.debugDraw, x, y)
        console.debug("planeHero.x world:", mapped.x)
    }

    Image {
        id: image
        source: "../../assets/img/hero2.png"

        anchors.centerIn: parent
        width: boxCollider.width
        height: boxCollider.height

        property list<Item> imagePoints: [
            // this imagePoint can be used for creation of the bullet
            // it must be far enough in front of the p;plane that they don't collide upon creation
            // the +30 might have to be adapted if the size of the rocket is changed
            Item {x: image.width/2 + 30}
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

        density: 0.004
        friction: 0.5
        restitution: 0.5
        body.bullet: true
        body.linearDamping: 5
        body.angularDamping: 15


        // do not change rotation
        body.fixedRotation: true

        // this is applied every physics update tick
        force: Qt.point(twoAxisController.yAxis*forwardForce, twoAxisController.xAxis*forwardForce)


        Component.onCompleted: {
            console.debug("planeHero.physics.x:", x)
            var mapped = mapToItem(world.debugDraw, x, y)
            console.debug("planeHero.physics.x world:", mapped.x)
        }


        property int boomflag: 0
        fixture.onBeginContact: {
            var fixture = other
            var body = other.getBody()
            var component = other.getBody().target
            var collidingType = component.entityType


            if(collidingType === "plane" || collidingType === "bullet") {
                boomflag++;
                if(boomflag === 3){
                    plane.removeEntity();
                    boomflag = 0;
                }
                return
            }
            //var
            console.debug("planeHero contact with: ", other, body, component)
            console.debug("planeHero collided entity type:", collidingType)

            console.debug("planeHero contactNormal:", contactNormal, "x:", contactNormal.x, "y:", contactNormal.y)

        }
    }

    function handleInputAction(action) {
        if( action === "fire") {
            // x&y of this component are 0..
            console.debug("creating planeHero at current position x", plane.x, "y", plane.y)
            console.debug("image.imagePoints[0].x:", image.imagePoints[0].x, ", image.imagePoints[0].y:", image.imagePoints[0].y)

            // this is the point that we defined in Plane.qml for the bullet to spawn
            var imagePointInWorldCoordinates = mapToItem(level,image.imagePoints[0].x, image.imagePoints[0].y)

            console.debug("image.imagePoints[0] = " + image.imagePoints[0]);
            console.debug("imagePointInWorldCoordinates x", imagePointInWorldCoordinates.x, " y:", imagePointInWorldCoordinates.y)

            // create the bullet at the specified position with the rotation of the plane that fires it
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Bullet.qml"), {"x": imagePointInWorldCoordinates.x, "y": imagePointInWorldCoordinates.y, "rotation": plane_hero2.rotation})

        }
    }
    function autofair(){
         var imagePointInWorldCoordinates = mapToItem(level,image.imagePoints[0].x, image.imagePoints[0].y)
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Bullet.qml"), {"x": imagePointInWorldCoordinates.x, "y": imagePointInWorldCoordinates.y, "rotation": plane_hero2.rotation})
    }

    function autofair_start(){
         plane_fair1.start()
    }
    Timer
    {
        id:plane_fair1
        interval: 200
        repeat: true
        running: false
        triggeredOnStart: false
        onTriggered: autofair()
    }

}
