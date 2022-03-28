ver=2021.7-9
url=https://github.com/kisslinux/repo/releases/download/$ver
file=kiss-chroot-$ver.tar.xz

curl -fLO "$url/$file"

cd /mnt
tar xvf "$OLDPWD/$file"

/mnt/bin/kiss-chroot /mnt

cd ~
mkdir repos
cd repos
git clone https://github.com/kisslinux/repo
git clone https://github.com/kisslinux/commutiny

export KISS_PATH=''
KISS_PATH=/root/repos/repo/core
KISS_PATH=$KISS_PATH:/root/repos/repo/extra
KISS_PATH=$KISS_PATH:/root/repos/repo/testing
KISS_PATH=$KISS_PATH:/root/repos/repo/wayland
KISS_PATH=$KISS_PATH:/root/repos/community/community

kiss update
kiss update
cd /var/db/kiss/installed && kiss build *

cd ~ 
git clone https://github.com/zen-kernel/zen-kernel.git
tar xvf zen-kernel
cd linux-*


kiss b ncurses

