#!/bin/bash

adduser $FTP_USER --disabled-password --gecos "" --home /home/$FTP_USER --shell /bin/sh
echo "$FTP_USER:$FTP_PWD" | chpasswd > /dev/null
chown $FTP_USER:$FTP_USER $FTP_DIR
chmod -R 777 $FTP_DIR

sed -i "/anonymous_enable=/c\anonymous_enable=NO" /etc/vsftpd.conf
sed -i "/#local_umask=022/c\local_umask=022" /etc/vsftpd.conf
sed -i "/#write_enable=YES/c\write_enable=YES" /etc/vsftpd.conf
sed -i "/#xferlog_file=\/var\/log\/vsftpd.log/c\xferlog_file=\/var\/log\/vsftpd.log" /etc/vsftpd.conf
sed -i "/secure_chroot_dir=\/var\/run\/vsftpd\/empty/c\secure_chroot_dir=\/var\/share\/empty" /etc/vsftpd.conf
sed -i "/connect_from_port_20=YES/c\connect_from_port_20=NO" /etc/vsftpd.conf

cat >> /etc/vsftpd.conf << EOF
local_root=$FTP_DIR
seccomp_sandbox=NO
port_enable=YES
ftp_data_port=20
pasv_enable=YES
pasv_min_port=$FTP_PORT_MIN
pasv_max_port=$FTP_PORT_MAX
EOF

mkdir -p /var/share/empty

exec vsftpd /etc/vsftpd.conf
