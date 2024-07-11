// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import PersonaKnockoff
import content

Window {
    visible: true
    width: 800
    height: 600
    title: "Character Stats Editor"
    color: "#f0f0f0"
    property int currentIndex: 1 // Define currentIndex as a property


    Rectangle {
        width: parent.width
        height: parent.height
        color: "#ffffff"

        ListView {
            id: listView
            width: parent.width * 0.4
            height: parent.height
            anchors.left: parent.left
            model: characterModel
            spacing: 10
            clip: true

            delegate: Item {
                width: parent.width
                height: 120
                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: listView.currentIndex === index ? "#e0e0e0" : "#f0f0f0"
                    border.color: "#cccccc"
                    border.width: 2
                    radius: 10
                    Behavior on color { ColorAnimation { duration: 200 } }

                    RowLayout {
                        anchors.fill: parent
                        spacing: 10

                        ColumnLayout {
                            spacing: 5
                            Label {
                                text: model.name
                                font.bold: true
                                font.pixelSize: 20
                                color: "#333333"
                            }
                            Label {
                                text: "Level " + (index + 1)
                                font.italic: true
                                font.pixelSize: 16
                                color: "#666666"
                            }
                            RowLayout {
                                spacing: 10
                                Label {
                                    text: "Health:"
                                    font.bold: true
                                    color: "#333333"
                                }
                                Label {
                                    text: model.health
                                    color: "#333333"
                                }
                            }
                            RowLayout {
                                spacing: 10
                                Label {
                                    text: "Attack:"
                                    font.bold: true
                                    color: "#333333"
                                }
                                Label {
                                    text: model.attack
                                    color: "#333333"
                                }
                            }
                            RowLayout {
                                spacing: 10
                                Label {
                                    text: "Defense:"
                                    font.bold: true
                                    color: "#333333"
                                }
                                Label {
                                    text: model.defense
                                    color: "#333333"
                                }
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            listView.currentIndex = index
                        }
                    }
                }
            }
        }

        Rectangle {
            width: parent.width * 0.6
            height: parent.height
            anchors.right: parent.right
            color: "#f0f0f0"

            ColumnLayout {
                anchors.fill: parent
                spacing: 20

                Rectangle {
                    width: parent.width
                    height: 100
                    color: "#e0e0e0"
                    border.color: "#cccccc"
                    border.width: 2
                    radius: 10
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    Text {
                        text: "Character Editor"
                        font.bold: true
                        font.pixelSize: 24
                        color: "#333333"
                    }
                }

                RowLayout {
                    spacing: 20
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    Text {
                        text: "Name:"
                        font.bold: true
                        color: "#333333"
                    }
                    TextField {
                        width: 200
                        placeholderText: "Enter name..."
                        text: characterModel.get(currentIndex).name // Bind to C++ model
                        onEditingFinished: characterModel.set(currentIndex, "name", text) // Update C++ model
                    }
                }

                RowLayout {
                    spacing: 20
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    Text {
                        text: "Health:"
                        font.bold: true
                        color: "#333333"
                    }
                    SpinBox {
                        width: 80
                        value: characterModel.get(currentIndex).health // Bind to C++ model
                        onValueChanged: characterModel.set(currentIndex, "health", value) // Update C++ model
                    }
                }

                RowLayout {
                    spacing: 20
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    Text {
                        text: "Attack:"
                        font.bold: true
                        color: "#333333"
                    }
                    SpinBox {
                        width: 80
                        value: characterModel.get(currentIndex).attack // Bind to C++ model
                        onValueChanged: characterModel.set(currentIndex, "attack", value) // Update C++ model
                    }
                }

                RowLayout {
                    spacing: 20
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    Text {
                        text: "Defense:"
                        font.bold: true
                        color: "#333333"
                    }
                    SpinBox {
                        width: 80
                        value: characterModel.get(currentIndex).defense // Bind to C++ model
                        onValueChanged: characterModel.set(currentIndex, "defense", value) // Update C++ model
                    }
                }
            }
        }
    }

    // Component.onCompleted: {
    //     // Initialize character model data (for testing)
    //     characterModel.addCharacter({ name: "Warrior", health: 120, attack: 60, defense: 40 });
    //     characterModel.addCharacter({ name: "Mage", health: 100, attack: 80, defense: 20 });
    //     characterModel.addCharacter({ name: "Rogue", health: 90, attack: 70, defense: 30 });
    // }

    // C++ backend integration
    // Component {
    //     id: characterModel
    //     charactermodel {}
    // }
}
