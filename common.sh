# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Copyright (C) 2024  chickendrop89

MODPATH="/data/adb/modules/magisk-swapspace"
SWAPPROP="$MODPATH/swap.prop"
SWAPFILE="$MODPATH/swap"

SWAPPINESS_SYSPATH="/proc/sys/vm/swappiness"
VFS_CACHE_PRESSURE_SYSPATH="/proc/sys/vm/vfs_cache_pressure"

cprint(){
    printf "- %s ...\n" "$1"
}

# Modify module properties
modifyProp(){
    NAME="$1"
    VARPROP="$2"
    FILE="$SWAPPROP"

    if [ "$NAME" ] && [ ! "$NAME" = "=" ]; 
        then
            touch "$FILE" 2>/dev/null
            echo "$NAME=$VARPROP" | while read -r prop;
                do
                    newprop="$(echo "$prop" | cut -d '=' -f1)"
                    sed -i "/${newprop}/d" "$FILE"
                    cat="$(cat "$FILE")"

                    echo "$prop" > "$FILE"
                    echo "$cat" >>"$FILE"
            done 2>/dev/null
    fi
}

# Delete module properties
deleteProp(){
    NAME="$1"
    FILE="$SWAPPROP"

    noneprop="$NAME="
    nonepropn="$noneprop\n"

    if [ "$NAME" ] && [ ! "$NAME" = "=" ]; 
        then
            sed -i "/${nonepropn}/d" "$FILE" 2>/dev/null
            sed -i "/${noneprop}/d" "$FILE" 2>/dev/null
    fi
}

# Read module properties
readProp() {
    REGEX="s/^$1=//p"
    FILE="$SWAPPROP"

    cat "$FILE" 2>/dev/null | dos2unix | sed -n "$REGEX" | head -n 1
}

# Set kernel tune - it's as simple as that
setKernelTune() {
    FILE="$1"
    VALUE="$2"

    echo "$FILE" > "$VALUE"
}