#!/bin/bash

# References,
#
# http://ftp.nl.debian.org/debian/dists/Debian9.3/main/installer-s390x/current/images/generic/ (I am using this!)
#
# http://ftp.nl.debian.org/debian/dists/Debian8.10/main/installer-s390x/current/images/generic/

# https://wiki.qemu.org/Documentation/Networking
#
# qemu-img create -f qcow2 hdd.img 128G
#
# In the OS menu, select the "KVM VirtIO network device" option.
#
# In the OS menu, set the VM's IP address to 10.0.2.15/24. 10.0.2.2 is QEMU's
# emulated router and maps to the host. So, set the gateway to 10.0.2.2 and
# nameserver to 10.0.2.3 (QEMU's DNS server).
#
# Continue installing Debian as usual.

qemu-system-s390x -M s390-ccw-virtio -kernel kernel.debian -append "root=/dev/vda1" -m 1024 -smp 3 -nographic \
  -drive file=hdd.img,format=qcow2,if=none,id=drive-virtio-disk0 \
  -device virtio-blk-ccw,drive=drive-virtio-disk0,id=virtio-disk0 \
  -netdev user,id=mynet0,hostfwd=tcp::10022-:22 \
  -device virtio-net-ccw,netdev=mynet0,id=net0,mac=08:00:2F:00:11:22,devno=fe.0.0001
