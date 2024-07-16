// MapPage.qml

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Rectangle {
    width: parent.width * 0.4
    height: parent.height
    color: "#f0f0f0"

    ColumnLayout {
        spacing: 10

        Rectangle {
            width: parent.width
            height: 100
            color: "#e0e0e0"
            border.color: "#cccccc"
            border.width: 2
            radius: 10

            Text {
                anchors.centerIn: parent
                text: "Map Overview"
                font.bold: true
                font.pixelSize: 18
                color: "#333333"
            }
        }

        Rectangle {
            width: parent.width
            height: 300
            color: "#ffffff"
            border.color: "#cccccc"
            border.width: 2
            radius: 10

            // Simple dungeon map layout
            Rectangle {
                anchors.centerIn: parent
                width: parent.width * 0.8
                height: parent.height * 0.8
                color: "#9e7c3d"
                border.color: "#333333"
                border.width: 2
                radius: 10

            }
        }

        Rectangle {
            width: parent.width
            height: 100
            color: "#e0e0e0"
            border.color: "#cccccc"
            border.width: 2
            radius: 10

            Text {
                anchors.centerIn: parent
                text: "Legend"
                font.bold: true
                font.pixelSize: 18
                color: "#333333"
            }
        }
    }
}
