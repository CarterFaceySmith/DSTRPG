import QtQuick
import QtQuick.Layouts

Rectangle {
    width: parent.width * 0.7
    height: parent.height
    color: "white"
    anchors.right: parent.right

    GridLayout {
        id: grid
        anchors.fill: parent
        rows: 12
        columns: 12
        property double colMulti: grid.width / grid.columns
        property double rowMulti: grid.height / grid.rows
        function prefWidth(item){
            return colMulti * item.Layout.columnSpan
        }
        function prefHeight(item){
            return rowMulti * item.Layout.rowSpan
        }

        Rectangle {
            // color: 'red'
            Layout.rowSpan: 8
            Layout.columnSpan: 2
            Layout.preferredWidth: grid.prefWidth(this)
            Layout.preferredHeight: grid.prefHeight(this)
            CharacterEditor{}
        }
        // Rectangle {
        //     color: 'yellow'
        //     Layout.rowSpan: 8
        //     Layout.columnSpan: 10
        //     Layout.preferredWidth: grid.prefWidth(this)
        //     Layout.preferredHeight: grid.prefHeight(this)
        //     Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        //     // Text {
        //     //     font.pixelSize: 26
        //     //     color: "#333333"
        //     //     anchors.top: parent.top
        //     //     anchors.horizontalCenter: parent.horizontalCenter
        //     //     text: qsTr("MAP AREA")
        //     // }
        Repeater {
            model: 4
            Row {
                spacing: 10
                Layout.rowSpan: 2
                Layout.columnSpan: 10
                Layout.preferredWidth: grid.prefWidth(this)
                Layout.preferredHeight: grid.prefHeight(this)
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Repeater {
                    model: 7
                    Rectangle {
                        Text {
                            text: qsTr("Map Square")
                        }

                        width: parent.width / 8
                        height: parent.height
                        color: "#9e7c3d"
                        border.color: "#333333"
                        border.width: 2
                        radius: 10
                    }
                }
            }

        }

        Rectangle {
            id: greenRect
            color: 'light green'
            Layout.rowSpan: 4
            Layout.columnSpan: 12
            Layout.preferredWidth: grid.prefWidth(this)
            Layout.preferredHeight: grid.prefHeight(this)
            Text {
                font.pixelSize: 26
                color: "#333333"

                text: qsTr("TEXT OUTPUT AREA")
            }
        }
    }
}
