import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    width: parent.width
    height: parent.height
    color: "#ffffff"

    ListView {
        id: listView
        property int currentIndex;
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
                                text: "HP"
                                font.bold: true
                                color: "#333333"
                            }
                            ProgressBar {
                                id: healthProgressBar
                                value: model.health
                                from: 0
                                to: model.health
                                states: [
                                    State {
                                        name: "not rinzler"
                                        when: model.name !== "RINZLR"
                                        PropertyChanges { target: healthProgressBar; indeterminate: false }
                                    },
                                    State {
                                        name: "rinzler"
                                        when: model.name === "RINZLR"
                                        PropertyChanges { target: healthProgressBar; indeterminate: true }
                                    }
                                ]
                            }
                            Label {
                                text: model.health
                                color: "#333333"
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Text {
                                text: "MP"
                                font.bold: true
                                color: "#333333"
                            }
                            ProgressBar {
                                id: manaProgressBar
                                value: model.mana
                                from: 0
                                to: model.mana
                                states: [
                                    State {
                                        name: "not rinzler"
                                        when: model.name !== "RINZLR"
                                        PropertyChanges { target: manaProgressBar; indeterminate: false }
                                    },
                                    State {
                                        name: "rinzler"
                                        when: model.name === "RINZLR"
                                        PropertyChanges { target: manaProgressBar; indeterminate: true }
                                    }
                                ]
                            }
                            Label {
                                text: model.mana
                                color: "#333333"
                            }
                        }

                        RowLayout {
                            spacing: 10
                            Label {
                                text: "ATK"
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
                                text: "DEF"
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
                                text: "INT"
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
                                text: "STR"
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
