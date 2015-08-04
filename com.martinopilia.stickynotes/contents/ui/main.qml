/*
 * This file is part of Sticky Notes.
 *
 * Sticky Notes is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Sticky Notes is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Sticky Notes. If not, see <http://www.gnu.org/licenses/>.
 *
 * Copyright (C) Martino Pilia <martino.pilia@gmail.com>, 2015
 */

import QtQuick 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0
import QtQuick.Controls 1.4

Image {
    id: backgroundImage;

    // default size
    width: 250;
    height: 300;

    Plasmoid.backgroundHints: "NoBackground"; // remove default background

    // background image file names
    property variant background: [
        "yellow.svg",
        "red.svg",
        "green.svg",
        "blue.svg",
        "white.svg"
    ];

    // set the background image according to user settings
    source: plasmoid.file(
        "images",
        background[plasmoid.configuration.paperColor]);

    FocusScope {
        width: contentTextArea.width;
        height: contentTextArea.height;

        // actual text area
        TextArea {
            id: contentTextArea;

            // get font and text color from user settings
            font: plasmoid.configuration.textFont;
            textColor: plasmoid.configuration.textColor;

            text: plasmoid.configuration.content; // get saved text
            backgroundVisible: false; // no background above the image

            // hide scrollbar if the plasmoid is not focused on creation
            verticalScrollBarPolicy:
                (activeFocus ? Qt.ScrollBarAsNeeded : Qt.ScrollBarAlwaysOff);

            // set to 85% to left some space for the border
            height: backgroundImage.height * 0.85;
            width: backgroundImage.width * 0.85;
        }

        onActiveFocusChanged: {
            if (!activeFocus) {
                // save the content when the text loses focus
                plasmoid.configuration.content = contentTextArea.text;
                // hide scrollbar when not focused
                contentTextArea.verticalScrollBarPolicy = Qt.ScrollBarAlwaysOff;
            } else {
                // update the text from the saved config
                // (it may be manually changed in the config file)
                contentTextArea.text = plasmoid.configuration.content;
                // show scrollbar on focus when needed
                contentTextArea.verticalScrollBarPolicy = Qt.ScrollBarAsNeeded;
            }
        }
    }

    // save the content on plasmoid deallocation
    Component.onDestruction: {
        plasmoid.configuration.content = contentTextArea.text;
    }
}
