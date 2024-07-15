// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import DSTRPG
import content

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "DSTRPG"
    color: "#f0f0f0"
    property int currentIndex; // Define currentIndex as a property

    PartyStats {}
    RowLayout {
        // PartyStats {} //FIXME: When used within a layout, item doesn't display?
    }
    // CharacterEditor{}

}
