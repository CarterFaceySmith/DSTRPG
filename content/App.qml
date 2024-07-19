// main.qml

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import DSTRPG

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: qsTr("DSTRPG")
    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("New Game")
                onTriggered: messageDialog.visible = true // Trigger startup func
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.exit()
            }
        }
        Menu {
            title: qsTr("Settings")
            Menu {
                title: qsTr("Initial Party")
                MenuItem {
                    text: qsTr("Warrior")
                    checkable: true
                    // checked: // Check party index one name
                    onTriggered: {
                        // Set player to warrior and run startup func
                    }
                }
                MenuItem {
                    text: qsTr("Rogue")
                    checkable: true
                    // checked: // Check party index one name
                    onTriggered: {
                        // Set player to rogue and run startup func
                    }
                }
                MenuItem {
                    text: qsTr("Mage")
                    checkable: true
                    // checked: // Check party index one name
                    onTriggered: {
                        // Set player to mage and run startup func
                    }
                }
                MenuItem {
                    text: qsTr("???")
                    checkable: true
                    // checked: // Check party index one name
                    onTriggered: {
                        // Set player to rinzlr and run startup func
                    }
                }
            }
        }
    }

    Item {
        id: helper
        focus: false
        property var myColors: {"bglight": "#FAF8EF",
                                "bggray": Qt.rgba(238/255, 228/255, 218/255, 0.35),
                                "bgdark": "#BBADA0",
                                "fglight": "#EEE4DA",
                                "fgdark": "#776E62",
                                "bgbutton": "#8F7A66", // Background color for the "New Game" button
                                "fgbutton": "#F9F6F2" // Foreground color for the "New Game" button
        }
    }
    color: helper.myColors.bglight

    PartyStats {}
    GameScreen {}

    MessageDialog {
        visible: true
        id: messageDialog
        title: "Welcome to DSTRPG"
        text: "You may select an initial party from the Settings dropdown"
        onAccepted: {
            console.log("Test msg - user accepted initial dialog box.")
        }
        Component.onCompleted: visible = false
    }
}

    // PartyStats{}
    // MapItem {}

