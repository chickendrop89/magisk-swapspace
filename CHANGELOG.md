## 2.3
- Remove vfs-cache-pressure as it's kinda unrelated to this module
- Add proper permissions to the swapfile during creation
- Change module description/usage
- Simplify the code a bit

## 2.2
##### ⚠️ This version is deprecating older superuser managers (Magisk: 26) (KSU: 0.9.3) ⚠️
- Use better way of checking if boot completed
- Sped up the installation a bit
- Future-proof for newer magisk versions
- Add support for MMRL repo.json

## 2.1
- Fix some unexpected behaviour with the free space check
- Refactor some code to be POSIX compliant
- Fix wrong command ranges with `swappiness`

## 2.0
- Reword the `add` command to `create`
- Reword the `keep` option to `preserve`
- Allow setting `swappiness` to `0` for some reason (not recommended)
- Fix wrong command ranges with `create`
- Make the usage block more understandable
- Add a free space check
- Optimize the code

## 1.3
- Upstream the MMT-EX template to 3.7
- Stop the module from unnecessarily modifying `swappiness`

## 1.2
- Add option to `swapon` and `swapoff` on demand (via `status` command)
- Add option to `keep` the swapfile on removal, effectively just disabling it
- Fix mangled output and spelling mistake with the `status` command

## 1.1
- Add option to `reset` the kernel tunables to unmodified value
- Add option to `show` the current and unmodified kernel tunable values
- Fix errors when tuning `swappiness` and `vfs-cache-pressure`
- Make the usage block more readable

## 1.0
- Initial release