
# qemu-system-arm \
# -m 1G -cpu cortex-a9 -M vexpress-a9 \
# -kernel xenial-server-cloudimg-armhf-vmlinuz-lpae \
# -initrd xenial-server-cloudimg-armhf-initrd-generic-lpae \
# -append "root=/dev/sda rw console=tty0" \
# -hda xenial-server-cloudimg-armhf.img

# -initrd initrd.gz \
# -kernel vmlinux-4.4.1-arm \
# -append "root=/dev/sda rw console=tty0" \

# -sd xenial-server-cloudimg-armhf-disk1.img \
# -net nic,model=lan9118,netdev=n0 -netdev user,id=n0 \
# -redir tcp:5022::22

# -net nic,model=lan9118 -net tap,ifname=tap0,script=no,downscript=no
#-net nic,model=lan9118,vlan=0 -net user,vlan=0
# -sd ubuntu-15.04-snappy-armhf-raspi2.img \
