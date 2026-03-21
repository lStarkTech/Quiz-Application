import QtQuick
import QtQuick.Controls.Basic
import"./components"

Background{

    Image{

    }

    Text{

        Image{
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 13
            anchors.horizontalCenterOffset: 170
            width: 150
            height: 150
            fillMode: Image.PreserveAspectFit
            rotation: 35
            source: "../images/mms.png" 
        }

        Image{
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -155
            width: 150
            height: 150
            fillMode: Image.PreserveAspectFit
            rotation: -55
            source: "../images/mms.png" 
        }

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -285
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        
        text: "Indizioo"
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.bold: true
        font.weight: Font.Light 
    }

    Text{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -155
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        
        text: "Azz... già chiedi un indizio?\nChissà come farai allora per le domande successive...\n\nComunque eccotelo!!"
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light 
    }

    Image{
        anchors.centerIn:parent
        anchors.verticalCenterOffset: 60
        anchors.horizontalCenterOffset: 90
        width:244
        height: 137
        fillMode: Image.PreserveAspectFit
        source: "../images/Rbselvaggio.png"
    }

    Image{
        anchors.centerIn:parent
        anchors.verticalCenterOffset: 65
        anchors.horizontalCenterOffset:-140
        width:135
        height: 202
        fillMode: Image.PreserveAspectFit
        source: "../images/caffe.png"
    }

    PicaButton{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 220
        text: "Ah cavolo!!"
        font.pixelSize: 32
        width: 283
        onClicked:{
            gestore.push("Primo_Ricordo.qml", StackView.Immediate)
        }
    }

}