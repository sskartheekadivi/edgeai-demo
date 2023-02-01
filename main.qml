import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Hello World")


    Rectangle {
        id: background
        width: parent.width
        height: parent.height

        Rectangle {
            id: topBar

            width: parent.width
            height: parent.height * 0.1
            anchors.top: background.top
            anchors.left: background.left

            color: "#77cc44"

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

            color: "#446677"

            Button {
                id: leftMenuButton1
                text: "Image Classification"

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter

                style: ButtonStyle {
                    background: Rectangle {
                        border.width: leftMenuButton1.clicked ? 1 : 10
                        border.color: "#ff0000"
                        radius: 4
                        color: "#FFFFFF"
                    }
                }
            }

            Button {
                id: leftMenuButton2
                text: "Semantic Segmentation"

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: leftMenuButton1.bottom
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter

                style: ButtonStyle {
                    background: Rectangle {
                        border.width: leftMenuButton2.clicked ? 1 : 10
                        border.color: "#ff0000"
                        radius: 4
                        color: "#FFFFFF"
                    }
                }
            }
            Button {
                id: leftMenuButton3
                text: "Object Detection"

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: leftMenuButton2.bottom
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter

                style: ButtonStyle {
                    background: Rectangle {
                        border.width: leftMenuButton3.clicked ? 1 : 10
                        border.color: "#ff0000"
                        radius: 4
                        color: "#FFFFFF"
                    }
                }
            }
            Button {
                id: leftMenuButton4
                text: "Custom"

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: leftMenuButton3.bottom
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter

                style: ButtonStyle {
                    background: Rectangle {
                        border.width: leftMenuButton4.clicked ? 1 : 10
                        border.color: "#ff0000"
                        radius: 4
                        color: "#FFFFFF"
                    }
                }
            }
    }
        Rectangle {
            id: mainWindow

            width: parent.width * 0.8
            height: parent.height * 0.8
            anchors.top: topBar.bottom
            anchors.left: leftMenu.right

            color: "#c23469"
        }
        Rectangle {
            id: bottomBar

            width: parent.width * 0.8
            height: parent.height * 0.1
            anchors.top: mainWindow.bottom
            anchors.left: leftMenu.right

            color: "#ffff66"
        }
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
