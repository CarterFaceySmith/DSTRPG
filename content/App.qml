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

    PartyStats{}
    MapItem {}
}
