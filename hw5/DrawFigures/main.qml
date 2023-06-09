import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "FigureCoordinates.js" as FigureCoordinates

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ComboBox{
        id: dropdown
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        model: ["Star","Hourglass","House","Circle","test"]
        onActivated: canvas.requestPaint()
    }

    Canvas{
        id: canvas
        anchors.fill: parent
        property int  xStep: width / 6
        property int  yStep: height / 6
        onPaint:{
            var ctx = getContext("2d")
            ctx.clearRect(0,0,width,height);
            ctx.fillStyle = Qt.rgba(0,1,0,1);
            ctx.beginPath();
            var coordinates = FigureCoordinates.getCoordinates(dropdown.currentText);
            if (dropdown.currentText == "Circle"){
                ctx.arc(xStep*coordinates[0][0],yStep*coordinates[0][1],xStep*coordinates[1],0,2*Math.PI,false)
            }else{
                ctx.moveTo(coordinates[0]);
                for (let i = 1; i < coordinates.length; i++){
                    ctx.lineTo(xStep * coordinates[i][0], yStep * coordinates[i][1]);
                }
                ctx.closePath();
                ctx.lineWidth = 15;

            }
            ctx.stroke();
            ctx.fill();
        }
    }
}
