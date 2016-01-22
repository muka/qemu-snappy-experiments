qemu-snappy-experiments
===

Experiments for running the ARM version of ubuntu snappy on qemu.. but NOT working yet :(

Build & start image
---

```
#build a kernel boot image from vagrant
vagrant up
vagrant ssh -c "cd /vagrant && ./build.sh && exit"
vagrant halt

# image should be there as `arm-vmlinux`
# start qemu-system-arm (install it if missing)
./run.sh

```

Issues:
---

__» No network__

`eth0` is not up on cloud-init run causing it to fail (there is a no net datasource but seems to be ignored / faulty)

__» Login is not working (due to missing network or faulty `cloud-init`?)__

(See https://developer.ubuntu.com/en/snappy/start/installation-tips/)

```
sudo kpartx -av ubuntu-15.04-snappy-armhf-raspi2.img
sudo mount /dev/disk/by-label/system-a /mnt

# edit /mnt/etc/shadow & /mnt/etc/passwd to reset root password

```
