import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item{
    id: gamename

    width: parent.width
    y: 220

    RowLayout{
        anchors.centerIn: parent
        spacing: 5
        Image{
            id: titleIcon
            source: "../../assets/img/game.ico"
        }

        Text{
            id: titleText
            text: "Airport War"
            font.pixelSize: 50
            color: "lightblue"
        }
    }
}
