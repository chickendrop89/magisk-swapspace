#!/system/bin/sh

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

# Wait until system boot is *really* completed
while [ "$(getprop sys.boot_completed)" != "1" ]; 
  do
    sleep 1
done

# Import common functions from file
. "/data/adb/modules/magisk-swapspace/common.sh"

SWAPPINESS_PROP="$(readProp SWAPPINESS)"
VFS_CACHE_PRESSURE_PROP="$(readProp VFS-CACHE-PRESSURE)"
ENABLE_SWAP_PROP="$(readProp ENABLE-SWAP)"

# Sets the VFS Cache Pressure value if configured
if [ "$VFS_CACHE_PRESSURE_PROP" ];
  then setKernelTune "$VFS_CACHE_PRESSURE_SYSPATH" "$VFS_CACHE_PRESSURE_PROP"
fi

# Sets the Swappiness value if configured
if [ "$SWAPPINESS_PROP" ];
  then setKernelTune "$SWAPPINESS_SYSPATH" "$SWAPPINESS_PROP"
fi

# If swapspace was configured, swap-on boot
if [ "$ENABLE_SWAP_PROP" = true ]; 
  then
    PRIORITY="$(readProp SWAP-PRIORITY)"

    # If priority parameter was specified, use it when swapping-on
    if [ "$PRIORITY" = false ];
        then
            unset PRIORITY
        else
            PRIORITY="-p $PRIORITY"
    fi

    toybox swapon $PRIORITY $SWAPFILE
fi
