#!/bin/bash

# install build
sudo yum -y install gcc python-devel wget

# configure route, now and permanently
sudo route add -net 192.168.113.0/24 gw 10.10.25.253
sudo /bin/bash -c "echo '192.168.113.0/24 via 10.10.25.253 dev br-ovs' >> /etc/sysconfig/network"

# generate Key
sudo mkdir -p /etc/cloudify/.ssh/
sudo ssh-keygen -f /etc/cloudify/.ssh/cfy-agent-kp -N ""
publick_key=$(sudo cat /etc/cloudify/.ssh/cfy-agent-kp.pub)

# configure route
route add -net 192.168.113.0/24 gw 10.10.25.253

# create secrets

cfy secret create ubuntu_trusty_image -s 05bb3a46-ca32-4032-bedd-8d7ebd5c8100
cfy secret create small_image_flavor -s 4d798e17-3439-42e1-ad22-fb956ec22b54
cfy secret create keystone_username -s admin
cfy secret create keystone_password -s 'cloudify1234'
cfy secret create keystone_tenant_name -s admin
cfy secret create keystone_url -s http://10.10.25.1:5000/v2.0
cfy secret create region -s RegionOne
cfy secret create agent_key_private -s /etc/cloudify/.ssh/cfy-agent-kp
cfy secret create agent_key_public --secret-file /etc/cloudify/.ssh/cfy-agent-kp.pub
cfy secret create private_subnet_name -s provider_subnet
cfy secret create private_network_name -s provider
cfy secret create public_subnet_name -s  private_subnet
cfy secret create public_network_name -s private_network
cfy secret create router_name -s router1
cfy secret create external_network_name -s external_network