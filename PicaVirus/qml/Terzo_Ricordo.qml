import QtQuick
import QtQuick.Controls.Basic
import"./components"

Background{

    Text{

        Image{
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 70
            anchors.horizontalCenterOffset: -150
            width: 173
            height: 185
            fillMode: Image.PreserveAspectFit
            source: "../images/whale.png" 
        }

        Image{
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 70
            anchors.horizontalCenterOffset: 150
            mirror: true
            width: 173
            height: 185
            fillMode: Image.PreserveAspectFit
            source: "../images/whale.png" 
        }


        anchors.centerIn: parent
        anchors.verticalCenterOffset: -285
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        
        text: "Terza domanda!"
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
        
        text: "Per quanti secondi può tenere la mano Woo Young Woo?"
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light 
    }

    Image{
        anchors.centerIn:parent
        width:265
        height:177
        fillMode: Image.PreserveAspectFit
        source:"../images/wyw.png"
    }

    PicaButton{
        id:sbagliato
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 150
        anchors.horizontalCenterOffset:100
        text: "32"
        font.pixelSize: 32
        width: 131
        onClicked:{
            sbagliato.shake()
        }
    }

    PicaButton{
        id:giusto
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 150
        anchors.horizontalCenterOffset:-100
        text: "57"
        font.pixelSize: 32
        width: 131
        onClicked:{
            gestore.push("Quarto_Ricordo.qml", StackView.Immediate)
        }
    }






    PicaButton{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 240
        text: "Dammi un indizio..."
        font.pixelSize: 30
        width: 283
        onClicked:{
            gestore.push("Terzo_Indizio.qml", StackView.Immediate)
        }
    }

}