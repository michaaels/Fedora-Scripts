#Instalar dependencias Fedora
sudo dnf install -y binutils glibc-devel ksh libnsl sysstat initscripts make xorg-x11-xauth smartmontools

#Oracle el8 centos8

#Instalar xorg-x11-utils
sudo dnf install -y  libX11-xcb libXi libXcomposite libXinerama libXrandr libXtst libXv libXxf86dga libXxf86misc libXxf86vm libdmx
wget https://rpmfind.net/linux/centos/8-stream/AppStream/x86_64/os/Packages/xorg-x11-utils-7.5-28.el8.x86_64.rpm && sudo rpm -i xorg-x11-utils*.rpm

#Instalar compat-openssl10
wget https://rpmfind.net/linux/centos/8-stream/AppStream/x86_64/os/Packages/compat-openssl10-1.0.2o-4.el8.x86_64.rpm && sudo rpm -i compat-openssl10*.rpm

wget https://yum.oracle.com/repo/OracleLinux/OL8/appstream/x86_64/getPackage/oracle-database-preinstall-21c-1.0-1.el8.x86_64.rpm
sudo rpm -i oracle-database-preinstall-21c-1.0-1.el8.x86_64.rpm

wget https://download.oracle.com/otn-pub/otn_software/db-express/oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm
sudo rpm -i oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm
#configurar Oracle https://docs.oracle.com/en/database/oracle/oracle-database/21/xeinl/installing-oracle-database-xe.html#GUID-3F29EE7C-4546-49EE-B894-027EE3E371BF

#Silent
/etc/init.d/oracle-xe-21c configure <<EOF
#yourpass
#yourpass
EOF

sudo systemctl start oracle-xe-21c
sudo systemctl enable oracle-xe-21c
