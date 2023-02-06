import QtQuick 2.15
import QtQuick.Window 2.15
// import QtQuick.Controls 1.4
// import QtQuick.Controls.Styles 1.4
// import QtQuick.Window 2.2
import QtQuick.Controls 2.12
// import QtQuick.Controls.Styles 2.12
import QtMultimedia 5.15

Window {
    width: 1920
    height: 1080
    visible: true
    // TODO: Enable this to display the demo in fullscreen
    // visibility: "FullScreen"
    title: qsTr("AM62A EdgeAI Demo")


    Rectangle {
        id: background
        color: "#17252A"
        width: parent.width
        height: parent.height

        Rectangle {
            id: topBar

            width: parent.width
            height: parent.height * 0.1
            anchors.top: background.top
            anchors.left: background.left

            color: "#17252A"

            Image {
                id: topBarLogo
                width: parent.width * 0.2
                height: parent.height
                source: "images/Texas-Instruments.png"
            }

            Text {
                id: topBarHead
                objectName: "topBarHead"
                text: qsTr("AM62A EdgeAI Demo")

                width: parent.width * 0.8
                height: parent.height
                anchors.left: topBarLogo.right
                anchors.top: parent.top

                color: "#FEFFFF"
                font.family: "Ubuntu"
                font.bold: true
                font.pointSize: 35
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
        Rectangle {
            id: leftMenu

            width: parent.width * 0.2
            height: parent.height * 0.9
            anchors.top: topBar.bottom
            anchors.left: background.left

            color: "#17252A"

            Button {
                id: leftMenuButton1
                text: "Image Classification"
		onClicked: mediaplayer1.source = buttonsClicked.leftMenuButton1Clicked()
                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: leftMenuButton2
                text: "Semantic Segmentation"
		onClicked: mediaplayer1.source = buttonsClicked.leftMenuButton2Clicked()
                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: leftMenuButton1.bottom
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Button {
                id: leftMenuButton3
                text: "Object Detection"
		onClicked: mediaplayer1.source = buttonsClicked.leftMenuButton3Clicked()
                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: leftMenuButton2.bottom
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Button {
                id: leftMenuButton4
                text: "Custom"

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: leftMenuButton3.bottom
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: popup.open()
            }
        }
        Rectangle {
            id: mainWindow

            width: parent.width * 0.8
            height: parent.height * 0.8
            anchors.top: topBar.bottom
            anchors.left: leftMenu.right

            color: "#17252A"

            MediaPlayer {
                id: mediaplayer1
                objectName: "mediaplayer1"
                // source:
                autoPlay: true
            }

            VideoOutput {
                id: videooutput
                width: parent.width
                height: parent.height
                source: mediaplayer1
            }
        }
        Rectangle {
            id: bottomBar

            width: parent.width * 0.8
            height: parent.height * 0.1
            anchors.top: mainWindow.bottom
            anchors.left: leftMenu.right

            color: "#17252A"

            Button {
                id: startstop
                text: "Start / Stop"

                height: parent.height * 0.7
                width: parent.width * 0.2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.2

                onClicked: (mouse)=> {
                    if (mediaplayer1.playbackState===1) {
                        mediaplayer1.pause();
                        bottomBar.change()
                    }
                    else if (mediaplayer1.playbackState===2) {
                        mediaplayer1.play();
                        bottomBar.change()
                    }
                }
            }
            function change() {
                startstop.text = mediaplayer1.playbackState===2?"Start":"Stop"
            }
            Button {
                id: exitbutton
                text: "Exit"

                height: parent.height * 0.7
                width: parent.width * 0.2
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.2

                onClicked: Qt.quit()
            }
        }
    }

    Popup {
        id: popup

        leftMargin: parent.width * 0.1
        width: parent.width * 0.8
        topMargin: parent.height * 0.1
        height: parent.height * 0.8

        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape

        background: Rectangle {
            width: parent.width
            height: parent.height
            border.color: "#DEF2F1"
            border.width: 10
        }

        ComboBox {
            width: 200
            // model: [ "Banana", "Apple", "Coconut" ]
            model: ListModel {
                ListElement { text: "Banana"; color: "Yellow" }
                ListElement { text: "Apple"; color: "Green" }
                ListElement { text: "Coconut"; color: "Brown" }
            }
        }
    }
}
