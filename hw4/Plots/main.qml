import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtCharts 2.3
import plot.PlotData 1.0
import plot.namespace 1.0


Window {
    visible: true
    minimumWidth: 640
    minimumHeight: 480
    title: qsTr("Графики")

    PlotData{
        id: plotData
    }

    Component.onCompleted: drawPlot()

    function drawPlot(_type){
        if (_type != undefined) plotData.type = _type;
        lineSeries.clear();
        for (var i = 0; i < plotData.x_values.length; i++){
            lineSeries.append(plotData.x_values[i],plotData.y_values[i])
        }
    }

    ChartView{
        title: "График"
        antialiasing: true
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        width: 600
        height: 400
        ValueAxis {
                id: xAxis
                min: -5
                max: 5
        }
        ValueAxis {
                id: yAxis
                min: -5
                max: 5
        }

        LineSeries{
            id: lineSeries
            axisX: xAxis
            axisY: yAxis
        }
    }

    Row{
        id: buttonRow
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        Button{
            text: "sin(x)"
            id: sinButtton
            onClicked: drawPlot(PlotType.SIN)
        }
        Button{
            text: "x"
            id: xButton
            onClicked: drawPlot(PlotType.LINE)
        }
        Button{
            text: "|x-2.5|"
            id: absButton
            onClicked: drawPlot(PlotType.ABS)
        }
        Button{
            text: "x^2"
            id: sqrButtton
            onClicked: drawPlot(PlotType.SQUARE)
        }
        Button{
            text: "Log2(x)"
            id: logButton
            onClicked: drawPlot(PlotType.LOG)
        }
    }

}
