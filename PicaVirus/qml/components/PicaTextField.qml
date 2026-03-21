 import QtQuick
 import QtQuick.Controls.Basic
    
TextField{
    id: textfield
    anchors.centerIn: parent
    width:283
    height:47
    placeholderText: "Inserisci la risposta"
    placeholderTextColor: "#888888"
    color: "#000000"
    
    font.pixelSize:20
    font.family: "Inter"
    font.italic: true
    background: Rectangle{
        radius: 10
        color: "#FFFFFF"
        border.color: textfield.activeFocus ? "#e9dc4b" : "#e9d00c"
    border.width: textfield.activeFocus ? 3 : 2
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
}