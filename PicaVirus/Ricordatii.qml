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
    

            AnimatedImage{
                id: pikaGif
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -60
                width: 308
                height: 113
                fillMode: Image.PreserveAspectFit
                source: "./images/pikadepresso.png"
                playing: true
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
 
            Rectangle{
                id: yesPage
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 150
                width: 200
                height: 50
                color: yesArea.pressed? "#D6B23E":"#EFE596"
                radius: 10

                 Text {
                    anchors.centerIn: parent
                    text: "Ora ricordo!!"
                    font.pixelSize: 32
                    color: "#000000" 
                    font.family: "Inter"
                    font.italic: true            
                }

                MouseArea{
                    id: yesArea
                    anchors.fill: parent
                    onClicked:{
                        gestore.push("Iniziamoo.qml", StackView.Immediate)
                    }
                }
            }

        }
    }
}