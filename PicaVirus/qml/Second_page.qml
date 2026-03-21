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
        source: "../images/pikagif.gif"
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

    PicaButton {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 150
        anchors.horizontalCenterOffset:-100
        text: "Ovvio!"
        onClicked: {
            gestore.push("Iniziamoo.qml", StackView.Immediate)
        }
    }

    PicaButton {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 150
        anchors.horizontalCenterOffset:100
        text: "No..."
        onClicked: {
            gestore.push("Ricordatii.qml", StackView.Immediate)
        }
    }
}
