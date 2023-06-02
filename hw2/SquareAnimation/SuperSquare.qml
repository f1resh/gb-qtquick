import QtQuick 2.0

Rectangle{
        property int size: 100
        property bool isCircle: false
        Component.onCompleted: {
            randomColor();
            if (isCircle==true) rect.radius = size
        }

        id: rect
        width: size
        height: size
        antialiasing: true

        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                if (mouse.button === Qt.RightButton){
                    if (rect.isCircle == false) rotationAnim.start()
                }
                else if (mouse.button === Qt.LeftButton){
                    randomColor()
                }
            }
            onDoubleClicked: {
                if (mouse.button === Qt.LeftButton) changeShape()
            }

        }

        RotationAnimation{
            id:rotationAnim
            target:rect
            duration:4000
            from: 0;
            to: 360;
        }

        function randomColor(){
            rect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
        }

        function changeShape(){
            if (isCircle==false){
                rect.radius = size
                isCircle = true
            }else{
                rect.radius = 0
                isCircle = false
            }
        }
}
