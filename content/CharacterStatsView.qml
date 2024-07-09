import QtQuick
import QtQuick.Controls

Item {
    width: 400
    height: 300

    // Define properties for character stats
    property string characterName: "Hero"
    property int level: 1
    property int health: 100
    property int mana: 50
    property int strength: 10
    property int agility: 8
    property int intelligence: 6

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: "Character Sheet"
            font.bold: true
            font.pixelSize: 20
        }

        Rectangle {
            width: parent.width - 20
            height: 2
            color: "gray"
        }

        Text {
            text: "Name: " + characterName
        }

        Text {
            text: "Level: " + level
        }

        Text {
            text: "Health: " + health
        }

        Text {
            text: "Mana: " + mana
        }

        Text {
            text: "Strength: " + strength
        }

        Text {
            text: "Agility: " + agility
        }

        Text {
            text: "Intelligence: " + intelligence
        }
    }
}
