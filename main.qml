import QtQuick 2.1
import QtQuick.Window 2.1
import QtQuick.Controls 2.1
import QtMultimedia 5.1
import Qt.labs.folderlistmodel 2.4

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

            Button {
                id: topBarExitButton
                text: "X"
                onClicked: Qt.quit()
                height: parent.height * 0.2
                width: height
                // anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: width
                anchors.top: parent.top
                anchors.topMargin: height

                background: Rectangle {
                    color: parent.hovered ? "#CC0000" : "#FF0000"
                    radius: parent.height
                }
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
                    color: !parent.enabled ? "#17252A" : (parent.hovered ? "#FF0000" : (buttonsClicked.activeButton===1? "#00FF00" : "#0000FF"))
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
                onClicked: {
                    mediaplayer1.source = buttonsClicked.leftMenuButtonClicked(1, leftMenu.width, topBar.height, videooutput.width, videooutput.height)
                    console.log("buttonsClicked.activeButton == ", buttonsClicked.activeButton)
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
                    color: !parent.enabled ? "#17252A" : (parent.hovered ? "#FF0000" : (buttonsClicked.activeButton===1? "#00FF00" : "#0000FF"))
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
                onClicked: {
                    mediaplayer1.source = buttonsClicked.leftMenuButtonClicked(2, leftMenu.width, topBar.height, videooutput.width, videooutput.height)
                    console.log("buttonsClicked.activeButton == ", buttonsClicked.activeButton)
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
                    color: !parent.enabled ? "#17252A" : (parent.hovered ? "#FF0000" : (buttonsClicked.activeButton===1? "#00FF00" : "#0000FF"))
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
                onClicked: {
                    mediaplayer1.source = buttonsClicked.leftMenuButtonClicked(3, leftMenu.width, topBar.height, videooutput.width, videooutput.height)
                    console.log("buttonsClicked.activeButton == ", buttonsClicked.activeButton)
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
                    color: !parent.enabled ? "#17252A" : (parent.hovered ? "#FF0000" : (buttonsClicked.activeButton===1? "#00FF00" : "#0000FF"))
                    border.color: "#DEF2F1"
                    border.width: 1
                    radius: 10
                }
                onClicked: {
                    console.log("buttonsClicked.activeButton == ", buttonsClicked.activeButton)
                    popup.open()
                }
            }
        }
        Rectangle {
            id: mainWindow
            color: "#17252A"
            width: parent.width * 0.825
            height: parent.height * 0.9
            anchors.top: topBar.bottom
            anchors.left: leftMenu.right
            anchors.rightMargin: parent.width * 0.025

            Rectangle {
                width: parent.width
                height: (parent.width / 16) * 9
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                border.color: "#DEF2F1"
                border.width: 1

                radius: 10
                color: "#17252A"

                MediaPlayer {
                    id: mediaplayer1
                    objectName: "mediaplayer1"
                    // source: is provided by the Cpp Backend
                    autoPlay: true
                }

                VideoOutput {
                    id: videooutput
                    width: parent.width
                    height: parent.height
                    source: mediaplayer1
                    fillMode: VideoOutput.PreserveAspectCrop
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

        Text {
            id: inputTypeHead
            text: qsTr("Input Type: ")
            font.pointSize: 15
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.2
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.15
        }

        ComboBox {
            id: popupInputType
            width: parent.width * 0.3
            anchors.top: inputTypeHead.bottom
            anchors.topMargin: inputTypeHead.font.pointSize * 0.5
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.15
            currentIndex: 0
            editable: true
            model: ListModel {
                id: popupInputTypeOptions
                ListElement { name: "Input Type" }
                ListElement { name: "Image" }
                ListElement { name: "Video" }
                ListElement { name: "Camera" }
            }
            onCurrentIndexChanged: {
                console.debug(popupInputTypeOptions.get(currentIndex).textRole)
                popupMenu.popupInputTypeSelected(popupInputTypeOptions.get(currentIndex).name)
                if (popupInputTypeOptions.get(currentIndex.name) === "Image")
                    inputsFolder.folder = "file:///home/kart/Pictures"
                if (popupInputTypeOptions.get(currentIndex.name) === "Video")
                    inputsFolder.folder = "file:///home/kart/Videos"
                if (popupInputTypeOptions.get(currentIndex.name) === "Camera")
                    inputsFolder.folder = "file:///dev"
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
                id: inputsFolder
                folder: "file:///dev"
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
            model: folderModel
            textRole: "fileName"

            FolderListModel {
                id: modelsFolder
                folder: "/opt/models_zoo/"
            }
            onCurrentIndexChanged: console.debug(popupInputOptions.get(currentIndex).textRole)
        }
    }
}
