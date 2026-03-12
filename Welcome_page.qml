import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 471
    height: 687
    title: "PicaVirus"
    color: '#F2DB66'

    //per fare la barra dell'applicazione personalizzata la si deve ricreare da zero
    //flags: Qt.Window | Qt.FramelessWindowHint


    Rectangle {
        anchors.fill: parent
        Image{
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: "./images/image.png"
            fillMode: Image.PreserveAspectCrop
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"

            Text{
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -170
                width: parent.width - 40

                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter

                text: "Sei stato infettato con il tremendo PicaVirus!"
                font.pixelSize: 32
                color: "#000000" 
                font.family: "Inter"
                font.italic: true           
            }
    

            Image{
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                width: 206
                height: 206
                fillMode: Image.PreserveAspectFit
                source: "./images/pika.png"
            }

            Text{
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 100

                width: parent.width - 40

                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter

                text: "Se desideri eliminarlo dovrai rispondere a una semplice domanda!\n Sei pronto?"
                font.pixelSize: 32
                color: "#000000" 
                font.family: "Inter"
                font.italic: true   

            }
 
            Rectangle{
                id: nextPage
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 250
                width: 140
                height: 50
                color: areaMouse.pressed? "#D6B23E":"#EFE596"
                radius: 10

                 Text {
                    anchors.centerIn: parent
                    text: "Piffuzzz"
                    font.pixelSize: 32
                    color: "#000000" 
                    font.family: "Inter"
                    font.italic: true            
                }

                MouseArea{
                    id: areaMouse
                    anchors.fill: parent
                    onClicked:{
                        console.log("Hai cliccato il bottone!")
                    }
                }
            }


        }
    }
}