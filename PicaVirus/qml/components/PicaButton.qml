import QtQuick
import QtQuick.Controls.Basic

Rectangle{

    id: picabutton

    width: 140
    height: 50
    radius: 10
    property color normalColor: "#EFE596"
    property color pressedColor: "#D6B23E"
    color: mouseArea.pressed ? pressedColor : normalColor

    property alias text: buttonText.text
    property alias font: buttonText.font

    signal clicked()

    antialiasing:true

    //tipo di effetto che vogliamo
    scale: mouseArea.containsMouse? 1.1 : 1.0

    //animazione effetto
    Behavior on scale{
        NumberAnimation{duration:150; easing.type: Easing.InOutQuad;}
    }

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

    Text{
        id: buttonText
        anchors.centerIn: parent
        text: "Press it"
        font.pixelSize: 32
        font.italic: true
        font.family: "Inter"


    }


    MouseArea{

        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: picabutton.clicked()
    }
}