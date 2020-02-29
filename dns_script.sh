#!/bin/bash

source ./install.sh

PS3='Please enter your choice: '
options=("Add Domain" "Delete Domain" "List Domains" "Quit")
select opt in "${options[@]}"

do
    case $opt in
        "Add Domain")

source ./add_domain.sh
 
  ;;
        "Delete Domain")


source ./delete_domain.sh


            ;;
        "List Domains")
       

source ./list_domains.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

systemctl restart named
