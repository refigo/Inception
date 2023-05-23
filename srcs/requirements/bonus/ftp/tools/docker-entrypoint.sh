# !/bin/sh

# Setting user
adduser $FTP_USER --disabled-password --gecos "" --home /home/$FTP_USER --shell /bin/sh
echo "$FTP_USER:$FTP_PWD" | chpasswd > /dev/null
chown $FTP_USER:$FTP_USER $FTP_DIR
chmod -R 777 $FTP_DIR


# Setting config file

# grep -E "bind 127.0.0.1" /etc/redis/redis.conf > /dev/null 2>&1
# if [ $? -eq 0 ]; then
#   sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis/redis.conf
# fi


sed -i "/anonymous_enable=/c\anonymous_enable=NO" /etc/vsftpd.conf
sed -i "/#local_umask=022/c\local_umask=022" /etc/vsftpd.conf
sed -i "/#write_enable=YES/c\write_enable=YES" /etc/vsftpd.conf
sed -i "/#xferlog_file=\/var\/log\/vsftpd.log/c\xferlog_file=\/var\/log\/vsftpd.log" /etc/vsftpd.conf
# sed -i "s/listen=NO/listen=YES/g" /etc/vsftpd.conf # listen v6이 있음
sed -i "/secure_chroot_dir=\/var\/run\/vsftpd\/empty/c\secure_chroot_dir=\/var\/share\/empty" /etc/vsftpd.conf
sed -i "/connect_from_port_20=YES/c\connect_from_port_20=NO" /etc/vsftpd.conf
# sed -i "s/rsa_cert_file=\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/rsa_cert_file=\/etc\/ssl\/certs\/vsftpd-selfsigned.crt/g" /etc/vsftpd.conf
# sed -i "s/rsa_private_key_file=\/etc\/ssl\/private\/ssl-cert-snakeoil.key/rsa_private_key_file=\/etc\/ssl\/private\/vsftpd-selfsigned.key/g" /etc/vsftpd.conf
# sed -i "/ssl_enable=NO/c\ssl_enable=YES" /etc/vsftpd.conf

# listen=YES
# secure_chroot_dir=/var/share/empty
# /var/run/vsfpd/empty

# sed -i "/#xferlog_file=\/var\/log\/vsftpd.log/c\xferlog_file=\/dev\/stdout" /etc/vsftpd/vsftpd.conf

cat >> /etc/vsftpd.conf << EOF
local_root=$FTP_DIR
seccomp_sandbox=NO

port_enable=YES
ftp_data_port=20
pasv_enable=YES
pasv_min_port=$FTP_PORT_MIN
pasv_max_port=$FTP_PORT_MAX

# dirmessage_enable=YES
# xferlog_enable=YES

# userlist_file=/etc/vsftpd.user_list


# listen_port=21
# port_enable=YES
# ftp_data_port=20
# pasv_enable=YES
# pasv_min_port=$FTP_PORT_MIN
# pasv_max_port=$FTP_PORT_MAX
# allow_anon_ssl=NO
# force_local_data_ssl=YES
# force_local_logins_ssl=YES
# force_anon_data_ssl=NO
# force_anon_logins_ssl=NO
# ssl_tlsv1=YES
# ssl_sslv2=NO
# ssl_sslv3=NO
# require_ssl_reuse=NO
# ssl_ciphers=HIGH
EOF

# echo "local_root=$FTP_DIR" >> /etc/vsftpd.conf

# touch /etc/vsftpd.user_list
# echo $FTP_USER >> /etc/vsftpd.user_list

# vsftpd /etc/vsftpd/vsftpd.conf

mkdir -p /var/share/empty

exec vsftpd /etc/vsftpd.conf



# entrypoint_log "$ME: setting default conf : /etc/vsftpd/vsftpd.conf 🔍 "

# sed -i "/anonymous_enable=/c\anonymous_enable=NO" /etc/vsftpd/vsftpd.conf
# sed -i "/#local_enable=YES/c\local_enable=YES" /etc/vsftpd/vsftpd.conf
# sed -i "/#local_umask=022/c\local_umask=022" /etc/vsftpd/vsftpd.conf
# sed -i "/#write_enable=YES/c\write_enable=YES" /etc/vsftpd/vsftpd.conf
# # sed -i "/#chroot_local_user=YES/c\chroot_local_user=YES" /etc/vsftpd/vsftpd.conf
# sed -i "/#xferlog_file=\/var\/log\/vsftpd.log/c\xferlog_file=\/var\/log\/vsftpd.log" /etc/vsftpd/vsftpd.conf
# # sed -i "/#xferlog_file=\/var\/log\/vsftpd.log/c\xferlog_file=\/dev\/stdout" /etc/vsftpd/vsftpd.conf
# cat >> /etc/vsftpd/vsftpd.conf << EOF
# local_root=$PATH_
# seccomp_sandbox=NO
# listen_port=21
# port_enable=YES
# ftp_data_port=20
# pasv_enable=YES
# pasv_min_port=$FTP_PORT_MIN
# pasv_max_port=$FTP_PORT_MAX
# # ssl_enable=YES
# # rsa_cert_file=/etc/ssl/certs/cert.pem
# # rsa_private_key_file=/etc/ssl/certs/private-key.pem
# # allow_anon_ssl=NO
# # force_local_data_ssl=YES
# # force_local_logins_ssl=YES
# # force_anon_data_ssl=NO
# # force_anon_logins_ssl=NO
# # ssl_tlsv1=YES
# # ssl_sslv2=NO
# # ssl_sslv3=NO
# # require_ssl_reuse=NO
# # ssl_ciphers=HIGH
# EOF

# entrypoint_log "$ME: addgroup  adduser chown chpasswd 🔍 "
# addgroup $FTP_USER
# adduser -G $FTP_USER -D $FTP_USER
# chown $FTP_USER:$FTP_USER $PATH_
# echo $FTP_USER:$FTP_PASSWORD | chpasswd
# chmod -R +x $PATH_
# entrypoint_log "$ME: addgroup  adduser chown chpasswd ✅ "

# sleep 5; # need to order check
# cp /install/vsftpd.conf /etc/vsftpd.conf
# adduser $FTP_USER --disabled-password --gecos "" --home /home/$FTP_USER --shell /bin/sh
# echo "$FTP_USER:$FTP_PWD" | chpasswd > /dev/null
# chgrp -R $FTP_USER $FTP_ROOT_DIR
# chown -R $FTP_USER $FTP_ROOT_DIR
# chmod -R 777 $FTP_ROOT_DIR




# mkdir -p /var/share/empty


