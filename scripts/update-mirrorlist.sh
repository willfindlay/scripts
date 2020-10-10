#! /bin/bash
#    update-mirrorlist.sh  Update pacman mirrorlist with sensible defaults.
#    Copyright (C) 2020  William Findlay <will@ccsl.carleton.ca>
#
#    This program is free software: you can redistribute it and/or modify it
#    under the terms of the GNU General Public License as published by the Free
#    Software Foundation, either version 3 of the License, or (at your option)
#    any later version.
#
#    This program is distributed in the hope that it will be useful, but WITHOUT
#    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#    more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#    Makes a backup of pacman mirror list and then uses reflector to created
#    a new version with the 70 most recently updated mirrors sorted by rate.

sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --protocol https --latest 70 --sort rate --save /etc/pacman.d/mirrorlist
