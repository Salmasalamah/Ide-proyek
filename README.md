📱 Mobile Fasaaa Field
Aplikasi Booking Lapangan Olahraga Berbasis Flutter & Firebase

Mobile Fasaaa Field adalah aplikasi mobile berbasis Flutter yang terintegrasi dengan Firebase untuk mempermudah proses pemesanan lapangan olahraga secara digital. Aplikasi ini memungkinkan pengguna untuk melihat daftar lapangan, melakukan booking, serta mengelola akun pengguna dengan sistem autentikasi yang aman.

Project ini dikembangkan sebagai tugas Ujian Akhir Semester (UAS) Pemrograman Mobile.

🎥 Demo Aplikasi

https://drive.google.com/drive/folders/1NDxWbHmjlHSdguHmvmIlm1UoDhBDHsRl?hl=id


https://github.com/user-attachments/assets/74affa7d-0143-44ae-afa9-f3d4465094ee


🎯 Tujuan Pengembangan

Tujuan dari pengembangan aplikasi ini adalah:

Mengimplementasikan framework Flutter dalam pengembangan aplikasi mobile

Mengintegrasikan Firebase Authentication dan Cloud Database

Membangun sistem booking berbasis mobile

Mengelola data pengguna secara real-time

Menerapkan desain UI/UX yang responsif

Memahami arsitektur aplikasi mobile modern

✨ Fitur Utama

🔐 Login & Register pengguna (Firebase Authentication)

☁️ Penyimpanan data cloud menggunakan Firebase Firestore

🏟️ Menampilkan daftar lapangan olahraga

📅 Pemesanan (booking) lapangan

📜 Riwayat booking pengguna

👤 Manajemen profil akun

🧭 Navigasi antar halaman aplikasi

🛠️ Teknologi yang Digunakan
Teknologi	Keterangan
Flutter	Framework pengembangan aplikasi mobile
Dart	Bahasa pemrograman utama
Firebase Authentication	Sistem login & registrasi
Firebase Firestore	Database cloud real-time
Material UI	Desain antarmuka pengguna
📂 Struktur Project
lib/
 ├── models/        # Model data aplikasi
 ├── screens/       # Tampilan halaman aplikasi
 ├── services/      # Layanan Firebase & logic
 ├── widgets/       # Komponen UI reusable
 ├── main.dart      # Entry point aplikasi
assets/             # Gambar & resource
android/
ios/

🔥 Konfigurasi Firebase

Buat project di Firebase Console

Tambahkan aplikasi Android/iOS

Download file konfigurasi:

google-services.json → android/app/

GoogleService-Info.plist → ios/Runner/

Jalankan:

flutter pub get

🚀 Cara Menjalankan Project
git clone https://github.com/Salmasalamah/UAS-PEMOGRAMAN-MOBILLE2.git
cd mobile_fasaaa_field
flutter pub get
flutter run

📊 Konsep Sistem

Aplikasi menggunakan arsitektur berbasis:

Frontend: Flutter (UI & logic aplikasi)

Backend: Firebase Authentication & Firestore

Database: Cloud Firestore (real-time data storage)

Alur sistem:

Pengguna melakukan login/register

Data pengguna disimpan di Firebase

Pengguna memilih lapangan

Sistem menyimpan data booking

Riwayat booking dapat dilihat kembali

👩‍💻 Developer

Salma Salamah
UAS Pemrograman Mobile
Tahun 2026

⭐ Terima kasih telah melihat project ini!
