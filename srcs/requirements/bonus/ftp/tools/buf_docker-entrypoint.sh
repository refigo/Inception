# !/bin/sh

sleep 5; # need to order check
cp /install/vsftpd.conf /etc/vsftpd.conf
adduser $FTP_USER --disabled-password --gecos "" --home /home/$FTP_USER --shell /bin/sh
echo "$FTP_USER:$FTP_PWD" | chpasswd > /dev/null
echo "local_root=$FTP_ROOT_DIR" >> /etc/vsftpd.conf

chgrp -R $FTP_USER $FTP_ROOT_DIR
chown -R $FTP_USER $FTP_ROOT_DIR
chmod -R 777 $FTP_ROOT_DIR

touch /etc/vsftpd.user_list
echo $FTP_USER >> /etc/vsftpd.user_list
mkdir -p /var/share/empty

vsftpd /etc/vsftpd.conf
