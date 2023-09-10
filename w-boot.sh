apt-get update
echo "Installing QEMU (2-3m)..."
apt install qemu-kvm -y
read -p "Link win: " CRM
echo Downloading Windows Disk...
wget -O win2012.iso $CRM
echo "Download bios64"
wget -O bios64.bin https://github.com/mollymendis/csp/raw/main/bios64.bin
echo "Create win2012.img"
qemu-img create -f raw win2012.img
qemu-img create -f raw win2012.img 20G
echo "Download ngrok"
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xf ngrok.tgz > /dev/null 2>&1
rm -rf ngrok.tgz
wget -O rs.sh https://raw.githubusercontent.com/mollymendis/csp/main/rs.sh
