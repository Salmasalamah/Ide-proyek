import 'package:flutter/material.dart';
import '../models/lapangan_model.dart';

class DetailBookingScreen extends StatelessWidget {
  final Lapangan lapangan;

  const DetailBookingScreen({super.key, required this.lapangan});

  static const Color bg = Color(0xFF0B1220);
  static const Color card = Color(0xFF111827);
  static const Color accent = Color(0xFF818CF8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lapangan.nama,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// ===== GAMBAR BESAR =====
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              lapangan.image,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

          /// ===== INFO =====
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lapangan.nama,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Harga / Jam",
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Rp ${lapangan.harga}",
                  style: const TextStyle(
                    color: accent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// ===== DESKRIPSI =====
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "Lapangan nyaman, bersih, dan terawat. "
              "Cocok untuk latihan maupun turnamen. "
              "Tersedia fasilitas pendukung seperti toilet, "
              "parkir luas, dan ruang tunggu.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 24),

          /// ===== BUTTON BOOKING =====
          SizedBox(
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Booking berhasil (dummy)"),
                  ),
                );
              },
              child: const Text(
                "BOOKING SEKARANG",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
