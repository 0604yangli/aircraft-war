/***************************************

    name:           yangli
    student ID:     2020051615074
    effort:         Planes.qml
    time:           2022-06-23

****************************************/
import QtQuick 2.0
import Felgo 3.0

EntityBase {
  id: plane
  // the enityId should be set by the level file!
  entityType: "plane"

  property alias inputActionsToKeyCode: twoAxisController.inputActionsToKeyCode
  property alias image: image

  // gets accessed to insert the input when touching the HUDController
  property alias controller: twoAxisController

  readonly property real forwardForce: 8000 * world.pixelsPerMeter

  Component.onCompleted: {
    console.debug("car.onCompleted()")
    console.debug("car.x:", x)
    var mapped = mapToItem(world.debugDraw, x, y)
    console.debug("car.x world:", mapped.x)
  }

  Image {
    id: image
    source: "../airport-picture/hero2.png"

    anchors.centerIn: parent
    width: boxCollider.width
    height: boxCollider.height

    property list<Item> imagePoints: [
      // this imagePoint can be used for creation of the bullet
      // it must be far enough in front of the p;plane that they don't collide upon creation
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
    width: 122
    height: 82

    anchors.centerIn: parent

    density: 0.02
    friction: 0.4
    restitution: 0.5
    body.bullet: true
    body.linearDamping: 5
    body.angularDamping: 15

    // this is applied every physics update tick
    force: Qt.point(twoAxisController.yAxis*forwardForce, 0)
    torque: twoAxisController.xAxis*2000 * world.pixelsPerMeter * world.pixelsPerMeter

    Component.onCompleted: {
      console.debug("car.physics.x:", x)
      var mapped = mapToItem(world.debugDraw, x, y)
      console.debug("car.physics.x world:", mapped.x)
    }

    fixture.onBeginContact: {
      var fixture = other
      var body = other.getBody()
      var component = other.getBody().target
      var collidingType = component.entityType

      //var
      console.debug("car contact with: ", other, body, component)
      console.debug("car collided entity type:", collidingType)

      console.debug("car contactNormal:", contactNormal, "x:", contactNormal.x, "y:", contactNormal.y)

    }
  }

  function handleInputAction(action) {
    if( action === "fire") {
      // x&y of this component are 0..
      console.debug("creating weapon at current position x", plane.x, "y", plane.y)
      console.debug("image.imagePoints[0].x:", image.imagePoints[0].x, ", image.imagePoints[0].y:", image.imagePoints[0].y)

      // this is the point that we defined in Plane.qml for the bullet to spawn
      var imagePointInWorldCoordinates = mapToItem(level,image.imagePoints[0].x, image.imagePoints[0].y)

        console.debug("image.imagePoints[0] = " + image.imagePoints[0]);
      console.debug("imagePointInWorldCoordinates x", imagePointInWorldCoordinates.x, " y:", imagePointInWorldCoordinates.y)

      // create the bullet at the specified position with the rotation of the plane that fires it
      entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Bullet.qml"), {"x": imagePointInWorldCoordinates.x - 100, "y": imagePointInWorldCoordinates.y - 80, "rotation": 270})

    }

    if ( action === "up"){
        console.debug("plane.x = " + plane.x);
        plane.y -= 20;
    }
  }
}

//Item {
//    property alias heroPlane: heroPlane
//    property alias enemyPlane1: enemyPlane1
//    property alias enemyPlane1Go: enemyPlane1Go

//    property alias enemyPlane2: enemyPlane2
//    property alias enemyPlane2Go: enemyPlane2Go

//    property alias enemyPlane3: enemyPlane3
//    property alias enemyPlane3Go: enemyPlane3Go

//    property alias enemyPlane4: enemyPlane4
//    property alias enemyPlane4Go: enemyPlane4Go

//    property alias enemyPlane5: enemyPlane5
//    property alias enemyPlane5Go: enemyPlane5Go

//    width: parent.width; height: parent.height

//    Image{
//        id: heroPlane
//        visible: false;
//        source: "../airport-picture/hero.png"

//        // initial coordinates
//        x: 220 ; y: 650

//        Keys.onUpPressed:  y -= 20
//        Keys.onDownPressed: y += 20
//        Keys.onLeftPressed: x -= 20
//        Keys.onRightPressed: x += 20
//    }

//    Image{
//        id: enemyPlane1
//        visible: false;
//        source: "../airport-picture/img-plane_1.png"
//    }
//    NumberAnimation{
//        id: enemyPlane1Go
//        target: enemyPlane1
//        property: "y"
//        from: -30
//        to: 768
//        duration: 10000  // 10s
//    }

//    Image{
//        id: enemyPlane2
//        visible: false;
//        source: "../airport-picture/img-plane_2.png"
//    }
//    NumberAnimation{
//        id: enemyPlane2Go
//        target: enemyPlane2
//        property: "y"
//        from: -30
//        to: 768
//        duration: 10000  // 10s
//    }

//    Image{
//        id: enemyPlane3
//        visible: false;
//        source: "../airport-picture/img-plane_3.png"
//    }
//    NumberAnimation{
//        id: enemyPlane3Go
//        target: enemyPlane3
//        property: "y"
//        from: -30
//        to: 768
//        duration: 10000  // 10s
//    }

//    Image{
//        id: enemyPlane4
//        visible: false;
//        source: "../airport-picture/img-plane_4.png"
//    }
//    NumberAnimation{
//        id: enemyPlane4Go
//        target: enemyPlane4
//        property: "y"
//        from: -30
//        to: 768
//        duration: 10000  // 10s
//    }

//    Image{
//        id: enemyPlane5
//        visible: false;
//        source: "../airport-picture/img-plane_5.png"
//    }
//    NumberAnimation{
//        id: enemyPlane5Go
//        target: enemyPlane5
//        property: "y"
//        from: -30
//        to: 768
//        duration: 10000  // 10s
//    }

//}
