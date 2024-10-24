# magisk-swapspace

This module saves memory a bit by swapping some to a disk

## Installation:
* [Download the module archive here](https://github.com/chickendrop89/magisk-swapspace/releases/latest/download/magiskswapspace.zip)
* Flash it in magisk app, or using command line
* Run `magiskswap` in your preferred terminal app (as a root user)

## Usage:
```
magisk-swapspace by chickendrop89 ⓒ GPLv3 license
usage: magiskswap <COMMAND> <VALUE> [OPTIONAL]

create <size: GB> [priority] [preserve]
  - Creates swapfile and swaps-on
    (?) [preserve] option enables the previously disabled swapfile

remove [preserve]
  - Permanently swaps-off and deletes swapfile
    (?) [preserve] option only disables it

status [swapon] [swapoff]
  - Prints swapfile size and status

swappiness <0-200> [show] [reset]
  - Controls how agressively Linux swaps anonymous memory

vfs-cache-pressure <1-∞> [show] [reset] 
  - Controls the tendency of the kernel to reclaim the memory

(?) These commands are presistent across reboots (?)
```

## Notice:
Before tinkering with `swappiness` and `vfs-cache-pressure`, you should understand how do they work:

- [openSUSE documentation on tuning memory management](https://doc.opensuse.org/documentation/leap/archive/15.1/tuning/html/book.sle.tuning/cha-tuning-memory.html#cha-tuning-memory-vm-reclaim)

- [Linux documentation on virtual memory subsystem](https://docs.kernel.org/admin-guide/sysctl/vm.html)

Using on-disk `swap` on older eMMC or UFS chips is **not recomended** and could result in highly reduced lifespan ⚠️ Lower the swappiness to make the it less agressive!

## Requirements
- Magisk 27.O+ 
- KernelSU v0.9.4+ 