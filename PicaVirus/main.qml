import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow{

    visible:true
    width: 471
    height: 687
    title: "PicaVirus"
    color: '#F2DB66'

    StackView{
        id: gestore
        anchors.fill: parent

        initialItem: "Welcome_page.qml"
    }

}