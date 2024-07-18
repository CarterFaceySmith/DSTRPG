import QtQuick 6.2
import QtQuick.Layouts
import QtQuick.Controls

Item {
    Rectangle {
        width: parent.width
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
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                Text {
                    text: "Character Editor"
                    font.pixelSize: 26
                    color: "#333333"
                }
            }

            // Editor fields
            RowLayout {
                spacing: 20
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                Text {
                    text: "UID"
                    font.bold: true
                    color: "#333333"
                }
                TextField {
                    width: 200
                    placeholderText: "Enter name..."
                    text: listView.currentItem ? listView.currentItem.model.name : ""
                    onEditingFinished: {
                        if (listView.currentItem) {
                            characterModel.set(listView.currentIndex, "name", text)
                        }
                    }
                }
            }

            RowLayout {
                spacing: 20
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                Text {
                    text: "HTH"
                    font.bold: true
                    color: "#333333"
                }
                SpinBox {
                    width: 100
                    value: listView.currentItem ? listView.currentItem.model.health : 0
                    onValueChanged: {
                        if (listView.currentItem) {
                            characterModel.set(listView.currentIndex, "health", value)
                        }
                    }
                }
            }

            RowLayout {
                spacing: 20
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                Text {
                    text: "ATK"
                    font.bold: true
                    color: "#333333"
                }
                SpinBox {
                    width: 100
                    value: listView.currentItem ? listView.currentItem.model.attack : 0
                    onValueChanged: {
                        if (listView.currentItem) {
                            characterModel.set(listView.currentIndex, "attack", value)
                        }
                    }
                }
            }

            RowLayout {
                spacing: 20
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                Text {
                    text: "DEF"
                    font.bold: true
                    color: "#333333"
                }
                SpinBox {
                    width: 100
                    value: listView.currentItem ? listView.currentItem.model.defence : 0
                    onValueChanged: {
                        if (listView.currentItem) {
                            characterModel.set(listView.currentIndex, "defence", value)
                        }
                    }
                }
            }
        }
    }
}
