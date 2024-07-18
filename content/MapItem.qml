import QtQuick
import QtQuick.Layouts

Rectangle {
    width: parent.width * 0.7
    height: parent.height
    color: "light gray"
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
        Rectangle {
            color: 'yellow'
            Layout.rowSpan: 8
            Layout.columnSpan: 10
            Layout.preferredWidth: grid.prefWidth(this)
            Layout.preferredHeight: grid.prefHeight(this)
            Text {
                font.pixelSize: 26
                color: "#333333"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("MAP AREA")
            }
        }
        Rectangle {
            id: greenRect
            color: 'green'
            Layout.rowSpan: 4
            Layout.columnSpan: 12
            Layout.preferredWidth: grid.prefWidth(this)
            Layout.preferredHeight: grid.prefHeight(this)
            Text {
                font.pixelSize: 26
                color: "#333333"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                text: qsTr("TEXT OUTPUT AREA")
            }
        }
    }
}
