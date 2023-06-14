import QtQuick 2.12
import QtQuick.Controls 2.12

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
        if (login === loginTextField.text && password === passwordTextField.text)
            parent.destroy()
        else
            console.log("not OK")
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
