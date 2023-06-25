#!/bin/bash
#|---/ /+--------------------------+---/ /|#
#|--/ /-| Main installation script |--/ /-|#
#|-/ /--| Prasanth Rangan          |-/ /--|#
#|/ /---+--------------------------+/ /---|#


#--------------------------------#
# import variables and functions #
#--------------------------------#
source global_fn.sh
if [ $? -ne 0 ] ; then
    echo "Error: unable to source global_fn.sh, please execute from $(dirname $(realpath $0))..."
    exit 1
fi


#----------------------#
# prepare package list #
#----------------------#
#cp custom_hypr.lst install_pkg.lst

#if [ -f "$1" ] && [ ! -z "$1" ] ; then
#    cat $1 >> install_pkg.lst
#fi


#--------------------------------#
# install packages from the list #
#--------------------------------#
./install_pkg.sh install_pkg.lst
#./install_pkg.sh custom_app.lst
#./install_fpk.sh


#---------------------------#
# restore my custom configs #
#---------------------------#
./restore_fnt.sh
./restore_cfg.sh
./restore_sgz.sh
#./restore_app.sh


#------------------------#
# enable system services #
#------------------------#
service_ctl NetworkManager
service_ctl bluetooth
service_ctl sddm