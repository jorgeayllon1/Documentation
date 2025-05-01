# Create boot image from iso file on linux
1. Get the iso file.
2. Identify device where boot image will be created.
```sh
lsblk -f
```
3. Create boot image.

As an admin user :
```sh
dd if=/mypath/file.iso of=/otherpath/device status=progress bs=1M conv=fdatasync
```
