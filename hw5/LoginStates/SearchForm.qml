import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: searchFrame
    color: "white"
    radius: 5
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    height: 250
    opacity: 1
    property string textColor: "#535353"

    signal searchFinished()

    Column {
        anchors.fill: parent
        padding: 32
        spacing: 32
        id: searchControls
        TextField {
            id: searchField
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("")
            color: searchFrame.textColor
            focus:true
            Keys.onReturnPressed: searchFrame.search()
            Keys.onEnterPressed: searchFrame.search()
        }
        Button {
            id: searchButton
            width: 200
            height: 40
            background: Rectangle {
                        color: parent.down ? "#bbbbbb" :
                               (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                        }
            text: qsTr("Найти!")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: searchFrame.search()
        }

        BusyIndicator{
            id: indicator
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    function search(){
        if (searchField.text != "") {
            indicator.visible=true
            searchTimer.start()
        }
    }

    Timer{
        id: searchTimer
        interval: 1000
        running: false
        repeat: false
        onTriggered: searchFinished()
    }
}
