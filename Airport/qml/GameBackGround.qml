import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: name
    height: 768 * 4

    function start() {
        yAni.start();
        console.log("statr");
    }


    ListView{
        id: maps
        height: 768

        // 倒排视图
        verticalLayoutDirection: ListView.VerticalBottomToTop
        model: ListModel{
            id:listModel
            ListElement{ sour: "../飞机大战素材/img_bg_level_1.jpg" }
            ListElement{ sour: "../飞机大战素材/img_bg_level_2.jpg" }

        }
        delegate: Component {
            id: ima
            Image {
                id: backimage
                source: sour
            }
        }

        NumberAnimation{
            id: backSlider
            target: maps
            property: "y"
            to: 768 * 2
            duration: 2000
        }

    }
//    RadioButton {
//        text: "start"
//        anchors.top: parent
//        opacity: 0.7
//        onClicked: ()=>{
//                       console.log("click")
//                       backSlider.start();
//                   }
//    }

    Timer {
           id: myTimer;
           interval: 2000;
           repeat: true;
           running: true;
           triggeredOnStart: true;
           onTriggered:
           {
              console.log("当前page:"+maps.currentIndex);
               console.log("maps.y = " + maps.y);
               if(maps.currentIndex ===  listModel.count-1)
               {
                   listModel.move(maps.currentIndex,0,1);
                   maps.currentIndex = 1;
                   backSlider.start();

               }
//              aotoCycle();
           }
       }


    Component.onCompleted: {
               backSlider.start();
        console.log("maps.y = " + maps.y);
           }
}


