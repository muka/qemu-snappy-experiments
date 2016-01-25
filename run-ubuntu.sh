qemu-system-arm \
-kernel arm-vmlinux -append "root=/dev/mmcblk0p2 rw console=tty0" -m 1G -cpu cortex-a9 \
-M vexpress-a9 \
-sd 2015-04-06-ubuntu-trusty.img \
-net nic,model=lan9118,netdev=n0 -netdev user,id=n0 \
-redir tcp:5022::22

# -net nic,model=lan9118 -net tap,ifname=tap0,script=no,downscript=no
#-net nic,model=lan9118,vlan=0 -net user,vlan=0
# -sd ubuntu-15.04-snappy-armhf-raspi2.img \

