# Aplikasi Pencatat Pengeluaran

Aplikasi pencatat pengeluaran yang modern dan mudah digunakan, dibangun dengan Flutter. Aplikasi ini membantu Anda melacak pengeluaran harian dengan fitur visualisasi data yang informatif.
(README.md ini di prompt dengan AI untuk memperbagus tampilan penulisan)
Youtube:

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

## Kontribusi

Silakan berkontribusi dengan membuat pull request atau melaporkan issues.

## Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE).

## Screenshot Aplikasi

[Tambahkan screenshot aplikasi di sini]

## Kontak

Jika ada pertanyaan atau saran, silakan hubungi:
- Email: [email@example.com]
- GitHub: [username]
