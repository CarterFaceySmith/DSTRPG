// main.qml

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "DSTRPG"
    color: "#f0f0f0"

    PartyStats{}
    MapItem {}

    // Main content layout
    // RowLayout {
    //     // Left side: Party
    //     PartyStats {
    //         Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    //     }

    //     // Right side: Map
    //     MapItem {
    //         Layout.alignment: Qt.AlignRight | Qt.AlignTop
    //     }
    // }
}
