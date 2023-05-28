import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

GridLayout{

    property string name: name.text
    property string gender: gender.currentText
    property int age: age.value
    property string education: education.currentText
    property string hobbies: hobbies.selected //rework hobbies to checkboxes
    property string city: city.text
    property string aboutMe: aboutMe.text


    columns: 2

    MyLabel{
        Layout.row:0
        Layout.column: 0
        text: "Name*"
    }

    TextField{
        id: name
        Layout.row: 0
        Layout.column: 1
        Layout.fillWidth: true
        selectByMouse: true
    }

    MyLabel{
        Layout.row:1
        Layout.column: 0
        text: "Gender*"
    }

    ComboBox{
        id:gender
        Layout.row: 1
        Layout.column: 1
        Layout.fillWidth: true
        currentIndex: -1
        model: ["Male","Female","Non-binary","Attack Helicopter"]
    }

    MyLabel{
        Layout.row: 2
        Layout.column: 0
        text: "Age*"
    }

    SpinBox{
       id: age
       Layout.row: 2
       Layout.column: 1
       Layout.fillWidth: true
       editable: true
       from: 18
       to: 70
       value: 30
       stepSize: 1
       validator: IntValidator {bottom: 18; top: 70}
    }


    MyLabel{
        Layout.row: 3
        Layout.column: 0
        text: "Education*"
    }

    ComboBox{
        id: education
        Layout.row: 3
        Layout.column: 1
        Layout.fillWidth: true
        currentIndex: -1
        model: ["No","School","College","University"]
    }

    MyLabel{
        text: "Hobbies"
        Layout.row: 4
        Layout.column: 0
    }

    HobbiesComboBox{
        id: hobbies
        Layout.row: 4
        Layout.column: 1
        Layout.fillWidth: true
    }

    MyLabel{
        text: "City*"
        Layout.row: 5
        Layout.column: 0
    }

    TextField{
        id: city
        Layout.row: 5
        Layout.column: 1
        Layout.fillWidth: true
    }

    MyLabel{
        text: "About me"
        Layout.row: 6
        Layout.column: 0
    }

    TextField{
        id: aboutMe
        Layout.row: 6
        Layout.column: 1
        Layout.fillWidth: true
    }

    function isFilled(){
        if (name.text=="" || gender.currentText=="" || education.currentText=="" || city.text == "")
            return false;
        else
            return true;
    }
}
