
# Emulate ubuntu core on RPi2 with qemu
# based on https://electronicsconcepts.wordpress.com/2015/05/28/running-ubuntu-snappy-on-qemu/

sudo apt-get install git ncurses-base libncurses5-dev make gcc-arm-linux-gnueabi gcc-arm-linux-gnueabi gcc-arm-none-eabi bc -y

Kv=3.18.25
wget https://cdn.kernel.org/pub/linux/kernel/v3.x/linux-${Kv}.tar.xz
wget http://cdimage.ubuntu.com/ubuntu-snappy/15.04/stable/latest/ubuntu-15.04-snappy-armhf-raspi2.img.xz

tar xvf linux-${Kv}.tar.xz linux-${Kv}/

cd linux-${Kv}
cp ../kernel.config ./.config

make ARCH=arm vexpress_defconfig

# use default .config
#make ARCH=arm menuconfig

make ARCH=arm

cd ../
ln -s linux-${Kv}/arch/arm/boot/zImage arm-vmlinux
