qemu-system-arm -kernel arm-vmlinux -append "root=/dev/mmcblk0p2 rw console=tty0" -m 1G -cpu cortex-a9 -M vexpress-a9 -sd ubuntu-15.04-snappy-armhf-raspi2.img -net nic,model=lan9118 -net tap,ifname=tap0,script=no,downscript=no
#-net nic,model=lan9118,vlan=0 -net user,vlan=0
