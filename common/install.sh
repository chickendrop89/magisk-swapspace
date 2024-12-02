#!/system/bin/sh

# Strip _update from current MODPATH
INJECTED_MODPATH="${MODPATH//_update/}"

# Insert the variable at the beginning of a file
insert_variable() {
  sed -i "1i export MODPATH=$INJECTED_MODPATH" "$1"
}

insert_variable "$MODPATH/system/bin/magiskswap" # Main binary
insert_variable "$MODPATH/common.sh" # Common functions
