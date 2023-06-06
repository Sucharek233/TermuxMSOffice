printf "\033[92mUpdating repositories...\n\033[0m"
apt update

printf "\033[92m\nUpdating system...\n\033[0m"
apt upgrade -y

printf "\033[92m\nInstalling required packages...\n\033[0m"
apt install proot proot-distro wget -y

printf "\033[92m\nInstalling Ubuntu...\n\033[0m"
proot-distro install --override-alias office2007 ubuntu

printf "\033[92m\nDownloading files...\n\033[0m"
printf "\033[33m\nDownloading box86...\n\033[0m"
curl "https://dl.dropboxusercontent.com/s/arftb8ije5c41vb/box86" --output box86

printf "\033[33m\nDownloading Wine (version 8.0.1)...\n\033[0m"
curl -O -J -L "https://github.com/Kron4ek/Wine-Builds/releases/download/8.0.1/wine-8.0.1-x86.tar.xz"
mv wine-8.0.1-x86.tar.xz wine.tar.xz

printf "\033[33m\nDownloading Microsoft Office 2007 Setup...\n\033[0m"
curl "https://dl.dropboxusercontent.com/s/b7rr1ss7w6gwged/office2007.tgz" --output office2007.tgz

printf "\033[33m\nDownloading Wine base drive...\n\033[0m"
curl "https://dl.dropboxusercontent.com/s/pebk0amy7ukeop2/basedrive.tgz" --output basedrive.tgz

printf "\033[33m\nDownloading misc files...\n\033[0m"
curl "https://dl.dropboxusercontent.com/s/sb9ekwr68r1hobb/misc.tgz" --output misc.tgz
printf "\033[92m\nDownloading files finished\n\033[0m"

printf "\033[92m\nExtracting files...\n\033[0m"
printf "\033[33m\nExtracting Wine...\n\033[0m"
tar xvf wine.tar.xz
rm wine.tar.xz
mv wine-8.0.1-x86 wine

printf "\033[33m\nExtracting Microsoft Office 2007 Setup...\n\033[0m"
tar xvf office2007.tgz
rm office2007.tgz

printf "\033[33m\nExtracting Wine base drive...\n\033[0m"
tar xvf basedrive.tgz
rm basedrive.tgz

printf "\033[33m\nExtracting misc files...\n\033[0m"
tar xvf misc.tgz
rm misc.tgz
printf "\033[92m\nExtracting files finished\n\033[0m"

printf "\033[92m\nCopying files to proot distro...\n\033[0m"
mkdir -p /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/office2007/root/files
printf "\033[33mCopying box86...\n\033[0m"
cp box86 /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/office2007/root/files/box86

printf "\033[33mCopying Wine...\n\033[0m"
cp -r wine /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/office2007/root/files/wine

printf "\033[33mCopying Microsoft Office 2007 Setup...\n\033[0m"
cp -r office2007setup /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/office2007/root/files/office2007setup

printf "\033[33mCopying Wine base drive...\n\033[0m"
cp -r base /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/office2007/root/.wine

printf "\033[33mCopying misc files...\n\033[0m"
cp -r misc /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/office2007/root/files/misc
printf "\033[92mCopying files fininshed\n\033[0m"

printf "\033[33m\nDownloading 2nd script...\n\033[0m"
curl "https://dl.dropboxusercontent.com/s/wbu0wng0ez11i4o/2ndscript.sh" --output script.sh-
dos2unix -n script.sh- script.sh
rm script.sh-

printf "\033[33mCopying 2nd script...\n\033[0m"
cp script.sh /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/office2007/root/script.sh
chmod +x /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/office2007/root/script.sh
printf "\033[92mFinished\n\033[0m"

printf "\033[92m\nStarting proot distro...\n\033[0m"
proot-distro login office2007 -- "/root/script.sh"

printf "\033[92m\n\nInstallation finished!\n\033[0m"
printf "\033[92m\nYou can log into proot distro with this command:\n\033[0m"
printf "\033[36mproot-distro login office2007\n\033[0m"
printf "\033[92m\nEnjoy Microsoft Office 2007 on your device!\n\033[0m"
