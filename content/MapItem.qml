import QtQuick
import QtQuick.Layouts

Rectangle {
    width: parent.width * 0.4
    height: parent.height
    color: "light gray"
    anchors.right: parent.right

    Repeater {
        model: 9
        delegate: RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 3  // Adjust spacing between rectangles as needed

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
