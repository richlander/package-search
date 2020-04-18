#!/bin/sh

echo "**Ask APT**"
apt list --installed | grep $1
echo "**Ask dpkg**"
dpkg -l $1
