#  This module allows for creating a persistent swap space on android 
#  Copyright (C) 2025 chickendrop89
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.

export SWAPPROP="$MODPATH/swap.prop"
export SWAPFILE="$MODPATH/swap"

export VFS_CACHE_PRESSURE_SYSCTL_ENTRY="vm.vfs_cache_pressure"
export SWAPPINESS_SYSCTL_ENTRY="vm.swappiness"

cprint(){
    printf "- magisk-swapspace: %s \n" "$1"
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

    cat "$FILE" 2>/dev/null | sed -n "$REGEX" | head -n 1
}

# Set kernel tune - it's as simple as that
setKernelTune() {
    KEY="$1"
    VALUE="$2"

    sysctl -w -q "$KEY=$VALUE"
}