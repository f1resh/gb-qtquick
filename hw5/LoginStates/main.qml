import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Search App")
    color: "#e5ecef"
    id: mainFrame

    Loader{
        id:loader
        focus: true
        sourceComponent: loginComponent
        anchors.centerIn: parent
    }

    Loader{
        id: searchLoader
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Loader{
        id: resultsLoader
        anchors.centerIn: parent
    }

    Component{
        id: loginComponent
        LoginForm{
            Component.onDestruction: {
                searchLoader.sourceComponent = searchComponent
                searchLoader.focus = true
            }
        }
    }

    Component{
        id: searchComponent
        SearchForm{
            onSearchFinished:{
                searchLoader.sourceComponent = undefined
                resultsLoader.sourceComponent = resultComponent
            }
        }
    }

    Component{
        id: resultComponent
        ResultsForm{
            onNewSearch:{
                resultsLoader.sourceComponent = undefined
                searchLoader.sourceComponent = searchComponent
                searchLoader.focus = true
            }
        }
    }

}
