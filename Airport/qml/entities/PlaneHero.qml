/*****************************************************************
    name:           yangli        zhuyuhao      qinhaiguo
    student ID:     2020051615074 2020051615059 2020051615089
    effort:         PlaneHero.qml
                    Creating Plane Hero
    time:           2022-06-29
******************************************************************/
import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: plane
    // the enityId should be set by the level file!
    entityType: "planeHero"
    focus: true

    property alias inputActionsToKeyCode: twoAxisController.inputActionsToKeyCode
    property alias image: image

    // gets accessed to insert the input when touching the HUDController
    property alias controller: twoAxisController

    readonly property real forwardForce: 1000 * world.pixelsPerMeter

    x: 258
    y: 550
    // rotation in degrees clockwise
    rotation: -90

    inputActionsToKeyCode: {
        "up": Qt.Key_W,
        "down": Qt.Key_S,
        "left": Qt.Key_A,
        "right": Qt.Key_D,
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
        friction: 0.3
        restitution: 0.5
        body.bullet: true
        body.linearDamping: 5
        body.angularDamping: 15



        // do not change rotation
        body.fixedRotation: true

        // this is applied every physics update tick
        force: Qt.point(twoAxisController.yAxis*forwardForce, twoAxisController.xAxis*forwardForce)

        property int bombflag: 0
        fixture.onBeginContact: {
            var fixture = other
            var body = other.getBody()
            var component = other.getBody().target
            var collidingType = component.entityType

            if(collidingType === "planeEnemy" || collidingType === "bullet") {
                bombflag++;
                if(bombflag === 5){
                    // bomb animation
                    planebombAnimation.visible = true;
                    planebombAnimation.bomb.start();

                    plane.removeEntity();
                    bombflag = 0;
                }
                return
            }
        }
    }
    Timer {
        id: bulletshoot
        interval: 200 // milliseconds
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            plane.autoFire();
        }
    }

    // plane hero auto fire
    function autoFire() {
        var imagePointInWorldCoordinates = mapToItem(level,image.imagePoints[0].x, image.imagePoints[0].y)
        // create the bullet at the specified position with the rotation of the plane that fires it
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("BulletHero.qml"), {"x": imagePointInWorldCoordinates.x, "y": imagePointInWorldCoordinates.y, "rotation": plane.rotation, "visible" : true})
    }

}
