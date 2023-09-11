apt-get update
echo "Installing QEMU (2-3m)..."
apt install qemu-kvm -y
read -p "Link win: " CRM
echo Downloading Windows Disk...
wget -O win2012.qcow2 $CRM
echo "Download ngrok"
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xf ngrok.tgz > /dev/null 2>&1
rm -rf ngrok.tgz
wget -O b1.sh https://raw.githubusercontent.com/mollymendis/csp/main/b1.sh
wget -O b2.sh https://raw.githubusercontent.com/mollymendis/csp/main/b2.sh
sudo bash b1.sh
