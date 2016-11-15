#!/bin/bash

# Apply default Opencast Nexus configuration
if [ ! -f /var/lib/nexus-oss/conf/nexus.xml ]
then
	mkdir -p /var/lib/nexus-oss/conf/
	cp /nexus.xml /var/lib/nexus-oss/conf/nexus.xml
fi

# Show login information on first start
if [ ! -f /var/lib/nexus-oss/conf/security.xml ]
then
	echo "  |"
	echo "  | Log-in at http://$(hostname -I | awk '{print $1}'):8081/nexus"
	echo "  | Initial credentials: admin / admin123"
	echo "  |"
fi

/usr/share/nexus-oss/bin/jsw/linux-x86-64/wrapper /etc/nexus-oss/wrapper/wrapper.conf wrapper.syslog.ident=nexus
