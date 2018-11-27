#!/bin/bash

# Public IP address of your ingress controller
IP="52.191.184.182"

# Name to associate with public IP address
DNSNAME="dev-aks-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)
echo $PUBLICIPID
# Update public ip address with DNS name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME