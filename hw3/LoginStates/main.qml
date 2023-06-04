import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Search App")
    color: "#e5ecef"
    id: mainFrame

    Rectangle {
        id: authFrame
        color: "white"
        anchors.centerIn: parent
        radius: 5
        width: 300
        height: 250
        property string textColor: "#535353"
        property string login: "user"
        property string password: "password"

        function checkCredentials() {
            if (login === loginTextField.text && password === passwordTextField.text){
                states.state = "authorizedState"
            }
            else
                states.state = "errorAuthState"
        }

        Column {
            anchors.fill: parent
            padding: 32
            spacing: 32
            TextField {
                id: loginTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Логин")
                color: authFrame.textColor
                focus: true
            }
            TextField {
                id: passwordTextField
                echoMode: TextInput.Password
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Пароль")
                color: authFrame.textColor
                Keys.onEnterPressed: authFrame.checkCredentials()
                Keys.onReturnPressed: authFrame.checkCredentials()
            }
            Button {
                id: submitButton
                width: 200
                height: 40
                background: Rectangle {
                            color: parent.down ? "#bbbbbb" :
                                   (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                            }
                text: qsTr("Вход")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: authFrame.checkCredentials()
            }
        }
    }

    Rectangle {
        id: searchFrame
        color: "white"
        radius: 5
        anchors.bottom: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        height: 250
        opacity: 1
        property string textColor: "#535353"


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
                states.state = "searchProgressState"
                searchTimer.start()
            }
        }

        Timer{
            id: searchTimer
            interval: 2000
            running: false
            repeat: false
            onTriggered: states.state = "searchFinished"
        }
    }

    Rectangle{
        id: resultsFrame
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom
        color: "#f5f5f5"
        width: 600
        height:300
        Column{
            padding: 30
            spacing: 20
            Text { text: "SOME FOUND TEXT"}
            Text { text: "SOME FOUND TEXT"}
            Text { text: "SOME FOUND TEXT"}
            Text { text: "SOME FOUND TEXT"}
            Text { text: "SOME FOUND TEXT"}
        }
    }
    StateGroup{
        id: states
        state: "initialState"
        states: [
            State{
                name: "initialState"
                PropertyChanges { target: authFrame; textColor: "#535353" }
            },
            State{
                name: "authorizedState"
                PropertyChanges { target: authFrame; opacity: 0; visible: false}
                PropertyChanges { target: searchField; focus: true }
                AnchorChanges {target: searchFrame; anchors.bottom: undefined; anchors.top: parent.top}
            },
            State{
                name: "errorAuthState"
                PropertyChanges { target: authFrame; textColor: "red" }
            },
            State{
                name: "searchProgressState"
                extend: "authorizedState"
                PropertyChanges { target: indicator; visible: true }
            },
            State{
                name: "searchFinished"
                extend: "authorizedState"
                AnchorChanges { target: resultsFrame; anchors.bottom: parent.bottom; anchors.top: undefined}
                PropertyChanges { target: resultsFrame; visible: true; color: "#dcdcdc"}
            }
        ]
        transitions: [
            Transition {
                to: "authorizedState"
                reversible: false
                ParallelAnimation{
                    SequentialAnimation{
                        PropertyAnimation { duration: 3000; property: "opacity" ; easing.type: Easing.InQuint}
                        PropertyAnimation { duration: 10; property: "visible"}
                    }
                    AnchorAnimation { duration: 3000;easing.type: Easing.InBack }
                }
            },
            Transition {
                to: "searchFinished"
                reversible: true
                ParallelAnimation{
                    PropertyAnimation { duration: 10; property: "visible"}
                    AnchorAnimation { duration: 1000; easing.type: Easing.OutQuart }
                    ColorAnimation { duration: 1000}
                }
            }
        ]

    }


}
