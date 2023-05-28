import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Row{
    readonly property int from: slider.first.value
    readonly property int to: slider.second.value
    property int setMinimumAge: 18
    property int setMaximumAge: 70


    TextField{
        id: from
        width:40
        validator: IntValidator {}
        text: parseInt(slider.first.value)
        onEditingFinished: {
            if (from.text<setMinimumAge) { from.text = setMinimumAge}
            slider.first.value = text
        }
        selectByMouse: true
    }
    RangeSlider{
        id: slider
        from:setMinimumAge
        to:setMaximumAge
        first.value: setMinimumAge
        second.value: setMaximumAge
        stepSize: 1
    }
    TextField{
        id: to
        width:40
        validator: IntValidator {}
        text: parseInt(slider.second.value)
        onEditingFinished: {
            if (from.text>setMaximumAge) { from.text = setMaximumAge}
            slider.second.value = text
        }
        selectByMouse: true
    }
}
