
function SetupDisk() { if ls "/root/vdisk$1" ; then echo "/dev/vdisk$1のディスクは研修用に準備済みです"; else dd if=/dev/zero of=/root/vdisk$1 bs=1024 count=300000; echo "/root/vdisk$1を再構築しました"; fi; }
echo 'function SetupDisk() { if ls "/root/vdisk$1" ; then echo "/dev/vdisk$1のディスクは研修用に準備済みです"; else dd if=/dev/zero of=/root/vdisk$1 bs=1024 count=300000; echo "/root/vdisk$1を再構築しました"; fi; }' >> /root/.bashrc

kill `cat /var/run/yum.pid`
wait 5

useradd lpic
passwd lpic --stdin << E
ngn-sf
ngn-sf
E
yum -y install xclock
yum -y install git
yum -y install gcc
wget -O gtypist-2.9.tar.gz https://github.com/dummyotsuka/ver10_101setup/blob/master/gtypist-2.9.tar.gz?raw=true
wget -O cowsay-3.04-4.el7.noarch.rpm https://github.com/dummyotsuka/ver10_101setup/blob/master/cowsay-3.04-4.el7.noarch.rpm?raw=true
yum -y install zlib-devel
yum -y install ncurses-devel
yum -y install dump
rm -f /etc/systemd/system/default.target
ln -s /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
yum -y install mkisofs

SetupDisk 0
SetupDisk 1


yum -y groupinstall "GNOME Desktop"

yum -y install epel-release
yum -y install xrdp
yum -y install tigervnc-server
systemctl enable xrdp
systemctl enable xrdp
systemctl start xrdp

systemctl set-default graphical.target
systemctl disable firewalld
echo "export LANG=ja_JP.UTF-8" >> /etc/bashrc
echo "export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin" >> /etc/bashrc

shutdown -h now
