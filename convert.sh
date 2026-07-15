#!/bin/bash
if [ -z "$1" ]; then
    echo "[ERROR] Silakan jalankan: ./convert.sh nama_file.md"
    exit 1
fi

FILE_PATH="$1"
CONFIG_PATH="$(dirname "$0")/.mdtopdf.json"

echo "Mengonversi \"$FILE_PATH\" ke PDF menggunakan setting landscape..."
npx md-to-pdf "$FILE_PATH" --config-file "$CONFIG_PATH"

if [ $? -eq 0 ]; then
    echo -e "\n[SUKSES] PDF berhasil dibuat!"
else
    echo -e "\n[GAGAL] Terjadi error saat konversi."
fi
