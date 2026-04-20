import QtQuick
import QtQuick.Controls.Basic
import"./components"

Background{
    id: root

    readonly property string correctAnswer: "cinema"

    Component.onCompleted: {
        // Avvia il countdown solo la prima volta, e non lo resetta se vai/torni dagli indizi.
        gestore.ensureCountdownRunning(30)
    }

    Text{

        Image{
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 13
            anchors.horizontalCenterOffset: 170
            width: 150
            height: 150
            fillMode: Image.PreserveAspectFit
            rotation: 35
            source: "../images/mms.png" 
        }

        Image{
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -155
            width: 150
            height: 150
            fillMode: Image.PreserveAspectFit
            rotation: -55
            source: "../images/mms.png" 
        }

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -285
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        
        text: "Prima domanda!"
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
        
        text: "Iniziamo con le cose semplici!\n\n Dove siamo andati al primo appuntamento?"
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light 
    }

    PicaTextField{
        id: textfield

        onAccepted:{
            let rispostaUtente = textfield.text.trim()
            let ok = backend.submit_answer(rispostaUtente, root.correctAnswer)
            if(ok){
                gestore.stopCountdown()
                gestore.playCorrectSfx()
                gestore.push("Secondo_Ricordo.qml", StackView.Immediate)
            }
            else{
                gestore.playWrongSfx()
                textfield.shake()
                textfield.clear()
                textfield.placeholderText = "Sbagliato :(("
            }
        }

    }


    Text{
        anchors.centerIn: parent
        anchors.verticalCenterOffset:60 
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        
        text: "Premi invio per confermare la risposta"
        font.pixelSize: 24
        color: "#444444" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light 
    }


    PicaButton{
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 180
        text: "Dammi un indizio..."
        font.pixelSize: 30
        width: 283
        onClicked:{
            gestore.playNextSfx()
            gestore.push("Primo_indizio.qml", StackView.Immediate)
        }
    }

}