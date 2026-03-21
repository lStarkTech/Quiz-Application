import QtQuick
import QtQuick.Controls.Basic
import "./components"

Background{

    Text{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -160
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter

        text: "E allora...\n\nE' arrivato il momento di cominciare con il vero test!!"
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light    
    }

    Image{
        anchors.centerIn: parent
        width: 132
        height: 168
        fillMode: Image.PreserveAspectFit
        source: "../images/walkingpika.png"
    }

    PicaButton{
        width: 401
        text: "E chi me lo ha fatto fare..."
        anchors.centerIn:parent
        anchors.verticalCenterOffset:120
        onClicked: {
            gestore.push("Primo_Ricordo.qml", StackView.Immediate)
        }
    }
}