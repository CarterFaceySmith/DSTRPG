import QtQuick 2.15

Rectangle {
    width: parent.width * 0.4
    height: parent.height
    color: "light gray"
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter

    Repeater {
        model: 9
        delegate: Row {
            Repeater {
                model: 9
                delegate: Rectangle {
                    width: 40
                    height: 40
                    color: "green"
                    border.color: "light gray"
                    border.width: 3
                }
            }
        }
    }
}
