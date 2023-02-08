import QtQuick 2.1
import QtQuick.Window 2.1
import QtQuick.Controls 2.1
import QtMultimedia 5.1
import Qt.labs.folderlistmodel 2.1

Window {
    // width: 1920
    // height: 1080
    visible: true
    // TODO: Enable this to display the demo in fullscreen
    visibility: "FullScreen"
    title: qsTr("AM62A EdgeAI Demo")

    Rectangle {
        id: appBackground
        color: "#17252A"
        width: parent.width
        height: parent.height

        Rectangle {
            id: topBar
            width: parent.width
            height: parent.height * 0.1
            anchors.top: parent.top
            anchors.left: parent.left
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

            width: parent.width * 0.15
            height: parent.height * 0.9
            anchors.top: topBar.bottom
            anchors.left: parent.left

            color: "#17252A"

            Button {
                id: leftMenuButton1
                text: "Image Classification"

                height: parent.height * 0.1
                width: parent.width * 0.8
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle {
                    id: leftMenuButton1BG
                    color: leftMenuButton1.down ? "#3AAFA9" : "#2B7A78"
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
                onClicked: {
                    mediaplayer1.source = buttonsClicked.leftMenuButtonClicked(1, leftMenu.width, topBar.height, videooutput.width, videooutput.height)
                    leftMenuButton1BG.color = "#3AAFA9"
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
                background: Rectangle {
                    id: leftMenuButton2BG
                    color: leftMenuButton2.down ? "#3AAFA9" : "#2B7A78"
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
                onClicked: {
                    mediaplayer1.source = buttonsClicked.leftMenuButtonClicked(2, leftMenu.width, topBar.height, videooutput.width, videooutput.height)
                    leftMenuButton2BG.color = "#3AAFA9"
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
                background: Rectangle {
                    id: leftMenuButton3BG
                    color: leftMenuButton3.down ? "#3AAFA9" : "#2B7A78"
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
                onClicked: {
                    mediaplayer1.source = buttonsClicked.leftMenuButtonClicked(3, leftMenu.width, topBar.height, videooutput.width, videooutput.height)
                    leftMenuButton3BG.color = "#3AAFA9"
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
                background: Rectangle {
                    id: leftMenuButton4BG
                    color: leftMenuButton4.down ? "#3AAFA9" : "#2B7A78"
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
                onClicked: {
                    leftMenuButton4BG.color = "#3AAFA9"
                    popup.open()
                }
            }
        }
        Rectangle {
            id: mainWindow

            width: parent.width * 0.825
            height: parent.height * 0.8
            anchors.top: topBar.bottom
            anchors.left: leftMenu.right
            anchors.rightMargin: parent.width * 0.025

            border.color: "#DEF2F1"
            border.width: 1

            radius: 10
            color: "#17252A"

            MediaPlayer {
                id: mediaplayer1
                objectName: "mediaplayer1"
                // source: is provided by the Cpp Backend
                autoPlay: false
            }

            VideoOutput {
                id: videooutput
                // anchors.margins: 2
                width: parent.width
                height: parent.height
                source: mediaplayer1
                fillMode: VideoOutput.PreserveAspectCrop
            }
        }
        Rectangle {
            id: bottomBar

            width: parent.width * 0.9
            height: parent.height * 0.1
            anchors.top: mainWindow.bottom
            anchors.left: leftMenu.right

            color: "#17252A"

            Button {
                id: startstop
                text: "Start"
                onClicked: (mouse)=> {
                    if ((mediaplayer1.playbackState === 0) || (mediaplayer1.playbackState === 2)) {
                        mediaplayer1.play()
                        startstop.text = "Stop"
                    }
                    else if (mediaplayer1.playbackState === 1) {
                        mediaplayer1.stop()
                        startstop.text = "Start"
                    }
                }
                height: parent.height * 0.7
                width: parent.width * 0.2
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: parent.width * 0.2

                background: Rectangle {
                    color: leftMenuButton4.down ? "#3AAFA9" : "#2B7A78"
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
            }
            Button {
                id: exitbutton
                text: "Exit"
                onClicked: Qt.quit()
                height: parent.height * 0.7
                width: parent.width * 0.2
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: parent.width * 0.2

                background: Rectangle {
                    color: leftMenuButton4.down ? "#3AAFA9" : "#2B7A78"
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
            }
        }
    }

    Popup {
        id: popup

        leftMargin: parent.width * 0.2
        width: parent.width * 0.6
        topMargin: parent.height * 0.2
        height: parent.height * 0.6

        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        background: Rectangle {
            width: parent.width
            height: parent.height
            border.color: "#DEF2F1"
            border.width: 10
        }

        ComboBox {
            id: popupInputType
            width: parent.width * 0.3
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.15
            currentIndex: 0
            editable: true
            model: ListModel {
                id: popupInputTypeOptions
                ListElement { textRole: "Input Type" }
                ListElement { textRole: "Image" }
                ListElement { textRole: "Video" }
                ListElement { textRole: "Camera" }
            }
            onCurrentIndexChanged: {
                console.debug(popupInputTypeOptions.get(currentIndex).textRole)
                popupMenu.popupInputTypeSelected(popupInputTypeOptions.get(currentIndex.textRole))
            }
        }
        ComboBox {
            id: popupInput
            width: parent.width * 0.3
            anchors.left: popupInputType.right
            anchors.leftMargin: parent.width * 0.1
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2

            model: folderModel
            textRole: "fileName"

            FolderListModel {
                id: folderModel
                folder: ""
            }
            onCurrentIndexChanged: console.debug(popupInputOptions.get(currentIndex).textRole)
        }

        ComboBox {
            id: popupModel
            width: parent.width * 0.3
            anchors.top: popupInputType.bottom
            anchors.topMargin: parent.height * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.15
            currentIndex: 0
            editable: true
            model: ListModel {
                id: popupModelOptions
                ListElement { textRole: "Model" }
                ListElement { textRole: "Model1" }
                ListElement { textRole: "Model2" }
                ListElement { textRole: "Model3" }
            }
            onCurrentIndexChanged: console.debug(popupModelOptions.get(currentIndex).textRole)
        }
    }
}
