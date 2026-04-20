import QtQuick
import QtQuick.Controls.Basic
Image{
    id:cosaFiga
    property alias immagine: cosaFiga.source
    signal clicked()
    focus: true
    activeFocusOnTab: true

    // Target opzionali per la navigazione con frecce in keyboardOnlyMode
    property Item navLeft: null
    property Item navRight: null
    property Item navUp: null
    property Item navDown: null

    //standard dimension
    width:200
    height:200
    fillMode:Image.PreserveAspectFit

    antialiasing:true

    // Effetto hover (mouse) + focus (tastiera in keyboardOnlyMode)
    scale: (areaMouse.containsMouse || (typeof appWindow !== "undefined" && appWindow.keyboardOnlyMode && cosaFiga.activeFocus)) ? 1.1 : 1.0

    function shake(){
        shakeAnimation.start()
    }
    transform: Translate {
        id:shakyshaky
    }

    SequentialAnimation{
        id: shakeAnimation
        NumberAnimation {target: shakyshaky; property: "x"; from: 0; to: -10; duration: 50}
        NumberAnimation {target: shakyshaky; property: "x"; from: -10; to: 10; duration: 50}
        NumberAnimation {target: shakyshaky; property: "x"; from: 10; to: -10; duration: 50}
        NumberAnimation {target: shakyshaky; property: "x"; from: -10; to: 10; duration: 50}
        NumberAnimation {target: shakyshaky; property: "x"; from: 10; to: 0; duration: 50}
    }
    //animazione effetto
    Behavior on scale{
        NumberAnimation{duration:150; easing.type: Easing.InOutQuad;}
    }

    MouseArea{
        id: areaMouse
        anchors.fill:parent
        hoverEnabled: true //consente di percepire che il mouse passi sul nostro bottone-immagine
        onClicked: cosaFiga.clicked()
    }

    Keys.onReturnPressed: cosaFiga.clicked()
    Keys.onEnterPressed: cosaFiga.clicked()

    // Frecce: se i target sono impostati, usali; altrimenti fallback alla navigazione spaziale
    Keys.onLeftPressed:  if(typeof appWindow !== "undefined" && appWindow.keyboardOnlyMode) { if(navLeft) navLeft.forceActiveFocus()}
    Keys.onUpPressed:    if(typeof appWindow !== "undefined" && appWindow.keyboardOnlyMode) { if(navUp) navUp.forceActiveFocus()}
    Keys.onRightPressed: if(typeof appWindow !== "undefined" && appWindow.keyboardOnlyMode) { if(navRight) navRight.forceActiveFocus()}
    Keys.onDownPressed:  if(typeof appWindow !== "undefined" && appWindow.keyboardOnlyMode) { if(navDown) navDown.forceActiveFocus()}
}