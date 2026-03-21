import QtQuick
import QtQuick.Controls.Basic
import"./components"

Background{

    Text{

        Image{
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenterOffset: -170
            width: 117
            height: 156
            fillMode: Image.PreserveAspectFit
            source: "../images/lay_hat.png" 
        }


        anchors.centerIn: parent
        anchors.verticalCenterOffset: -285
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        
        text: "Seconda domanda!"
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.bold: true
        font.weight: Font.Light 
    }

    Text{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -150
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        
        text: "Qual è stato il primo gioco che abbiamo fatto assieme?"
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light 
    }

    PicaImageButton{
        id:bottoncino
        anchors.centerIn:parent
        anchors.horizontalCenterOffset: -130
        anchors.verticalCenterOffset:20
        immagine: "../images/layton.png"
        width:194
        height:155
        onClicked:{
            bottoncino.shake()
        }
    }

    PicaImageButton{
        anchors.centerIn:parent
        anchors.horizontalCenterOffset: 105
        anchors.verticalCenterOffset:20
        immagine: "../images/unsolved.png"
        width:238
        height:136
        onClicked:{
            gestore.push("Terzo_Ricordo.qml",StackView.Immediate)
        }
    }



    PicaButton{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 190
        text: "Dammi un indizio..."
        font.pixelSize: 30
        width: 283
        onClicked:{
            gestore.push("Secondo_Indizio.qml", StackView.Immediate)
        }
    }

}