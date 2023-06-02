import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr(" Super Square ")

    SuperSquare{
        size: 300
        anchors.centerIn: parent
    }
}
