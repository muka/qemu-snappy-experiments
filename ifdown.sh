#!/bin/sh

ifconfig eth0 down
ifconfig br0 down
ifconfig tap0 down

brctl delbr br0

ifconfig eth0 down
ifconfig eth0 up
