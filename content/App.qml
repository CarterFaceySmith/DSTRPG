// main.qml

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import DSTRPG

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "DSTRPG"
    color: "#f0f0f0"

    // DungeonGenerator {
    //     id: dungeonGenerator
    // }

    PartyStats{}
    MapItem {}
    // MapPage {}

    // DungeonGrid {
    //     dungeonGenerator: dungeonGenerator
    // }

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
