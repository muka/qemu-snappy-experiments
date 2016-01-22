#!/bin/sh

ifconfig eth0 down
ifconfig br0 down
ifconfig br0 down

brctl delbr br0

ifconfig eth0 -promisc
ifconfig eth0 up
