import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    width: parent.width
    height: parent.height
    color: "#ffffff"

    MouseArea {
        anchors.fill: parent
        onClicked: parent.forceActiveFocus()
    }

    ListView {
        id: listView
        property int currentIndex;
        width: parent.width * 0.25
        height: parent.height
        model: charModel
        spacing: 10

        delegate: Item {
            width: parent.width
            height: 220
            Rectangle {
                width: parent.width
                height: parent.height
                color: listView.currentIndex === index ? helper.myColors.fglight : helper.myColors.bgdark
                border.color: "#cccccc"
                border.width: 2
                radius: 6

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
                            color: helper.myColors.fgdark
                        }
                        RowLayout {
                            Label {
                                text: "Level " + model.level
                                font.italic: true
                                font.pixelSize: 16
                                color: Qt.rgba(119/255, 110/255, 101/255, 0.9);
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Text {
                                text: "HP"
                                font.bold: true
                                color: helper.myColors.fgdark
                            }
                            ProgressBar {
                                id: healthProgressBar
                                value: model.health
                                from: 0
                                to: model.health
                                // states: [
                                //     State {
                                //         name: "not rinzler"
                                //         when: model.name !== "RINZLR"
                                //         PropertyChanges { target: healthProgressBar; indeterminate: false }
                                //     },
                                //     State {
                                //         name: "rinzler"
                                //         when: model.name === "RINZLR"
                                //         PropertyChanges { target: healthProgressBar; indeterminate: true }
                                //     }
                                // ]
                            }
                            Label {
                                text: model.health
                                color: helper.myColors.fgdark
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Text {
                                text: "MP"
                                font.bold: true
                                color: helper.myColors.fgdark
                            }
                            ProgressBar {
                                id: manaProgressBar
                                value: model.mana
                                from: 0
                                to: model.mana
                                // states: [
                                //     State {
                                //         name: "not rinzler"
                                //         when: model.name !== "RINZLR"
                                //         PropertyChanges { target: manaProgressBar; indeterminate: false }
                                //     },
                                //     State {
                                //         name: "rinzler"
                                //         when: model.name === "RINZLR"
                                //         PropertyChanges { target: manaProgressBar; indeterminate: true }
                                //     }
                                // ]
                            }
                            Label {
                                text: model.mana
                                color: helper.myColors.fgdark
                            }
                        }

                        RowLayout {
                            spacing: 10
                            Label {
                                text: "ATK"
                                font.bold: true
                                color: helper.myColors.fgdark
                            }
                            Label {
                                text: model.attack
                                color: helper.myColors.fgdark
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Label {
                                text: "DEF"
                                font.bold: true
                                color: helper.myColors.fgdark
                            }
                            Label {
                                text: model.defence
                                color: helper.myColors.fgdark
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Label {
                                text: "INT"
                                font.bold: true
                                color: helper.myColors.fgdark
                            }
                            Label {
                                text: model.intelligence
                                color: helper.myColors.fgdark
                            }
                        }
                        RowLayout {
                            spacing: 10
                            Label {
                                text: "STR"
                                font.bold: true
                                color: helper.myColors.fgdark
                            }
                            Label {
                                text: model.strength
                                color: helper.myColors.fgdark
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
