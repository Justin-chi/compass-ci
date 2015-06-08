#!/bin/bash
#####################################################################################
# Copyright (c) 2015 Huawei Technologies Co.,Ltd.
# chigang@huawei.com
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
#####################################################################################

# some packages or tools maybe use below filesystem
mount -t proc none /proc
mount -t sysfs none /sys
mount -t devpts none /dev/pts

# add openstack juno repo
apt-get update && apt-get install -y software-properties-common
add-apt-repository -y cloud-archive:juno

apt-get install -y -d ubuntu-cloud-keyring

apt-get install -y -d python-pip
apt-get install -y -d python-dev
apt-get install -y -d python-mysqldb
apt-get install -y -d ntp

apt-get install -y -d cinder-api
apt-get install -y -d cinder-scheduler
apt-get install -y -d python-cinderclient

apt-get install -y -d cinder-volume
apt-get install -y -d lvm2

#install dashboard packages
apt-get install -y -d apache2
apt-get install -y -d memcached
apt-get install -y -d libapache2-mod-wsgi
apt-get install -y -d openstack-dashboard

#install python-mysqldb
apt-get install -y -d libaio1
apt-get install -y -d libssl0.9.8
apt-get install -y -d mysql-client-5.5
apt-get install -y -d python-mysqldb

apt-get install -y -d mysql-server

apt-get install -y -d glance
apt-get install -y -d python-glanceclient

#install keepalived xinet haproxy
apt-get install -y -d keepalived
apt-get install -y -d xinetd
apt-get install -y -d haproxy

apt-get install -y -d keystone

apt-get install -y -d rabbitmq-server

#install compute-related neutron packages
apt-get install -y -d neutron-common
apt-get install -y -d neutron-plugin-ml2
apt-get install -y -d openvswitch-datapath-dkms
apt-get install -y -d openvswitch-switch

apt-get install -y -d neutron-plugin-openvswitch-agent

#install controller-related neutron packages
apt-get install -y -d neutron-server
apt-get install -y -d neutron-plugin-ml2

apt-get install -y -d xorp

#install neutron network related packages
apt-get install -y -d neutron-plugin-ml2
apt-get install -y -d openvswitch-datapath-dkms
apt-get install -y -d openvswitch-switch
apt-get install -y -d neutron-l3-agent
apt-get install -y -d neutron-dhcp-agent

apt-get install -y -d neutron-plugin-openvswitch-agent
apt-get install -y -d nova-compute-kvm

#install nova related packages
apt-get install -y -d nova-api
apt-get install -y -d nova-cert
apt-get install -y -d nova-conductor
apt-get install -y -d nova-consoleauth
apt-get install -y -d nova-novncproxy
apt-get install -y -d nova-scheduler
apt-get install -y -d python-novaclient
apt-get install -y -d python-oslo.rootwrap

apt-get install -y -d openjdk-7-jdk
apt-get install -y -d crudini

#rm  /etc/resolv.conf
#rm -rf /tmp/*

umount /proc
umount /sys
umount /dev/pts