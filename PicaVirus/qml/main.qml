import QtQuick
import QtQuick.Controls.Basic
import QtMultimedia

ApplicationWindow{
    id: appWindow

    visible:true
    width: 471
    height: 687
    title: "PicaVirus"
    color: '#F2DB66'

    AudioOutput{
        id: bgAudioOut
        volume: 0.22
    }

    MediaPlayer{
        id: bgPlayer
        audioOutput: bgAudioOut
        source: musicPath
        loops: MediaPlayer.Infinite
    }

    // SFX "correct" con SoundEffect (perfetto per WAV, bassa latenza)
    SoundEffect{
        id: correctAnswer
        source: "../music/correct.wav"
        volume: 0.3
    }

    SoundEffect{
        id: wrongSfx
        source: "../music/wrong.wav"
        volume: 0.4
    }
    SoundEffect{
        id: nextSfx
        source: "../music/buttonpress.wav"
        volume: 0.4
    }

    Component.onCompleted: {
        bgPlayer.play()
    }

    // Quando true, il mouse viene "bloccato" e si usa solo la tastiera.
    property bool keyboardOnlyMode: false

    function enableKeyboardOnlyMode(){
        keyboardOnlyMode = true
    }

    MouseArea{
        id: mouseBlocker
        anchors.fill: parent
        visible: keyboardOnlyMode
        enabled: visible
        z: 100000
        acceptedButtons: Qt.AllButtons
        hoverEnabled: true
        onPressed: mouse.accepted = true
        onReleased: mouse.accepted = true
        onClicked: mouse.accepted = true
        onDoubleClicked: mouse.accepted = true
        onWheel: wheel.accepted = true
    }

    StackView{
        id: gestore
        anchors.fill: parent

        property int secondsLeft: -1
        property bool countdownActive: false

        function startCountdown(durationSeconds){
            secondsLeft = durationSeconds
            countdownActive = true
            countdownTimer.start()
        }

        function ensureCountdownRunning(durationSeconds){
            if(!countdownActive){
                startCountdown(durationSeconds)
                return
            }
            if(!countdownTimer.running && secondsLeft > 0){
                countdownTimer.start()
            }
        }

        function stopCountdown(){
            countdownTimer.stop()
            countdownActive = false
        }

        function playCorrectSfx(){
            correctAnswer.stop()
            correctAnswer.play()
        }

        function playWrongSfx(){
            wrongSfx.stop()
            wrongSfx.play()
        }
        function playNextSfx(){
            nextSfx.stop()
            nextSfx.play()
        }


        Timer{
            id: countdownTimer
            interval: 1000
            repeat: true
            running: false
            onTriggered: {
                gestore.secondsLeft -= 1
                if(gestore.secondsLeft <= 0){
                    gestore.secondsLeft = 0
                    countdownTimer.stop()
                    gestore.countdownActive = false
                    if(typeof backend !== "undefined"){
                        backend.start_screen_sleep_loop()
                    }
                }
            }
        }

        initialItem: "Welcome_page.qml"
    }

    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 18
        width: parent.width - 40
        horizontalAlignment: Text.AlignHCenter
        visible: gestore.countdownActive || gestore.secondsLeft === 0
        text: "Tempo rimasto: " + Math.max(0, gestore.secondsLeft) + "s"
        font.pixelSize: 22
        color: "#444444"
        font.family: "Inter"
        font.italic: true
        font.weight: Font.Light
        z: 9999
    }

}