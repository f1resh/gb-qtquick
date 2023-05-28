import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

RowLayout {
    spacing: 5
    property int distance: parseInt(distance.value)
    Dial{
        id: distance
        Layout.maximumHeight: 40
        inputMode: "Circular"
        from: 0
        to: 20
        value: 0
        live: true
        stepSize: 1
    }

    TextInput{
        text: parseInt(distance.value)
        readOnly: true
    }

    Label{
        text: "km"
    }
}
