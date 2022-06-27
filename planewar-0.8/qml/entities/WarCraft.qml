import QtQuick 2.0
import Felgo 3.0

EntityBase {
  id: warcraft
  rotation: 90
  entityType: "warcraft"
  width: sprite.width
  height: sprite.height

  MultiResolutionImage {
    id: sprite
    source: "/root/image_airwar/img-plane_7.png"
  }

  CircleCollider {
    radius: sprite.width/2
    // restitution is bounciness, balloons are quite bouncy
    fixture.restitution: 0.5
    fixture.onBeginContact: {
//        var fixture = other;
//        var body = other.getBody();
//        var otherEntity = body.target

        // get the entityType of the colliding entity
//        var collidingType = otherEntity.entityType

        if( collidingType === "rocket" ||
                collidingType === "wall") {
            warcraft.removeEntity()

            return
        }
  }

//  MouseArea {
//    anchors.fill: sprite
//    onPressed: {
//      // if you touch a balloon and the game is running, it will pop
//      if(balloonScene.gameRunning) {
//        balloonScene.balloons--
//        popSound.play()
//        removeEntity()
//      }
//    }
//  }

  // gives the balloon a random position when created
  Component.onCompleted: {
    x = utils.generateRandomValueBetween(100,400)
    y = 100
  }
}
}
