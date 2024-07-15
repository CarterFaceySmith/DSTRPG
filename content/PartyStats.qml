import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    width: parent.width
    height: parent.height
    color: "#ffffff"
    property int currentIndex;

    ListView {
        id: listView
        width: parent.width * 0.25
        height: parent.height
        anchors.left: parent.left
        model: characterModel
        spacing: 10
        clip: true

        delegate: Item {
            width: parent.width
            height: 220
            Rectangle {
                width: parent.width
                height: parent.height
                color: listView.currentIndex === index ? "#e0e0e0" : "#f0f0f0"
                border.color: "#cccccc"
                border.width: 2
                radius: 10

                Behavior on color {
                    ColorAnimation { duration: 200; easing.type: Easing.InOutQuad }
                }

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
                        RowLayout {
                            Label {
                                text: "Level " + model.level
                                font.italic: true
                                font.pixelSize: 16
                                color: "#666666"
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Text {
                                text: "Health"
                                font.bold: true
                                color: "#333333"
                            }
                            ProgressBar {
                                value: model.health
                                from: 0
                                to: model.health
                            }
                            Label {
                                text: model.health
                                color: "#333333"
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Text {
                                text: "Mana"
                                font.bold: true
                                color: "#333333"
                            }
                            ProgressBar {
                                value: model.mana
                                from: 0
                                to: model.mana
                            }
                            Label {
                                text: model.mana
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
                                text: "Defence:"
                                font.bold: true
                                color: "#333333"
                            }
                            Label {
                                text: model.defence
                                color: "#333333"
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Label {
                                text: "Intelligence:"
                                font.bold: true
                                color: "#333333"
                            }
                            Label {
                                text: model.intelligence
                                color: "#333333"
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Label {
                                text: "Strength:"
                                font.bold: true
                                color: "#333333"
                            }
                            Label {
                                text: model.strength
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
}
