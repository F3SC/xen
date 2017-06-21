#!/bin/bash
## Enable NFS XenServer
#client and Server:

modprobe nfsd
#/etc/hosts.allow
ALL:ALL

#/etc/sysconfig/portmap
#PMAP_ARGS=-l
PMAP_ARGS=""

service iptables stop
service portmap start
service nfs start
chkconfig portmap on
chkconfig nfs on


#Autostart on Boot!
echo '#!/bin/sh' > /etc/sysconfig/modules/nfsd.modules
echo 'exec /sbin/modprobe nfsd > /dev/null 2>&1' >> /etc/sysconfig/modules/nfsd.modules
chmod +x /etc/sysconfig/modules/nfsd.modules

service portmap restart
service nfs restart
