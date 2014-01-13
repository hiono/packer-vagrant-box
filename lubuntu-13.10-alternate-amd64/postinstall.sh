#!/bin/sh
echo "==============================================="
echo "exec postinstall.sh"
echo "==============================================="

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install linux-headers-$(uname -r) build-essential
sudo apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev wget curl
sudo apt-get clean

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

sudo sed -i -e 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
