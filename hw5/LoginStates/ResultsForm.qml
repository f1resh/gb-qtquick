import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle{
    id: resultsFrame
    anchors.centerIn: parent
    color: "#f5f5f5"
    width: 600
    height:300
    signal newSearch()


    Column{
        anchors.fill: parent
        padding: 30
        spacing: 20
        Text { text: "SOME FOUND TEXT"}
        Text { text: "SOME FOUND TEXT"}
        Text { text: "SOME FOUND TEXT"}
        Text { text: "SOME FOUND TEXT"}
        Text { text: "SOME FOUND TEXT"}
        Button {
            text: "New Search"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: newSearch()
        }
    }
}
