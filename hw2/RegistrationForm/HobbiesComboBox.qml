import QtQuick 2.0
import QtQuick.Controls 2.12

ComboBox{
    id: box
    property string selected: displayText

    displayText: selectedItems()
    delegate: Item {
        width: parent.width
        height: checkDelegate.height
        function toggle() { checkDelegate.toggle() }
        CheckDelegate {
            id: checkDelegate
            height: 40
            anchors.fill: parent
            background: Rectangle{
                color: "lightgrey"
            }

            text: model.name
            highlighted: box.highlightedIndex == index
            checked: model.selected
            onCheckedChanged: model.selected = checked
        }
    }
    model: ListModel {
        id: hobbies_model
        ListElement { name: "Music"; selected: false}
        ListElement { name: "Painting"; selected: false}
        ListElement { name: "Video Games"; selected: false}
        ListElement { name: "Sports"; selected: false}
        ListElement { name: "Fishing"; selected: false}
        ListElement { name: "Movies"; selected: false}
        ListElement { name: "Travel"; selected: false}
    }

    function selectedItems(){
        var tmp = ""
        for (var i = 0; i < hobbies_model.rowCount(); ++i){
            tmp += hobbies_model.get(i).selected ? hobbies_model.get(i).name + ", " : "";
        }

        return tmp.slice(0,-2);
    }
}
