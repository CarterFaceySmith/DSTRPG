import QtQuick
import DSTRPG

Rectangle {
    width: parent.width * 0.6
    height: parent.height
    color: "lightblue"

    property DungeonGenerator dungeonGenerator: DungeonGenerator {}

    Component.onCompleted: {
        dungeonGenerator.generateDungeon(20, 20); // Example size
    }

    onDungeonGenerated: {
        var dungeonLayout = dungeonGenerator.dungeonLayout;
        // Render dungeon layout here
        for (var i = 0; i < dungeonLayout.length; ++i) {
            for (var j = 0; j < dungeonLayout[i].length; ++j) {
                var tileType = dungeonLayout[i][j];
                var rect = Qt.createQmlObject('import QtQuick 2.15; Rectangle { width: 40; height: 40; color: "green"; border.color: "white"; border.width: 3; }', map);
                rect.x = j * 40;
                rect.y = i * 40;
            }
        }
    }
}
