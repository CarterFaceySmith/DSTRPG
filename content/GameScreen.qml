// MapPage.qml

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Item {
    width: 500
    height: 670
    anchors.centerIn: parent
    focus: true

    MouseArea {
        anchors.fill: parent
        onClicked: parent.forceActiveFocus()
    }

    property string titleFont: "URW Bookman"
    property string localFont: "JetBrainsMono NF"

    Text {
        id: gameName
        font.family: titleFont
        font.pixelSize: 50
        font.bold: true
        text: "DSTRPG"
        color: helper.myColors.fgdark
    }

    Row {
        anchors.right: parent.right
        spacing: 5
        Repeater {
            id: scoreBoard
            model: 2
            Rectangle {
                width: (index == 0) ? 95 : 125
                height: 55
                radius: 3
                color: helper.myColors.bgdark
                property string scoreText: "0"// Score check func
                Text {
                    text: (index == 0) ? qsTr("SCORE") : qsTr("BEST")
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 6
                    font.family: localFont
                    font.pixelSize: 13
                    color: helper.myColors.fglight
                }
                Text {
                    text: scoreText
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 22
                    font.family: localFont
                    font.pixelSize: 25
                    font.bold: true
                    color: "white"
                }
            }
        }

        Text {
            id: addScoreText
            font.family: localFont
            font.pixelSize: 25
            font.bold: true
            color: Qt.rgba(119/255, 110/255, 101/255, 0.9);
            //                parent: scoreBoard.itemAt(0)
            anchors.horizontalCenter: parent.horizontalCenter

            property bool runAddScore: false
            property real yfrom: 0
            property real yto: -(parent.y + parent.height)
            property int addScoreAnimTime: 600

            ParallelAnimation {
                id: addScoreAnim
                running: false

                NumberAnimation {
                    target: addScoreText
                    property: "y"
                    from: addScoreText.yfrom
                    to: addScoreText.yto
                    duration: addScoreText.addScoreAnimTime

                }
                NumberAnimation {
                    target: addScoreText
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: addScoreText.addScoreAnimTime
                }
            }
        }
    }

    Text {
        id: banner
        y: 90
        height: 40
        text: qsTr("Flip environment cards to watch random events happen to your party!")
        color: helper.myColors.fgdark
        font.family: localFont
        font.pixelSize: 12
        verticalAlignment: Text.AlignVCenter
    }

    MessageDialog {
        id: welcomeDialog
        title: "Welcome to DSTRPG!"
        text: "Select your initial character from the menu bar, then get flipping to play!"
        onAccepted: {
            console.log("Test msg - user accepted welcome dialog box.")
        }
        Component.onCompleted: visible = false
    }

    Button {
        width: 140
        height: 50
        y: 130
        anchors.right: parent.right

        background: Rectangle {
            color: helper.myColors.bgbutton
            radius: 3
            Text{
                anchors.centerIn: parent
                text: qsTr("New Adventure!")
                color: helper.myColors.fgbutton
                font.family: localFont
                font.pixelSize: 14
                font.bold: true
            }
        }
        onClicked: welcomeDialog.visible = true // Welcome and init party
    }

    Rectangle {
        y: 180
        width: 500
        height: 500
        color: helper.myColors.bgdark
        radius: 6

        Grid {
            id: tileGrid
            x: 15
            y: 15
            rows: 4; columns: 4; spacing: 15

            Repeater {
                id: cells
                model: 16
                Rectangle {
                    width: 425/4;
                    height: 425/4
                    property bool flipped: false
                    radius: 3
                    color: (flipped == true) ? helper.myColors.bggrey : helper.myColors.bgbutton

                    transform: Rotation {
                        id: flipAnimation
                        origin.x: width / 2
                        origin.y: height / 2
                        axis.x: 0; axis.y: 1; axis.z: 0
                        angle: 0
                    }

                    states: [
                        State {
                            name: "flipped"
                            PropertyChanges { target: flipAnimation; angle: 180 }
                        }
                    ]

                    transitions: [
                        Transition {
                            from: ""; to: "flipped"
                            SequentialAnimation {
                                RotationAnimation { target: flipAnimation; duration: 250; from: 0; to: 180 }
                            }
                        },
                        Transition {
                            from: "flipped"; to: ""
                            SequentialAnimation {
                                RotationAnimation { target: flipAnimation; duration: 250; from: 0; to: 180 }
                            }
                        }

                    ]

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            parent.state = parent.state === "" ? "flipped" : ""
                            parent.flipped = parent.flipped === false ? true : false
                        }
                    }
                }
            }
        }
    }
}

