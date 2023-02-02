import QtQuick 2.15
import QtQuick.Window 2.15
// import QtQuick.Controls 1.4
// import QtQuick.Controls.Styles 1.4
// import QtQuick.Window 2.2
import QtQuick.Controls 2.12
// import QtQuick.Controls.Styles 2.12

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

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter

                /*
                style: ButtonStyle {
                    background: Rectangle {
                        border.width: leftMenuButton1.clicked ? 1 : 10
                        border.color: "#DEF2F1"
                        radius: 4
                        color: "#2B7A78"
                    }
                }
                */
            }

            Button {
                id: leftMenuButton2
                text: "Semantic Segmentation"

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: leftMenuButton1.bottom
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter

                /*
                style: ButtonStyle {
                    background: Rectangle {
                        border.width: leftMenuButton2.clicked ? 1 : 10
                        border.color: "#DEF2F1"
                        radius: 4
                        color: "#2B7A78"
                    }
                }
                */
            }
            Button {
                id: leftMenuButton3
                text: "Object Detection"

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: leftMenuButton2.bottom
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter

                /*
                style: ButtonStyle {
                    background: Rectangle {
                        border.width: leftMenuButton3.clicked ? 1 : 10
                        border.color: "#DEF2F1"
                        radius: 4
                        color: "#2B7A78"
                    }
                }
                */
            }
            Button {
                id: leftMenuButton4
                text: "Custom"

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: leftMenuButton3.bottom
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter

                /*
                style: ButtonStyle {
                    background: Rectangle {
                        border.width: leftMenuButton4.clicked ? 1 : 10
                        border.color: "#DEF2F1"
                        radius: 4
                        color: "#2B7A78"
                    }
                }
                */
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
        }
        Rectangle {
            id: bottomBar

            width: parent.width * 0.8
            height: parent.height * 0.1
            anchors.top: mainWindow.bottom
            anchors.left: leftMenu.right

            color: "#17252A"

            Button {
                id: bottomBarButton1
                text: "Start / Stop"

                height: parent.height * 0.7
                width: parent.width * 0.2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.2

                /*
                style: ButtonStyle {
                    background: Rectangle {
                        border.width: bottomBarButton1.clicked ? 1 : 10
                        border.color: "#DEF2F1"
                        radius: 4
                        color: "#2B7A78"
                    }
                }
                */
            }
            Button {
                id: bottomBarButton2
                text: "Exit"

                height: parent.height * 0.7
                width: parent.width * 0.2
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.2

                /*
                style: ButtonStyle {
                    background: Rectangle {
                        border.width: bottomBarButton2.clicked ? 1 : 10
                        border.color: "#DEF2F1"
                        radius: 4
                        color: "#2B7A78"
                    }
                }
                */
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
        /* contentItem: Column {
            ComboBox {
                currentIndex: 1
                model: ListModel {
                    id: cbItems
                    ListElement { text: "Banana"; color: "Yellow" }
                    ListElement { text: "Apple"; color: "Green" }
                    ListElement { text: "Coconut"; color: "Brown" }
                }
                width: 200
                onCurrentIndexChanged: console.debug(cbItems.get(currentIndex).text + ", " + cbItems.get(currentIndex).color)
            }
        } */
    }
    /*
    Rectangle {
        id: root1
        width: parent.width / 2
        height: parent.height
        color: "#77cc44"

        MediaPlayer {
            id: mediaplayer1
            source: "gst-pipeline: v4l2src ! video/x-raw,framerate=30/1 ! decodebin ! videoconvert ! qtvideosink"
            autoPlay: true
        }

        VideoOutput {
            id: camoutput
            width: parent.width
            height: parent.height
            source: mediaplayer1
        }

        Button {
            id: cameraplaypause
            text: "Camera Pause"
            height: parent.height / 10
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            onClicked: (mouse)=> {
                if (mediaplayer1.playbackState===1) {
                    mediaplayer1.pause();
                    root1.change()
                }
                else if (mediaplayer1.playbackState===2) {
                    mediaplayer1.play();
                    root1.change()
                }
            }
        }
        function change() {
            cameraplaypause.text = mediaplayer1.playbackState===2?"Camera Play":"Camera Pause"
        }
    }
    Rectangle {
        id: root2
        anchors.right: parent.right
        width: parent.width / 2
        height: parent.height
        color: "#77cc44"

        MediaPlayer {
            id: mediaplayer2
            source: "gst-pipeline: videotestsrc ! qtvideosink"
            autoPlay: true
        }

        VideoOutput {
            id: videooutput
            width: parent.width
            height: parent.height
            source: mediaplayer2
        }

        Button {
            id: videoplaypause
            text: "Video Pause"
            height: parent.height / 10
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            onClicked: (mouse)=> {
                if (mediaplayer2.playbackState===1) {
                    mediaplayer2.pause();
                    root2.change()
                }
                else if (mediaplayer2.playbackState===2) {
                    mediaplayer2.play();
                    root2.change()
                }
            }
        }
        function change() {
            videoplaypause.text = mediaplayer2.playbackState===2?"Video Play":"Video Pause"
        }
    }
    */
}
