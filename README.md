qemu-snappy-experiments
===

Experiments for running the ARM version of ubuntu snappy on qemu

## 1. Snapcraft from Ubuntu ARM

Use Ubuntu for ARM (14.04 currently) and install snapcraft.

More info at https://wiki.ubuntu.com/ARM/RaspberryPi

```
wget http://www.finnie.org/software/raspberrypi/2015-04-06-ubuntu-trusty.zip
unzip 2015-04-06-ubuntu-trusty.zip
```

####Run qemu

```
qemu-system-arm \
-kernel arm-vmlinux -append "root=/dev/mmcblk0p2 rw console=tty0" -m 1G -cpu cortex-a9 \
-M vexpress-a9 \
-sd 2015-04-06-ubuntu-trusty.img \
-net nic,model=lan9118,netdev=n0 -netdev user,id=n0 \
-redir tcp:5022::22
```

Login with `ubuntu / ubuntu`

Install ssh or ssh-fs eg `ssh ubuntu@localhost -p 5022`

`sudo apt-get install openssh-server -y`

####Install snapcraft

```
# see https://developer.ubuntu.com/en/snappy/build-apps/get-started/
sudo apt-add-repository ppa:snappy-dev/tools
sudo apt update
sudo apt-get install snapcraft -y
```

## 2. Use ubuntu snappy (not working)

```
qemu-system-arm \
-kernel arm-vmlinux -append "root=/dev/mmcblk0p2 rw console=tty0" -m 1G -cpu cortex-a9 \
-M vexpress-a9 \
-sd ubuntu-15.04-snappy-armhf-raspi2.img \
-net nic,model=lan9118,netdev=n0 -netdev user,id=n0 \
-redir tcp:5022::22
```

####Issues:

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

####Build kernel image (optional)

See https://electronicsconcepts.wordpress.com/2015/05/28/running-ubuntu-snappy-on-qemu/

```
#build a kernel boot image from vagrant
vagrant up
vagrant ssh -c "cd /vagrant && ./build.sh && exit"
vagrant halt
```
