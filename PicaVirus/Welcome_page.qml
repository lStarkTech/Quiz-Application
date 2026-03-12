import QtQuick
import QtQuick.Controls.Basic

Page {

    Rectangle {
        anchors.fill: parent
        Image{
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: "./images/background.png"
            fillMode: Image.PreserveAspectCrop
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"

            Text{
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -190
                width: parent.width - 40

                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter

                text: "Sei stato infettato con il tremendo PicaVirus!"
                font.pixelSize: 32
                color: "#000000" 
                font.family: "Inter"
                font.italic: true
                font.weight: Font.Thin           
            }
    

            Image{
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -70
                width: 206
                height: 206
                fillMode: Image.PreserveAspectFit
                source: "./images/pika.png"
            }

            Text{
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 90

                width: parent.width -40

                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter

                text: "Se desideri eliminarlo dovrai rispondere a una semplice domanda!\n\nSei pronto?"
                font.pixelSize: 32
                color: "#000000" 
                font.family: "Inter"
                font.italic: true
                font.weight: Font.Thin   

            }
 
            Rectangle{
                id: nextPage
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 240
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
                        gestore.push("Second_page.qml", StackView.Immediate)
                    }
                }
            }


        }
    }
}