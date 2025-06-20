<h1 align="center">🛰️ NetSpectre</h1>
<p align="center"><i>AI-Powered Exploit Scanner for Termux</i></p>
<p align="center">
  🔎 Scan deeper. 📡 Analyze smarter. 🤖 Powered by Gemini AI.
</p>

---

## 🚀 Tentang Project

**NetSpectre** adalah sebuah tool jaringan berbasis Termux yang memadukan kekuatan Nmap dan Gemini AI untuk melakukan analisis keamanan jaringan secara **real-time**, **automatis**, dan **terstruktur**.

Dirancang sebagai alat belajar yang futuristik namun ringan, cocok untuk pemula hingga intermediate yang ingin memahami cara kerja eksploitasi dan analisis jaringan modern.

---

## ⚙️ Fitur Utama

- 🔍 Scan 100 port umum (TCP connect mode - tanpa root)
- 📡 Analisis hasil scan dengan AI (Gemini 1.5 Flash)
- 📑 Hasil disajikan dalam format elegan, rapi, dan informatif
- 💡 Rekomendasi mitigasi otomatis
- 🔒 Aman, tanpa eksploitasi berbahaya
- 🖥️ Cocok untuk Termux dan HP Android non-root

---

## 📦 Instalasi

```bash
pkg install git curl nmap jq -y
git clone https://github.com/Armageddonz/NetSpectre.git
cd NetSpectre
chmod +x netspectre.sh
```

---

## 🔐 Cara Dapatkan API Gemini

1. Buka: https://aistudio.google.com/app/apikey
2. Login dengan akun Google kamu
3. Klik **“Create API Key”**
4. Salin API key yang diberikan
5. Masukkan ke dalam script `netspectre.sh`:

```bash
API_KEY="GANTI_DENGAN_API_KAMU"
```

---

## 🧪 Cara Menggunakan

```bash
bash netspectre.sh
```

Lalu masukkan target IP atau domain:
```
Masukkan IP target: 8.8.8.8
```

---

## 📊 Contoh Output Terminal

```
╔════════════════════════════════════╗
║        🔍 HASIL ANALISIS AI        ║
╚════════════════════════════════════╝

📌 Target: 8.8.8.8
📶 Status Host: Online

📊 Ringkasan:
- Port Terbuka: 53 (DNS)
- Versi: dnsmasq 2.75
- Potensi: Port DNS dapat menjadi target serangan DDoS amplification

💡 Rekomendasi Mitigasi:
- Gunakan firewall untuk membatasi akses ke port 53
- Audit konfigurasi DNS
- Monitor trafik yang mencurigakan

✅ Status: Analisis selesai
```

---

## 🛠️ Rencana Fitur Selanjutnya

- Export hasil ke `.md`, `.html`, atau PDF
- Kirim laporan via Telegram bot
- Deteksi CVE berdasarkan fingerprint
- Mode “Passive Recon” (tanpa Nmap)

---

## 📜 Lisensi

MIT License — Bebas digunakan, diubah, dan dikembangkan untuk tujuan pembelajaran.

---

## 🧠 Dibuat oleh

**Lawliet404**  
Pelajar, Penjelajah AI, dan Developer Muda yang ingin menantang batas teknologi 💥
