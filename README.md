# Aplikasi Pencatat Pengeluaran

Aplikasi pencatat pengeluaran yang modern dan mudah digunakan, dibangun dengan Flutter. Aplikasi ini membantu Anda melacak pengeluaran harian dengan fitur visualisasi data yang informatif.
(README.md ini di prompt dengan AI untuk memperbagus tampilan penulisan)
Youtube:

Tugas 1:
menggunakan Sqflite untuk database, tetapi menyesuaikan dengan laptop saya yang kentang yang jalankannya pakai chrome, jadi pakai `sqflite_ffi_web` agar bisa berjalan normal

## Fitur Utama

### 1. Manajemen Pengeluaran
- 📝 Tambah pengeluaran baru dengan detail lengkap
- ✏️ Edit pengeluaran yang sudah ada
- 🗑️ Hapus pengeluaran dengan konfirmasi
- 📅 Pilih tanggal pengeluaran
- 🏷️ Kategorisasi pengeluaran

### 2. Kategori Pengeluaran
- 🍽️ Makanan
- 🚗 Transportasi
- 🛍️ Belanja
- 🎮 Hiburan
- 📚 Pendidikan
- 💊 Kesehatan
- 📌 Lainnya

### 3. Visualisasi Data
- 📊 Grafik garis untuk tren pengeluaran harian
- 🥧 Grafik donat untuk distribusi pengeluaran per kategori
- 📈 Ringkasan total pengeluaran
- 📅 Ringkasan pengeluaran bulan ini

### 4. UI/UX Modern
- 🎨 Desain Material 3
- 🎯 Tampilan responsif
- 🎭 Animasi yang halus
- 🎨 Warna yang berbeda untuk setiap kategori
- 📱 Tampilan yang intuitif

## Cara Instalasi

### Persyaratan
- Flutter SDK (versi terbaru)
- Dart SDK (versi terbaru)
- Android Studio / VS Code dengan ekstensi Flutter
- Emulator Android / iOS atau perangkat fisik

### Langkah Instalasi

1. Clone repository ini:
```bash
git clone https://github.com/username/aplikasi_pengeluaran.git
cd aplikasi_pengeluaran
```

2. Instal dependensi:
```bash
flutter pub get
```

3. Jalankan aplikasi:
```bash
flutter run
```

## Struktur Proyek

```
lib/
├── main.dart              # Entry point aplikasi
├── models/
│   └── expense.dart       # Model data pengeluaran
├── screens/
│   └── home_page.dart     # Halaman utama aplikasi
└── widgets/
    ├── expense_card.dart      # Widget kartu pengeluaran
    ├── expense_chart.dart     # Widget grafik garis
    ├── expense_pie_chart.dart # Widget grafik donat
    └── expense_summary.dart   # Widget ringkasan pengeluaran
```

## Teknologi yang Digunakan

- Flutter
- Dart
- fl_chart (untuk visualisasi data)
- intl (untuk format tanggal dan mata uang)
- uuid (untuk generate ID unik)

## Screenshot Aplikasi

[Tambahkan screenshot aplikasi di sini]

![Image](https://github.com/user-attachments/assets/63c71fb7-5857-4214-a95f-6284cc7d1e90)

![Image](https://github.com/user-attachments/assets/3f1c99cf-b944-4823-b933-68b2766f08e8)

![Image](https://github.com/user-attachments/assets/b1910fce-e6a1-465c-bc12-4f1e7925564f)

![Image](https://github.com/user-attachments/assets/9641ffc3-a9fb-4f61-8510-588e2c7c1fee)

![Image](https://github.com/user-attachments/assets/cd2aa568-470d-4a54-8ade-ac66dfad9487)