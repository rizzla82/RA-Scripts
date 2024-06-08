#!/bin/bash

if [ -e "ubuntu-24.04-server-cloudimg-amd64.img" ]; then
    echo 'File already exists' >&2
else
    curl -o "ubuntu-24.04-server-cloudimg-amd64.img" "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.img"
fi

echo  "Virtual machine name please"

read name

echo  "Virtual machine disk size"

read size

# Size example 20G

cp ubuntu-24.04-server-cloudimg-amd64.img $name-disk.img

qemu-img resize $name-disk.img $size

virt-install \
 --name $name \
 --memory 2048 \
 --disk /var/lib/libvirt/images/$name-disk.img,device=disk,bus=virtio \
 --disk /var/lib/libvirt/images/cloud-init-new.img,device=cdrom \
 --os-type linux \
 --os-variant ubuntu20.04 \
 --virt-type kvm \
 --graphics vnc \
 --network network=br0,model=virtio \
 --import
