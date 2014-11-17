#!/bin/bash

#This script connects your studentenwerk network to the vpn to have internet access

#########################################################
### VPN Linux generic startup script by T. Szczepanek ###
#########################################################

##################################################
### change this to your username and password  ###
##################################################

USERNAME="introduce your studentenwerk username here"
NETPASSWORD="introduce your studentenwerk password here"

# use USERNAME-ip1 for a static IPV6 prefix


### Please use: vpn.sh status || vpn.sh start 
### for checking the connection state in a cronscript and restart if vpn connection is
### not active anymore

### DO NOT CHANGE ANYTHING BELOW THIS LINE

VPN_TARGET_ADDRESS="vpn.stw-bonn.de"
INTERNAL_NET="192.168.0.0/16"
INTERNAL_NETMASK="255.255.0.0"
LOCAL_NETS="192.168.0.0/16"
CALLNAME="studnet"
DEBUG="no" # can be set by executing script with option debug ex. ./vpn.sh start debug

VERSION="V0.17"

### CHANGES
### Change V0.16 to V0.16
# Added IPV6 support
### Change V0.16 to V0.15
# Added refuse-eap, refuse-pap,refuse-chap to non-mppe connections
# Added require-mschap-v2 to mppe connections with newer pppd. mppe without mschap-v2 does not work. stupid mppe pppd patch
# Added debug option as second parameter
# Creating /etc/ppp/peers/$CALLNAME pppd peer file
# Change start mode using now pppd as a caller, not pptp client anymore
# Connection will do self restart after disconnect, maxfail 0, holdoff 30, persist parameters
# Default Route handling through pppd by replacedefaultroute
### Change V0.15 to V0.14
# Added ppp 2.4.5 to list of working mppe connections
### Change V0.14 to V0.13
# replaced 15 seconds delay by loop with 1s sleep time for 30 seconds (thanks to Amin Dahamsha)
# Added return values for vpn.sh status
# This can be used to check the state auf the connection and act accordingly 
# For example in a cron script.
# Usage: vpn.sh status || vpn.sh start
# will start a new vpn connection, if status returns a exit value other than 0
# which means: vpn connection is not active
### Change V0.13 to V0.12
# added ppp 2.4.4 option, which should be identical to 2.4.3 (thanks to Norbert Stuhrmann)
# changes iptables rules to allow IP GRE von every device. Otherwise this is causing trouble on wifi devices (also reported by N. Stuhrmann)
### Change V0.12 to V0.11
# increased sleep duration from 8 to 15 seconds (sql server has much load)
# add debug statement
### Change V0.11 to V0.10
# fixed typo in rm cmd
### Change V0.10 to V0.09
# added more generic pppd version check including ppp 2.4.3
# added check for root permissions
# modified creation of options file
# basic openwrt support. Not completed nor tested
### Change V0.09 to V0.08
# replaced VPN Target by generic target (vpn.stw-bonn.de)
# replaced username by username with realm (@stw-bonn.de)
### Change V0.08 to V0.07a
# added firewall rules for IP-Gre
# fixed bug in redirection
# added SuSE startup INFO lines
### Change V0.07a to V0.07
# removed "require-mschap-v2"
### Change V0.07 to V0.06a
# added support for ppp 2.4.2
### Changes V0.06a to V0.06
# fixed redirect from 2>1 to 2>&1
# fixed mppe detection mppe_ppp to mppe
### Changes V0.06 to V0.05a
# added support for Redhat 9.0 without su -  (PATH)
# added check for mppe (not using mppe, when not avaiable)
# remove additional checks for existence of /sbin/ifconfig, ...
# removed /tmp/chap-secrets as this is obsolete
### Changes V0.05a to V0.05
# added a chmod 600 to /tmp/chap-secrets.new
### Changes V0.05 to V0.04
# forced loading of ip_gre Module
### Changes V0.04 to V0.03
# added recognition for isdn ippp+ devices
### Changes V0.03 to V0.02
# fixed a small bug concerning default route (esp. Suse 8.0)
### Changes V0.02a to V0.02
# fixed a small bug
### Changes V0.02 to V0.01
# minor modification to a echo in status function

### V0.01 initial release

#########################################################
### Please report bugs/problems to tsml@szczepanek.de ###
#########################################################

### BEGIN INIT INFO
# Provides: vpn-studnet
# Required-Start: $network
# X-UnitedLinux-Should-Start:
# Required-Stop: $network
# X-UnitedLinux-Should-Stop:
# Default-Start: 3 5
# Default-Stop: 0 1 2 6
# Description: Start the vpn network connection.
### END INIT INFO

OPTIONS_FILE="/etc/ppp/options.vpn"

echo "VPN Linux generic startup script $VERSION"

### Adding /sbin /usr/sbin and /usr/local/sbin to path for users who
### do not su correctly under Redhat 9.0 

ACTION="$1"

