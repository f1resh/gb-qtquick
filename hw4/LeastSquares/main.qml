import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Least Square")

    property variant x_originals: [7, 31, 61, 99, 129, 178, 209]
    property variant y_originals: [13, 10, 9, 10, 12, 20, 26]
    property variant x_approx: []
    property variant y_approx: []

    Component.onCompleted: {
        calculate()
        for (var i = 0; i < x_originals.length; i++){
            scatter.append(x_originals[i],y_originals[i])
            line.append(x_approx[i],y_approx[i])
        }

    }

    function calculate(){
        var x_sum = 0
        var y_sum = 0
        var xy_sum = 0
        var xx_sum = 0
        var count = 0

        var x = 0
        var y = 0
        var length = x_originals.length

        for (let i = 0; i < length; i++){
            x = x_originals[i]
            y = y_originals[i]
            x_sum += x
            y_sum += y
            xx_sum += x*x
            xy_sum += x*y
            count++
        }

        var a = (count * xy_sum - x_sum * y_sum) / (count * xx_sum - x_sum * x_sum)
        var b = (y_sum/count) - (a * x_sum) / count

        for (let i = 0; i < length; i++){
            x_approx.push(x_originals[i])
            y_approx.push(a * x_originals[i] + b)
        }
    }

    ChartView{
        anchors.fill: parent
        title: "Graph"

        ValueAxis {
                id: xAxis
                min: 0
                max: 250
                tickInterval: 25
                tickType: ValueAxis.TicksDynamic
        }
        ValueAxis {
                id: yAxis
                min: 0
                max: 30
                tickInterval: 5
                tickType: ValueAxis.TicksDynamic
        }


        ScatterSeries{
            id: scatter
            name: "Original points"
            axisX: xAxis
            axisY: yAxis
            markerSize: 10
        }

        LineSeries{
            id: line
            name: "Least Squares Approx"
            axisX: xAxis
            axisY: yAxis
        }
    }
}
