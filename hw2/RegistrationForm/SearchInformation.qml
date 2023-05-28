import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

GridLayout{

    property string gender: gender.currentText
    property int age_from: age.from
    property int age_to: age.to
    property string education: education.currentText
    property string hobbies: hobbies.selected
    property string city: city.text
    property string distance: distance.distance

    columns: 2

    MyLabel{
        Layout.row:0
        Layout.column: 0
        text: "Gender*"
    }

    ComboBox{
        id:gender
        Layout.row: 0
        Layout.column: 1
        Layout.fillWidth: true
        currentIndex: -1
        model: ["Male","Female","Non-binary","Attack Helicopter"]
    }

    MyLabel{
        Layout.row:1
        Layout.column: 0
        text: "Age*"
    }

    AgeRangeSlider{
        id:age
        Layout.row: 1
        Layout.column: 1
        Layout.fillWidth: true
        setMinimumAge: 18
        setMaximumAge: 70
    }
    MyLabel{
        Layout.row: 2
        Layout.column: 0
        text: "Education"
    }

    ComboBox{
        id: education
        Layout.row: 2
        Layout.column: 1
        Layout.fillWidth: true
        currentIndex: -1
        model: ["No","School","College","University"]
    }

    MyLabel{
        text: "Hobbies"
        Layout.row: 3
        Layout.column: 0
    }

    HobbiesComboBox{
        id: hobbies
        Layout.row: 3
        Layout.column: 1
        Layout.fillWidth: true
    }

    MyLabel{
        text: "City*"
        Layout.row: 4
        Layout.column: 0
    }

    TextField{
        id: city
        Layout.row: 4
        Layout.column: 1
        Layout.fillWidth: true
    }

    MyLabel{
        text: "Distance"
        Layout.row: 5
        Layout.column: 0
    }

    DialDistance{
        id: distance
        Layout.row: 5
        Layout.column: 1
        Layout.fillWidth: true
    }

    function isFilled(){
        if (gender.currentText=="" || city.text == "")
            return false;
        else
            return true;
    }


}
