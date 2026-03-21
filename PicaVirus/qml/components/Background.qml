import QtQuick
import QtQuick.Controls.Basic

Page{
    id: background
    default property alias content: container.data
    
    Rectangle {
        anchors.fill: parent
        Image{
            sourceSize.width: parent.width
            sourceSize.height: parent.height
            source: "../../images/background.png"
            fillMode: Image.PreserveAspectCrop
        }

        Rectangle {
            id: container
            anchors.fill: parent
            color: "transparent"
        }
    }
}