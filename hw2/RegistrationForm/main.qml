import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Window {
    visible: true
    minimumWidth: 640
    minimumHeight: 800
    title: qsTr("Registration Form")

    MessageDialog{
        id: errorDialog
        title: "Error"
        icon: StandardIcon.Critical
        text: "Please enter all mandatory fields"
    }

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 20
        Label{
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 20
            font.italic: false
            font.weight: Font.DemiBold
            color: "black"
            text: qsTr("My information")
        }

        MainInformation{
            id: main_info
        }

        Label{
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 20
            font.italic: false
            font.weight: Font.DemiBold
            color: "black"
            text: qsTr("I look for")
        }

        SearchInformation{
            id: search_info
        }

        Button{
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: parent.width/2
            text: qsTr("Register")
            onClicked: {
                if (main_info.isFilled() && search_info.isFilled()){
                    console.log("My information")
                    console.log("Name: "+main_info.name);
                    console.log("Gender: "+main_info.gender);
                    console.log("Age: "+main_info.age);
                    console.log("Education: "+main_info.education);
                    console.log("Hobbies: "+main_info.hobbies);
                    console.log("City: "+main_info.city);
                    console.log("About me: "+main_info.aboutMe);
                    console.log("I search")
                    console.log("Gender: "+search_info.gender);
                    console.log("Age: from "+search_info.age_from +" to "+search_info.age_to);
                    console.log("Gender: "+search_info.gender);
                    console.log("Education: "+search_info.education);
                    console.log("Hobbies: "+search_info.hobbies);
                    console.log("City: "+search_info.city);
                    console.log("Distance from me: "+search_info.distance+"km");
                }else{
                    errorDialog.open()
                }
            }

        }
    }
}

