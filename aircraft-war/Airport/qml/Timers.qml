import QtQuick 2.0

Item {
    property alias timer_1: timer_1

    //计时器
    Timer
    {
        id:timer_1
        interval: 1000
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