if ! test -z "$2"; then
  if test "$2" == "debug"; then
    DEBUG="yes"
  fi
fi

PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin"

### check whether we are root
WHOAMI=`whoami|grep root`
if test -z "$WHOAMI" ; then
  echo Must be root to execute this script.
  exit 1
fi

### checking existence of route
ROUTE=`which route`
if test -z $ROUTE ; then
  echo Cannot find program route. Bailing out
  exit 1
fi 

### checking existence of pptp
PPTP_BIN=`which pptp`
if test -z "$PPTP_BIN"; then
  echo Cannot find pptp VPN client program. Please install pptp!
  exit 1
fi

### check whether to use modprobe or insmod (embedded)
MODTOOL=`which modprobe`
if test -z "$MODTOOL"; then
  MODTOOL=`which insmod`
  if test -z $MODTOOL; then
        echo "Could not find modprobe or insmod"
        exit 1
  fi
fi

### checking existence of ppp
PPP_BIN=`which pppd`
if test -z $PPP_BIN; then
  echo Cannot find pppd. Please install ppp!
  exit 1
fi

### Try to load ppp_mppe module
$MODTOOL -q ppp_mppe 2>&1 > /dev/null
# Added for Mandrake linux and possible others
$MODTOOL -q mppe 2>&1 > /dev/null
# Added for OpenWrt
$MODTOOL -q arc4 2>&1 > /dev/null
$MODTOOL -q ppp_mppe_mppc 2>&1 > /dev/null

### Check whether mppe is loaded
MPPE_CHECK=`lsmod |awk ' { print $1}'|grep mppe`
PPP_VERSION=`$PPP_BIN --version 2>&1 |awk ' { print $3}'|cut -d- -f1`

echo "Found pppd version $PPP_VERSION"

### First of all add generic options to ppp options file
cat > $OPTIONS_FILE << EOF
### VPN
name $USERNAME
remotename $USERNAME
lock
noauth
nodeflate
nobsdcomp
debug
mtu 1490
mru 1490
lcp-echo-failure 5
lcp-echo-interval 120
idle 86400
defaultroute
replacedefaultroute
holdoff 30
maxfail 0
refuse-eap
refuse-pap
refuse-chap
+ipv6
EOF

### Check for MPPE kernel module
if test -z $MPPE_CHECK; then
  echo "Found no MPPE support in kernel. Not using encryption."
else
  case "$PPP_VERSION" in
    2.4.0|2.4.1)
      cat >> $OPTIONS_FILE << EOF
### Encryption settings
mppe-40
mppe-128
mppe-stateless
EOF
    ;;
    2.4.2)
      cat >> $OPTIONS_FILE << EOF
### Encryption settings
require-mppe
EOF
    ;;
    2.4.3|2.4.4|2.4.5)
      cat >> $OPTIONS_FILE << EOF      
### Encryption settings
require-mppe-40
require-mppe-128
nomppe-stateful
EOF
    ;;
    *)
      echo Unknown pppd version $PPP_VERSION. Not using encryption!
    ;;
  esac
fi

cp $OPTIONS_FILE /etc/ppp/peers/$CALLNAME

echo "### PPTP call through pppd" >> /etc/ppp/peers/$CALLNAME
echo -n 'pty "pptp ' >> /etc/ppp/peers/$CALLNAME
echo -n $VPN_TARGET_ADDRESS >> /etc/ppp/peers/$CALLNAME
echo -n ' --nolaunchpppd"' >> /etc/ppp/peers/$CALLNAME

