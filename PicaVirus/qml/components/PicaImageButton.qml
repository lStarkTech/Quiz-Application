import QtQuick
import QtQuick.Controls.Basic
Image{
    id:cosaFiga
    property alias immagine: cosaFiga.source
    signal clicked()

    //standard dimension
    width:200
    height:200
    fillMode:Image.PreserveAspectFit

    antialiasing:true

    //tipo di effetto che vogliamo
    scale: areaMouse.containsMouse? 1.1 : 1.0

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
}