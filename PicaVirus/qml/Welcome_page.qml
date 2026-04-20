import QtQuick
import QtQuick.Controls.Basic
import "./components"

Background {


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
        source: "../images/pika.png"
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

    PicaButton {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 240
        text: "Piffuzzz"
        onClicked: {
            gestore.playNextSfx()
            gestore.push("Second_page.qml", StackView.Immediate)
        }
    }
}
