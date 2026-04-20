import QtQuick
import QtQuick.Controls.Basic
import"./components"

Background{
    id: root

    // Cattura frecce/Invio quando attivata la modalità tastiera
    focus: true

    Text{

        Image{
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 30
            anchors.horizontalCenterOffset: -170
            width: 117
            height: 156
            fillMode: Image.PreserveAspectFit
            source: "../images/lay_hat.png" 
        }


        anchors.centerIn: parent
        anchors.verticalCenterOffset: -285
        width: parent.width - 40

        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        
        text: "Seconda domanda!"
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
        
        text: "Qual è stato il primo gioco che abbiamo fatto assieme?"
        font.pixelSize: 32
        color: "#000000" 
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light 
    }

    PicaImageButton{
        id:bottoncino
        anchors.centerIn:parent
        anchors.horizontalCenterOffset: -130
        anchors.verticalCenterOffset:20
        immagine: "../images/layton.png"
        width:194
        height:155
        onClicked:{
            gestore.playWrongSfx()
            // Da qui in poi, niente più mouse: solo tastiera fino alla fine.
            // Modalità "solo tastiera" (definita in main.qml)
            appWindow.enableKeyboardOnlyMode()
            root.forceActiveFocus()
            bottoncino.shake()
        }

        // Regole richieste:
        // - left/right: passa all'altro PicaImageButton
        // - down: va sempre al PicaButton "Dammi un indizio..."
        navLeft: rispostaGiusta
        navRight: rispostaGiusta
        navDown: indizioBtn
    }

    PicaImageButton{
        id: rispostaGiusta
        anchors.centerIn:parent
        anchors.horizontalCenterOffset: 105
        anchors.verticalCenterOffset:20
        immagine: "../images/unsolved.png"
        width:238
        height:136
        onClicked:{
            gestore.playCorrectSfx()
            gestore.push("Terzo_Ricordo.qml",StackView.Immediate)
        }

        navLeft: bottoncino
        navRight: bottoncino
        navDown: indizioBtn
    }



    PicaButton{
        id: indizioBtn
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 190
        text: "Dammi un indizio..."
        font.pixelSize: 30
        width: 283
        onClicked:{
            gestore.playNextSfx()
            gestore.push("Secondo_Indizio.qml", StackView.Immediate)
        }

        // Regole richieste:
        // - up: torna al PicaImageButton più a sinistra
        // - down: resta su se stesso
        navUp: bottoncino
        navDown: indizioBtn
    }

    // La navigazione con frecce è gestita direttamente dai componenti
    // (`PicaButton` / `PicaImageButton`) usando la focus chain quando keyboardOnlyMode è attivo.

}