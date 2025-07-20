# ☁️ cloud-ready-installer

**cloud-ready-installer** adalah skrip otomatisasi shell untuk menyiapkan server berbasis Linux agar siap digunakan di lingkungan **cloud** maupun **bare-metal**. Skrip ini melakukan konfigurasi dasar sistem, instalasi aplikasi penting, dan optimasi awal untuk server baru.

## 🔧 Fitur

- Deteksi dan tampilkan informasi sistem (CPU, RAM, OS, IP publik/lokal)
- Sinkronisasi waktu dengan server NTP Indonesia (`id.pool.ntp.org`)
- Set zona waktu ke Asia/Jakarta
- Instalasi paket penting:
  - `htop`, `btop`, `zsh`, `neofetch`
- Tambahkan repository jika belum tersedia
- Konfigurasi SSH agar user root bisa remote login
- Tampilan interaktif: pilihan `y/n` sebelum instalasi dilakukan

## 🖥️ Sistem yang Didukung

- Debian 10 / 11 / 12
- Ubuntu 20.04 / 22.04
- Sistem turunan Debian lainnya

## 🚀 Cara Penggunaan

Jalankan perintah berikut sebagai **root**:

```bash
bash <(curl -sSL https://raw.githubusercontent.com/TEGAR-SRC/cloud-ready-installer/main/install_all.sh)
````

> Pastikan server kamu terhubung ke internet.

## 📂 Struktur File

* `install_all.sh` — File utama yang berisi seluruh proses instalasi dan konfigurasi.

## ✅ Prasyarat

* Akses root (atau via `sudo`)
* Koneksi internet aktif

## ⚠️ Disclaimer

Gunakan skrip ini dengan hati-hati di server produksi. Backup data penting sebelum menjalankan.

