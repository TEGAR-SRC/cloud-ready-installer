# 🌩️ Cloud Ready Installer

Script ini adalah solusi otomatisasi untuk menyiapkan **server pribadi** menjadi **cloud-ready VPS** meskipun **tidak memiliki IP publik**, berkat integrasi **Cloudflare Tunnel**. Cocok untuk penggunaan pribadi, development, ataupun deployment aplikasi secara cepat dan aman.

---

## 📦 Fitur Utama

✅ Instalasi otomatis berbagai tool penting:

* `htop` atau `btop` (tergantung preferensi)
* `zsh` (dengan opsi mengganti shell default)
* `neofetch` (untuk info sistem)
* Sinkronisasi jam & zona waktu (NTP Asia: `time.google.com`, `id.pool.ntp.org`)
* Update & upgrade sistem secara otomatis
* SSH otomatis diatur agar root bisa login via remote
* Deteksi IP Publik dan Lokal
* Instalasi **Cloudflare Tunnel**
* Instalasi **aaPanel** (panel manajemen server berbasis web)
* Cek repository dan tambahkan jika belum ada
* Dukungan Ubuntu/Debian

---

## 💻 Langkah Penggunaan

1. Clone repositori:

```bash
git clone https://github.com/TEGAR-SRC/cloud-ready-installer.git
cd cloud-ready-installer
```

2. Jalankan script:

```bash
chmod +x install_all.sh
sudo ./install_all.sh
```

3. Masukkan token Cloudflare Tunnel setelah script selesai:

```bash
sudo cloudflared service install <TOKEN_CLOUDFLARE_TUNNEL_ANDA>
```

🔑 Contoh format token:

```bash
sudo cloudflared service install eyJhIjoiNmQyNzlkZGE0ZmM2NGVlNTNhMTE1OTNmNDU4NDY3YWMiLCJ0IjoiNjY2NGQwYTEtN2YyNy00YjIyLWI1MjgtZjUyNGVjZTQ3NjJjIiwicyI6Ik5XUmhOMlk0TVdZdE5qazVOeTAwTWpSbExXSTRNR1l0Tm1Zd1pERXlZVFkyxxxxxxxxxxxxx
```

---

## 🌍 Hasil Akhir Setelah Menjalankan Script

* Server siap digunakan tanpa IP Publik
* Akses SSH root sudah diaktifkan
* aapanel dapat diakses melalui domain tunnel kamu
* Sistem dimonitor dengan tools ringan (`htop` atau `btop`)
* Tampilkan info sistem saat login (`neofetch`)
* Server sudah disesuaikan timezone dan disinkronisasi waktu

---

## 🛡️ Syarat & Catatan

* Pastikan kamu memiliki akun Cloudflare dan domain aktif (opsional).
* Harus dijalankan sebagai root (`sudo` atau `login root` langsung).
* Pastikan koneksi internet stabil.
* Cocok untuk penggunaan di VPS lokal, Proxmox, ataupun server rumah tanpa IP Publik.

---

## 📌 Catatan Tambahan

* `aaPanel` akan terinstal otomatis dan bisa diakses via web setelah tunnel aktif.
* Kamu hanya perlu menempel token Cloudflare Tunnel untuk menjadikan server ini live.
* Tidak ada lisensi. Bebas digunakan dan dimodifikasi untuk kebutuhan pribadi.

---

## ✨ Kontribusi

Jika kamu ingin membantu pengembangan lebih lanjut, silakan buat Pull Request atau laporkan issue!
