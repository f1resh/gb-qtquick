import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width:400
    maximumWidth: 400
    height: 480
    title: qsTr("Library")
    color: "azure"

    ListModel{
        id: library
        ListElement{
            name: "Преступление и наказание"
            genre: "Роман"
            author: "Ф.М. Достоевский"
            icon: "icons/CrimeAndPunishment"
        }
        ListElement{
            name: "Бесы"
            genre: "Роман"
            author: "Ф.М. Достоевский"
            icon: "icons/Besy"
        }
        ListElement{
            name: "Братья Карамазовы"
            genre: "Роман"
            author: "Ф.М. Достоевский"
            icon: "icons/KaramazovBrothers"
        }
        ListElement{
            name: "Война и мир"
            genre: "Роман"
            author: "Л.Н. Толстой"
            icon: "icons/WarAndPeace"
        }
        ListElement{
            name: "Севастопольские рассказы"
            genre: "Сборник рассказов"
            author: "Л.Н. Толстой"
            icon: "icons/Sebastopol"
        }
        ListElement{
            name: "С++ Руководство для начинающих"
            genre: "Учебник"
            author: "Г. Шилдт"
            icon: "icons/C++"
        }
        ListElement{
            name: "Математика 5 класс"
            genre: "Учебник"
            author: "Н.Я. Виленкин, В.И. Жохов"
            icon: "icons/Math5"
        }
    }

    ListView{
        anchors.fill: parent
        id: libraryView
        model: library
        spacing: 1

        ScrollBar.vertical: ScrollBar {
                active: true
        }

        header: Rectangle{
            width: parent.width
            height: 50
            color: "lightgoldenrodyellow"
            Text {
                anchors.centerIn: parent
                text: "Библиотека книг\nаренда 50рублей"
                font.bold: true
                font.pixelSize: 18
                color: "black"
            }
        }

        section.delegate: Rectangle{
            width: parent.width
            height: 25
            color: "darksalmon"
            Text{
                anchors.centerIn: parent
                text: section
                color: "black"
                font.pixelSize: 15
                font.bold: true
            }
        }
        section.property: "genre"

        delegate: Rectangle{
            width: parent.width
            height: 80
            radius: 10
            border.width: 3
            border.color: "darkolivegreen"
            color: "coral"
            Row{
                leftPadding: 20
                topPadding: 5
                spacing: 10
                Image{
                    source: icon
                    fillMode: Image.PreserveAspectFit
                    height: 70
                }

                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    Text {
                        //anchors.centerIn: parent
                        text: "\""+name+"\""
                    }

                    Text {
                        //anchors.centerIn: parent
                        text: author
                    }
                }
            }


        }

        footer: Rectangle{
            width: parent.width
            height: 40
            color: "lightgoldenrodyellow"
            Text {
                anchors.centerIn: parent
                text: "Автор: Акулов Павел"
                font.bold: true
                font.pixelSize: 18
                color: "black"
            }
        }
    }
}
