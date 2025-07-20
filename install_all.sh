#!/bin/bash

echo "==============================="
echo " Auto Setup Script - sc by tegar aja"
echo "==============================="

read -p "Lanjutkan installasi? (Y/n): " confirm
confirm=${confirm,,}  # lowercase
if [[ "$confirm" != "y" && "$confirm" != "" ]]; then
    echo "Installasi dibatalkan."
    exit 1
fi

echo "[+] Menampilkan informasi sistem..."
apt update -y &> /dev/null
apt install -y curl wget net-tools lsb-release neofetch &> /dev/null

clear
neofetch

echo "[+] IP Publik:"
curl -s https://ipinfo.io/ip
echo

echo "[+] Timezone & Waktu dari NTP Indonesia:"
apt install -y ntpdate &> /dev/null
ntpdate -q 0.id.pool.ntp.org | grep -oP '\d{2}:\d{2}:\d{2}' | head -n1
timedatectl

# Install basic packages
echo "[+] Menginstall tools dasar (wget, curl, git, sudo)..."
apt install -y wget curl git sudo

# Install Node.js v22
echo "[+] Menginstall Node.js v22..."
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
apt install -y nodejs

# Install Python3 & pip
echo "[+] Menginstall Python dan dependensinya..."
apt install -y python3 python3-pip

# Install Docker
echo "[+] Menginstall Docker..."
apt install -y ca-certificates gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release && echo "$ID")/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$(. /etc/os-release && echo "$ID") \
  $(lsb_release -cs) stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl enable docker
systemctl start docker

# Install GD and tools
echo "[+] Menginstall libgd..."
apt install -y libgd-dev

# Install Cloudflare daemon (cloudflared)
echo "[+] Menginstall Cloudflared..."
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | sudo tee /etc/apt/sources.list.d/cloudflared.list
apt update && apt install -y cloudflared

# Install aaPanel
echo "[+] Menginstall aaPanel..."
URL=https://www.aapanel.com/script/install_7.0_en.sh && \
if [ -f /usr/bin/curl ]; then 
    curl -ksSO "$URL"
else 
    wget --no-check-certificate -O install_7.0_en.sh "$URL"
fi
bash install_7.0_en.sh aapanel

# Install Zsh
echo "[+] Menginstall ZSH..."
apt install -y zsh
chsh -s $(which zsh)

# Install Htop atau Btop
read -p "Pilih monitor sistem: [1] htop, [2] btop (default: htop): " monitor
if [[ "$monitor" == "2" ]]; then
    echo "[+] Menginstall Btop..."
    add-apt-repository -y ppa:arcticicestudio/btop
    apt update && apt install -y btop
else
    echo "[+] Menginstall Htop..."
    apt install -y htop
fi

# Konfigurasi SSH agar root bisa login
echo "[+] Mengaktifkan remote SSH untuk root..."
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

echo ""
echo "==============================="
echo "✅ Semua proses selesai!"
echo "📌 sc by tegar aja"
echo "==============================="
