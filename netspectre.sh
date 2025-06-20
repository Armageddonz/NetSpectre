:#!/data/data/com.termux/files/usr/bin/bash

# =============== KONFIGURASI ===============
API_KEY="AIzaSyCLcQxub0xm5kRK1CKJpbs4jkONZ2qvHKw"
ENDPOINT="https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$API_KEY"
# ===========================================

clear
echo -e "\e[1;36m╔═══════════════════════════════════════╗"
echo -e "║          NetSpectre v0.2              ║"
echo -e "║      AI-Powered Exploit Scanner       ║"
echo -e "╚═══════════════════════════════════════╝\e[0m"

read -p $'\e[1;33mMasukkan IP target (contoh: 8.8.8.8): \e[0m' target_ip
echo -e "\n[\e[1;32m⚡\e[0m] \e[1;32mScanning IP: $target_ip...\e[0m"

# Jalankan pemindaian mendalam yang aman
nmap_output=$(nmap -Pn -sT -sV -sC --top-ports 100 --max-retries 2 --host-timeout 120s -T2 -oN scan_result.txt "$target_ip")

# Tampilkan cuplikan
echo -e "\n📄 \e[1mCuplikan hasil:\e[0m"
echo "$nmap_output" | head -n 20

# Siapkan prompt untuk Gemini
analysis_prompt="Berikut adalah hasil pemindaian Nmap terhadap IP target. Analisis ini bertujuan untuk mengidentifikasi potensi kerentanan dan rekomendasi mitigasi. Formatkan hasilnya agar mudah dibaca di terminal (gunakan tabel markdown jika perlu) dan pisahkan tiap bagian.

### Hasil Nmap:
$nmap_output

### Tugasmu:
1. Identifikasi status host, layanan, dan port yang terdeteksi.
2. Jelaskan potensi masalah atau ancaman (jika ada).
3. Berikan rekomendasi mitigasi umum atau spesifik.
4. Buat tampilannya rapi, terstruktur, dan cocok ditampilkan di terminal."

# Kirim ke Gemini
json_data=$(jq -n \
  --arg prompt "$analysis_prompt" \
  '{contents: [{parts: [{text: $prompt}]}]}')

echo -e "\n🔄 \e[1;36mMengirim ke Gemini untuk analisis...\e[0m"
response=$(curl -s -X POST "$ENDPOINT" \
  -H "Content-Type: application/json" \
  -d "$json_data")

# ==== OUTPUT TERSTRUKTUR ====
echo -e "\n\e[1;36m╔════════════════════════════════════╗"
echo -e "║        🔍 HASIL ANALISIS AI        ║"
echo -e "╚════════════════════════════════════╝\e[0m"

hasil_ai=$(echo "$response" | jq -r '.candidates[0].content.parts[0].text')

# Tampilkan hasil dengan pemisahan rapi
echo "$hasil_ai" | awk '
/Komponen|Target|Status|Port|Kerentanan|Masalah|Rekomendasi/ {
  gsub("\\*",""); 
  if (/Komponen/) {
    print "\n\033[1;34m📊 Ringkasan:\033[0m"
  } 
  if (/Rekomendasi/) {
    print "\n\033[1;33m💡 Rekomendasi Mitigasi:\033[0m"
  }
  if (/Masalah/) {
    print "\n\033[1;31m⚠️ Masalah Teknis:\033[0m"
  }
  if (/Kerentanan/) {
    print "\n\033[1;35m🔓 Potensi Kerentanan:\033[0m"
  }
}
{print $0}
'

echo -e "\n\e[1;32m[✓] Selesai.\e[0m"
