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

import QtQuick 2.2
import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: i18n("Appearance");
        icon: "knotes";
        source: "settings.qml";
    }
}
