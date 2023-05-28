import QtQuick 2.0
import QtQuick.Controls 2.12

Label {
    property string myText: ""
    font.underline: true
    font.family: "Helvetica"
    font.italic: false
    font.bold: true
    font.pixelSize: 16
    text: myText
}
