#!/bin/bash




echo "you choose to Delete a Domain"

echo "Enter Domain name"
read domain

if grep -q "#$domain" /etc/named.rfc1912.zones;then
  
sed -e "/#$domain/,+5d" /etc/named.rfc1912.zones  >> /etc/named.rfc1912_2.zones
mv /etc/named.rfc1912_2.zones /etc/named.rfc1912.zones

rm /var/named/$domain  2> /dev/null




sed -e "/$domain/,+1d" DNS.txt  >> DNS2.txt
mv DNS2.txt DNS.txt

echo "Deleted"
else 
echo "Domain Doesn't Exist"
fi
