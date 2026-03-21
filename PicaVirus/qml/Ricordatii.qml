import QtQuick
import QtQuick.Controls.Basic
import "./components"

Background {


    Text{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -170
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter

        text: "Veramente non ti ricordi...?"
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light           
    }


    Image{

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -60
        width: 308
        height: 113
        fillMode: Image.PreserveAspectFit
        source: "../images/pikadepresso.png"

    }

    Text{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 60

        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter

        text: "Neanche se ti do un indizio...?🫶🏼 "
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light   

    }

    PicaButton {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 150
        width: 200
        text: "Ora ricordo!!"
        onClicked: {
            gestore.push("Iniziamoo.qml", StackView.Immediate)
        }
    }
}