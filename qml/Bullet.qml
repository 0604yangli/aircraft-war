import QtQuick 2.0

import Felgo 3.0

EntityBase {
  id: entity
  entityType: "bullet"

  Component.onCompleted: {
      console.debug("Bullet.onCompleted, width:", width);
      applyForwardImpulse();
  }


  property alias image: image
  property alias movementAnimation: ma.acceleration
  property real angleDeg

  rotation: angleDeg
MovementAnimation {
    id:ma
    target: entity
    property: "y"
    running: true

    // the starting velocity
    velocity: 10

    // this forces the rectangle to move to the left (against the velocity direction), but it doesnt get faster than -20 px/second!
    acceleration: 50

    minVelocity: 100
    // limits the initial velocity set to 960, now to 500
    maxVelocity: 5000

    // limits the x property between a border of 10 and 100
//            minPropertyValue: 10
//            maxPropertyValue: 1000

    // never change the x value by more than 50 pixels in one step
    // this is useful for example to limit the rotation from MoveToPointHelper
    maxPropertyValueDifference: 500


    // this is the same as setting running to true, only for demonstration purpose
    //Component.onCompleted: movement.start()
  }

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
      if(entity.y<0){
          entity.removeEntity();
          return;
      }

      if(collidingType === "plane" ||
              collidingType === "bullet") {
          entity.removeEntity()
          return
      }

      //can't hit the same wall twice, but onBeginContact called again after rotation has changed
      if(otherEntity === lastWall) {
        return;
      }
      lastWall = otherEntity

      //apply law of reflection, all calculations in degrees
      var normalAngle = 180 / Math.PI * Math.atan2(contactNormal.y, contactNormal.x)
      var angleDiff = normalAngle - entity.rotation
      var newAngle = entity.rotation + 2 * angleDiff + 180

      // manually set the entity rotation, because it is the target and its rotation will be used for the physics body

      console.debug("Bullet.roration:" + newAngle)
      entity.rotation = newAngle

      // it's important to clear the old velocity before applying the impulse, otherwise the rocket would get faster every time it collides with a wall!
      boxCollider.body.linearVelocity = Qt.point(0,0)

      applyForwardImpulse();
    }
  }


  Image {
    id: image
    source: "../airport-picture/bullet_1.png"
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
