/*****************************************************************
    name:           yangli        zhuyuhao      qinhaiguo
    student ID:     2020051615074 2020051615059 2020051615089
    effort:         PlaneEnemy2.qml
                    Entity Plane Enemy2
    time:           2022-07-09
******************************************************************/
import QtQuick 2.0
import Felgo 3.0
import "../parts"

EntityBase {
    id: plane
    // the enityId should be set by the level file!
    entityType: "planeEnemy"

    property alias inputActionsToKeyCode: twoAxisController.inputActionsToKeyCode
    property alias image: image

    // gets accessed to insert the input when touching the HUDController
    property alias controller: twoAxisController

    property alias bulletshoot: bulletshoot

    readonly property real forwardForce: 1000 * world.pixelsPerMeter

    Component.onCompleted: {
        console.debug("planeEnemy.onCompleted()")
        console.debug("planeEnemy.x:", x)
        var mapped = mapToItem(world.debugDraw, x, y)
        console.debug("planeEnemy.x world:", mapped.x)


        // Enemy plane appear randomly on the x-axis
        x = utils.generateRandomValueBetween(70,scene.width - 70)
        y = 0;
    }

    Image {
        id: image
        source: "../../assets/img/img-plane_6.png"

        anchors.centerIn: parent
        width: boxCollider.width
        height: boxCollider.height

        property list<Item> imagePoints: [
            // this imagePoint can be used for creation of the bullet
            // it must be far enough in front of the p;plane that they don't collide upon creation
            // the +30 might have to be adapted if the size of the rocket is changed
            Item {x: image.width/2 - 70}
        ]
        PlaneBombAnimation{
            id: planebombAnimation
            visible: false
            bomb.running: false
        }

    }
    NumberAnimation {
        id: planeEnemygoing
        target: plane
        property: "y"
        from: -30
        to: 800
        running: true
        duration: 10000
    }

    // this is used as input for the BoxCollider force & torque properties
    TwoAxisController {
        id: twoAxisController
    }

    BoxCollider {
        id: boxCollider
        // the image and the physics will use this size; this is important as it specifies the mass of the body! it is in respect to the world size
        width: 90
        height: 85

        anchors.centerIn: parent
        density: 0.008
        friction: 0.5
        restitution: 0.5
        body.bullet: true
        body.linearDamping: 5
        body.angularDamping: 15

        // do not change rotation
        body.fixedRotation: true

        // this is applied every physics update tick
        force: Qt.point(twoAxisController.yAxis*forwardForce, twoAxisController.xAxis*forwardForce)

        // number of hits
        property int bombflag: 0
        fixture.onBeginContact: {
            var fixture = other
            var body = other.getBody()
            var component = other.getBody().target
            var collidingType = component.entityType

            if(collidingType === "planeHero" || collidingType === "bulletHero") {
                bombflag++;

                // hit the plane five times and it will explode
                if(bombflag === 5){
                    // bomb animation
                    planebombAnimation.visible = true;
                    planebombAnimation.bomb.start();

                    // remove the plane
                    removePlanetime.start();
                    labels.score += 5;
                    // prevent repeated scoring by counting to 5 times during bomb
                    return
                }
            }
        }

        Timer {
            id: removePlanetime
            interval: 1400
            running: false
            repeat: false
            triggeredOnStart: false
            // remove the plane after 1.4s
            onTriggered: {
                plane.removeEntity()
                console.debug("remove plane enemy2")
                stop()
            }
        }
    }
    Timer {
        id: bulletshoot
        interval: 3300 // milliseconds
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            plane.autoFire();
        }
    }

    function autoFire() {
        var imagePointInWorldCoordinates = mapToItem(scene,image.imagePoints[0].x, image.imagePoints[0].y)
        // create the bullet at the specified position with the rotation of the plane that fires it
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("BulletEnemy.qml"), {"x": imagePointInWorldCoordinates.x + 25, "y": imagePointInWorldCoordinates.y + 80, "rotation": plane.rotation + 90, "visible" : true})
    }
}
