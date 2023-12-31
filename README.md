# magisk-swapspace

This module saves memory a bit by swapping some to a disk

## Installation:
Download the module archive, and flash it in Magisk app, or using command line

## Usage:
```
magisk-swapspace by chickendrop89
usage: magiskswap <NAME> <VALUE> [OPTIONAL]

add <size in GB> [priority] [keep]
  - Creates swapfile and swaps-on

remove [keep]   
  - Permanently swaps-off and deletes swapfile

status [swapon] [swapoff]
  - Prints swapfile size and status

swappiness <1-200> [show] [reset]
  - Controls how agressively Linux swaps anonymous memory

vfs-cache-pressure <1-∞> [show] [reset] 
  - Controls the tendency of the kernel to reclaim the memory

Notes:
- [remove keep, add keep]: 
 Instead of deleting, swap-off permanently but keep the file,
 Later, use "magiskswap add keep" to use the old swapfile         
```

## Notice:
Before tinkering with `swappiness` and `vfs-cache-pressure`, you should understand how do they work:

- [openSUSE documentation on tuning memory management](https://doc.opensuse.org/documentation/leap/archive/15.1/tuning/html/book.sle.tuning/cha-tuning-memory.html#cha-tuning-memory-vm-reclaim)

- [Linux documentation on virtual memory subsystem](https://docs.kernel.org/admin-guide/sysctl/vm.html)

Using `swap` on older eMMC/UFS chips is **not recomended** and could result in highly reduced lifespan ⚠️

## Requirements
- Magisk 20.4+ 
- KernelSU v0.6.7+ 