#!/bin/bash

echo "you chose Add Domain"
echo "Enter number of Domains"
read number

for i in $(seq 1 $number)
do

echo "Enter Domain"
read domain


echo "Enter IP"
read ip


if grep -Fxq "#$domain" /etc/named.rfc1912.zones
then
echo "Domain already Exists"
else

echo "$domain" >> DNS.txt
echo "$ip" >> DNS.txt

echo "
#$domain
zone \"$domain\" IN {
        type master;
        file \"$domain\";
        allow-update { none; };
};" >> /etc/named.rfc1912.zones

echo "\$TTL 3H
@       IN SOA  @ rname.invalid. (
                                        0       ; serial
                                        1D      ; refresh
                                        1H      ; retry
                                        1W      ; expire
                                        3H )    ; minimum
        NS      @
        A       127.0.0.1
        AAAA    ::1
www     IN  A   $ip
" > /var/named/$domain
chgrp named /var/named/$domain
fi
done
echo "Added" 
