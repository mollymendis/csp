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
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
clear
echo "choose ngrok region (for better connection)."
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
read -p "choose ngrok region: " RG
./ngrok tcp --region $RG 5900 &>/dev/null &
sleep 1
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then echo OK; else echo "Ngrok Error! Please try again!" && sleep 1 && goto ngrok; fi
clear
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
sleep 43200


