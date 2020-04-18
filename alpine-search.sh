#!/bin/sh

apk update

echo "**Ask APK"
apk list --installed | grep $1
