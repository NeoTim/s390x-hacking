#### What?

A project to play with Linux running on an emulated s390x machine.

#### HOWTO

* Use the `install.sh` script to install Debian 9.

* Shutdown the VM after installation.

* Extract the installed kernel and initrd files from the VM's disk image.

  ```
  $ guestfish

  ><fs> add-ro hdd.img
  ><fs> launch
  ><fs> list-filesystems
  ><fs> mount /dev/sda1 /
  ><fs> copy-out /boot/vmlinuz-4.9.0-4-s390x .
  ><fs> copy-out /boot/initrd.img-4.9.0-4-s390x .
  ```

  These file names will change, and will need to be adjusted.

* Use the `boot.sh` script to boot the installed system.

* SSH into the booted VM using the following command,

  ```
  $ ssh -p 10022 <username>@localhost
  ```

#### Compatibility

* Host OS -> Fedora 27 x86_64 on i7-6600U CPU


#### Credits

* https://wiki.qemu.org/Documentation/Platforms/S390X

* John Finigan

* Richard W.M. Jones