case "$ACTION" in
  start)
    $MODTOOL ip_gre 2>&1 > /dev/null
    VPN_STATUS=`$0 status|grep "Cannot find any"`
    if test -z "$VPN_STATUS" ; then
      echo There is already a VPN connection running
      exit 1
    fi

    ### Creating chap-secrets file with correct permissions
    touch /tmp/chap-secrets.new
    chmod 600 /tmp/chap-secrets.new
    cat /etc/ppp/chap-secrets |grep -v "$USERNAME " > /tmp/chap-secrets.new
    echo "$USERNAME * $NETPASSWORD *" >> /tmp/chap-secrets.new
    cp /tmp/chap-secrets.new /etc/ppp/chap-secrets
    chmod 600 /etc/ppp/chap-secrets
    rm -f /tmp/chap-secrets.new

    ### getting gateway and nameservers
    GATEWAY=`${ROUTE} -n |grep UG|tail -1|awk ' { print $2}'`
    
    if test -z "$GATEWAY" ; then
      echo Cannot find any default gateway!
      exit 1
    fi 

    echo Found Gateway $GATEWAY

    echo $GATEWAY > /etc/ppp/vpn-gateway.backup

    NAMESERVERS=`cat /etc/resolv.conf|grep nameserver|sed "s/nameserver //g"|grep -v "#"`
    echo Found nameservers: $NAMESERVERS
    if test -z "$NAMESERVERS" ; then
      echo Cannot find any nameservers in /etc/resolv.conf
      echo Please make sure that /etc/resolv.conf is set up correctly
      exit 1
    fi

    ### set routing tables if they do not exist right now

    INTERNAL_NET_ROUTE=`${ROUTE} -n|grep $INTERNAL_NET|grep $GATEWAY|grep $INTERNAL_NETMASK`
    if test -z "$INTERNAL_NET_ROUTE" ; then
      for i in $LOCAL_NETS; do
        ${ROUTE} add -net $i gw $GATEWAY
      done
    fi

    for NAMESERVER in $NAMESERVERS; do
      NAMESERVER_ROUTE=`${ROUTE} -n|grep $NAMESERVER|grep UGH|grep $GATEWAY`
      if test -z "$NAMESERVER_ROUTE" ; then
        ${ROUTE} add -host $NAMESERVER gw $GATEWAY
      fi
    done

    IPTABLES=`which iptables`
    if test -z "$IPTABLES"; then
      echo "Cannot find iptables userland utility. Not applying filter rules"
    else 
      echo "Applying changes to firewall rulesets (allow IP protocol 47 GRE)"
      $IPTABLES -I INPUT -p 47 -j ACCEPT
      $IPTABLES -I OUTPUT -p 47 -j ACCEPT
    fi

    echo -n "Starting pptp connection to VPN StudNet gateway "
    if test "$DEBUG" == "yes" ; then
      # old start variant, disabled
      #${PPTP_BIN} $VPN_TARGET_ADDRESS nodetach file $OPTIONS_FILE &
      ${PPP_BIN} call $CALLNAME nodetach &
    else
      # old start variant disabled
      #${PPTP_BIN} $VPN_TARGET_ADDRESS file $OPTIONS_FILE &
      ${PPP_BIN} call $CALLNAME &
    fi
    for ((i = 0 ; i< 30;i++)); do
      sleep 1
      echo -n "."
      PPP_DEVICE=`ifconfig|grep -v ippp0|grep ppp|awk ' { print $1}'`

      if ! test -z "$PPP_DEVICE" ; then
        echo " connection established"
        break
      fi
    done

    if test -z "$PPP_DEVICE" ; then
      echo ""
      echo Could not start pptp connection to vpn server
      echo Please run ./vpn.sh start debug to obtain logging output
      exit 1
    fi
    ### Removed due to replacedefaultroute handling
    ### set default route to VPN connection
    #${ROUTE} del default
    #${ROUTE} add default dev $PPP_DEVICE

  ;;
  stop)
    if test -f /etc/ppp/vpn-gateway.backup ; then
      GATEWAY=`cat /etc/ppp/vpn-gateway.backup`
    fi
    GATEWAY_VIA_ROUTE=`${ROUTE} -n |grep UG|tail -1|awk ' { print $2}'`

    ### Removed due to replacedefaultroute handling
#    if test "$GATEWAY" != "$GATEWAY_VIA_ROUTE" ; then
#      echo Warning: found two different gateways!!!
#      if test -z "$GATEWAY" ; then
#        ${ROUTE} del default
#        ${ROUTE} add default gw $GATEWAY_VIA_ROUTE
#      fi
#      if test -z "$GATEWAY_VIA_ROUTE" ; then
#        ${ROUTE} del default
#        ${ROUTE} add default gw $GATEWAY
#      fi
#    else
#      if ! test -z "$GATEWAY" ; then
#        ${ROUTE} del default
#        ${ROUTE} add default gw $GATEWAY
#      fi
#    fi
    rm -f /etc/ppp/vpn-gateway.backup  

    PPPD_PID=`ps auxww|grep pppd |grep "call $CALLNAME"|grep -v grep|awk ' { print $2}'`
    if test -z $PPPD_PID ; then
       echo Cannot find any running VPN connection to terminate
       exit 0
    else
       for i in $PPPD_PID ; do
         kill $i
       done
       sleep 2
       echo "VPN connection(s) closed"
    fi

    IPTABLES=`which iptables`
    if test -z "$IPTABLES"; then
      echo "Cannot find iptables userland utility. Not removing filter rules"
    else
      echo "Applying changes to firewall rulesets (remove startup rule)"
      $IPTABLES -D INPUT -p 47 -j ACCEPT
      $IPTABLES -D OUTPUT -p 47 -j ACCEPT
    fi

  ;;
  status)
    PPPD_PID=`ps auxww|grep pppd |grep "call $CALLNAME"|grep -v grep|awk ' {print $2}'`
 
    if test -z $PPPD_PID ; then
       echo "Cannot find any VPN connection(s) started by this startup script"
       exit 1
    else
       echo "VPN connection seems to be running"
       exit 0
    fi
 
  ;;
  restart)
   $0 stop && $0 start
  ;;
  *)
  echo "Usage: $0 {start|stop|restart|status}"
  exit 1
  ;;
esac
