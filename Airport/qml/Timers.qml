import QtQuick 2.0

Item {
    property alias timer_1: timer_1
    property alias plane_enemy1: plane_enemy1
    property alias timerplane2: timerplane2
    property alias timerplane3: timerplane3
    property alias timerplane4: timerplane4
    property alias timerplane5: timerplane5

    //计时器
    Timer
    {
        id:timer_1
        interval: 1000
        repeat: true
        running: false
        triggeredOnStart: false
    }

    // enemyPlane1 creating
    Timer
    {
        id:plane_enemy1
        interval: 20000
        repeat: true
        running: false
        triggeredOnStart: true
    }

    // enemyPlane2 creating
    Timer
    {
        id:timerplane2
        interval: 20000
        repeat: true
        running: false
        triggeredOnStart: false
    }

    // enemyPlane3 creating
    Timer
    {
        id:timerplane3
        interval: 20000
        repeat: true
        running: false
        triggeredOnStart: false
    }

    // enemyPlane4 creating
    Timer
    {
        id:timerplane4
        interval: 20000
        repeat: true
        running: false
        triggeredOnStart: false
    }

    // enemyPlane5 creating
    Timer
    {
        id:timerplane5
        interval: 20000
        repeat: true
        running: false
        triggeredOnStart: false
    }


//    //定时器
//    Timer{
//        id:timer_2
//        interval: 1000

//        repeat: true
//        triggeredOnStart: true
//        onTriggered: {
//            getCurDateS()
//            trigger_ipt = totalSeconds_ipt - totalSeconds_sys
//            if(trigger_ipt === count){
//                warnMsgPop.open();//告警窗口打开
//                //warnMusic.play();//告警音乐播放
//                count -= 1;
//                if(count <= 0){
//                    timer_2.stop();
//                }
//            }
//        }
//    }
}
