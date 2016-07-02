#!/bin/bash

# put in /etc/NetworkManager/dispatcher.d to see info when devices change status

function get_info() {
	echo First argument: $1
	echo Second argument: $2
	echo CONNECTION_UUID: $CONNECTION_UUID
	echo CONNECTION_ID: $CONNECTION_ID
	echo CONNECTION_DBUS_PATH: $CONNECTION_DBUS_PATH
	echo CONNECTION_FILENAME: $CONNECTION_FILENAME
	echo CONNECTION_EXTERNAL: $CONNECTION_EXTERNAL
	echo DEVICE_IFACE: $DEVICE_IFACE
	echo DEVICE_IFACE: $DEVICE_IFACE
	echo DEVICE_IP_IFACE: $DEVICE_IP_IFACE
	echo IP4_NUM_ADDRESSES: $IP4_NUM_ADDRESSES
	i=0
	while [[ $i -lt $IP4_NUM_ADDRESSES ]]; do
		echo IP4_ADDRESS_$i: $(eval echo \$IP4_ADDRESS_$i)  
		((i++))
	done
	echo IP4_GATEWAY: $IP4_GATEWAY
	echo IP4_NUM_ROUTES: $IP4_NUM_ROUTES
	i=0
	while [[ $i -lt $IP4_NUM_ROUTES ]]; do
		echo IP4_ROUTE_$i: $(eval echo \$IP4_ROUTE_$i)  
		((i++))
	done
	echo IP4_NAMESERVERS: $IP4_NAMESERVERS
	echo IP4_DOMAINS: $IP4_DOMAINS
	echo
}

date
get_info $1 $2 >> /var/log/NetworkManagerInfo.log

