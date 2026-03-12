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

                text: "Per prima cosa vorrei chiederti..."
                font.pixelSize: 32
                color: "#000000" 
                font.family: "Inter"
                font.italic: true
                font.weight: Font.Light           
            }
    

            AnimatedImage{
                id: pikaGif
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                width: 285
                height: 142
                fillMode: Image.PreserveAspectFit
                source: "./images/pikagif.gif"
                playing: true
            }

            Text{
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 50

                width: parent.width - 40

                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter

                text: "Ti ricordi che giorno è oggi?"
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
                anchors.horizontalCenterOffset:-100
                width: 140
                height: 50
                color: yesArea.pressed? "#D6B23E":"#EFE596"
                radius: 10

                 Text {
                    anchors.centerIn: parent
                    text: "Ovvio!"
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

            Rectangle{
                id: noPage
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 150
                anchors.horizontalCenterOffset: 100
                width: 140
                height: 50
                color: noArea.pressed? "#D6B23E":"#EFE596"
                radius: 10

                 Text {
                    anchors.centerIn: parent
                    text: "No..."
                    font.pixelSize: 32
                    color: "#000000" 
                    font.family: "Inter"
                    font.italic: true            
                }

                MouseArea{
                    id: noArea
                    anchors.fill: parent
                    onClicked:{
                        gestore.push("Ricordatii.qml", StackView.Immediate)
                    }
                }
            }


        }
    }
}