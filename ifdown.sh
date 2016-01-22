#!/bin/sh

ifconfig eth0 down
ifconfig br0 down
ifconfig tap0 down

brctl delbr br0

sudo ip route del 192.168.179.0/24

ifconfig eth0 down
ifconfig eth0 up

