apt-get update
echo "Install QEMU"
apt install qemu-kvm -y
read -p "Link win: " CRM
echo "Download windows files"
wget -O win2012.qcow2 $CRM
echo "Download ngrok"
wget -O ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz > /dev/null 2>&1
tar -xf ngrok.tgz > /dev/null 2>&1
rm -rf ngrok.tgz
wget -O rsq2.sh https://raw.githubusercontent.com/mollymendis/csp/main/rsq2.sh
