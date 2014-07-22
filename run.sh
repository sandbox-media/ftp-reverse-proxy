#!/bin/bash

confd -interval=10 -confdir=/confd -node=${ETCD_PORT_4001_TCP_ADDR:-172.17.42.1}:4001 &

exec /usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid
