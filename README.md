qemu-snappy-experiments
===

Experiments for running an ARM version of ubuntu (snappy) on qemu and have snapcraft available

## Snapcraft 2.x from Ubuntu ARM (Xenial only)

```
wget https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-armhf-disk1.img
```

####Run qemu

```
qemu-system-arm \
-kernel arm-vmlinux -append "root=/dev/mmcblk0p1 rw console=tty0" -m 1G -cpu cortex-a9 \
-M vexpress-a9 \
-sd 2015-04-06-ubuntu-trusty.img \
-net nic,model=lan9118,netdev=n0 -netdev user,id=n0 \
-redir tcp:5022::22
```

## Snapcraft 1.x from Ubuntu ARM

Use Ubuntu for ARM (14.04 currently) and install snapcraft.

More info at https://wiki.ubuntu.com/ARM/RaspberryPi

```
wget http://www.finnie.org/software/raspberrypi/2015-04-06-ubuntu-trusty.zip
unzip 2015-04-06-ubuntu-trusty.zip
```

####Run qemu

```
qemu-system-arm \
-kernel vmlinux-3.18-arm -append "root=/dev/mmcblk0p2 rw console=tty0" -m 1G -cpu cortex-a9 \
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
