// MapItem.qml

import QtQuick 2.15

Rectangle {
    width: parent.width * 0.4
    height: parent.height
    color: "#ffffff"
    anchors.right: parent.right

    Repeater {
        model: 5  // Generate 5 rows
        delegate: Row {
            Repeater {
                model: 5  // Generate five columns
                delegate: Rectangle {
                    width: 40
                    height: 40
                    color: "green"
                    border.color: "white"
                    border.width: 3
                }
            }
        }
    }
}
