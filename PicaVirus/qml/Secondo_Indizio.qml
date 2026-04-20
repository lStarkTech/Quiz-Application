import QtQuick
import QtQuick.Controls.Basic
import"./components"

Background{

    Image{

    }

    Text{

        Image{
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenterOffset: -150
            width: 117
            height: 156
            fillMode: Image.PreserveAspectFit
            source: "../images/lay_hat.png" 
        }
        
        Image{
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenterOffset: 150
            mirror: true
            width: 117
            height: 156
            fillMode: Image.PreserveAspectFit
            source: "../images/lay_hat.png" 
        }

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -275
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
        anchors.verticalCenterOffset: -30
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        
        text: "Vedo che allora non mi sbaglio troppo a dire che ti dimentichi tutto... Dai, ti aiuto.\n\n Ricordati che la domanda dice 'assieme'..."
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light 
    }


    PicaButton{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 180
        text: "Intendevi quello!!"
        font.pixelSize: 32
        width: 283
        onClicked:{
            gestore.playNextSfx()
            gestore.push("Secondo_Ricordo.qml", StackView.Immediate)
        }
    }

}