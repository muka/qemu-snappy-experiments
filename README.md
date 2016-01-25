qemu-snappy-experiments
===

Experiments for running the ARM version of ubuntu snappy on qemu.. but NOT working yet :(

Build kernel image (optional)
---

See https://electronicsconcepts.wordpress.com/2015/05/28/running-ubuntu-snappy-on-qemu/

```
#build a kernel boot image from vagrant
vagrant up
vagrant ssh -c "cd /vagrant && ./build.sh && exit"
vagrant halt
```

Run qemu
---

Launch `./run.sh` script. Requires `qemu-system-arm `


Issues:
---

__» No network__

`eth0` is not up or dhcp server is unreachable and cloud-init fails (?)

__» Login is not working (due to missing network and/or faulty `cloud-init`?)__

(See https://developer.ubuntu.com/en/snappy/start/installation-tips/)

Login as root with no password

```
sudo kpartx -av ubuntu-15.04-snappy-armhf-raspi2.img
sudo mount /dev/disk/by-label/system-b /mnt

# edit /mnt/etc/shadow to reset root password

```
