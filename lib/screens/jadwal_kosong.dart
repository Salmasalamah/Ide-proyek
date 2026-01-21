import 'package:flutter/material.dart';

class JadwalKosongScreen extends StatelessWidget {
  const JadwalKosongScreen({super.key});

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
        title: const Text(
          "Jadwal Kosong",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: jadwalDummy.length,
        itemBuilder: (context, index) {
          final item = jadwalDummy[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                /// GAMBAR
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    item['image'] ?? 'assets/futsal.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                /// INFO
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['lapangan'] ?? '-',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${item['hari'] ?? '-'} • ${item['jam'] ?? '-'}",
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                /// STATUS
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Kosong",
                    style: TextStyle(
                      color: accent,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// ===== DUMMY DATABASE (10 DATA) =====
final List<Map<String, String>> jadwalDummy = [
  {
    "lapangan": "Futsal A",
    "hari": "Senin",
    "jam": "08.00 - 09.00",
    "image": "assets/futsal.png",
  },
  {
    "lapangan": "Futsal B",
    "hari": "Senin",
    "jam": "10.00 - 11.00",
    "image": "assets/futsal.png",
  },
  {
    "lapangan": "Basket Indoor",
    "hari": "Selasa",
    "jam": "13.00 - 14.00",
    "image": "assets/basket.png",
  },
  {
    "lapangan": "Badminton 1",
    "hari": "Rabu",
    "jam": "09.00 - 10.00",
    "image": "assets/badminton.png",
  },
  {
    "lapangan": "Badminton 2",
    "hari": "Rabu",
    "jam": "15.00 - 16.00",
    "image": "assets/badminton.png",
  },
  {
    "lapangan": "Futsal A",
    "hari": "Kamis",
    "jam": "19.00 - 20.00",
    "image": "assets/futsal.png",
  },
  {
    "lapangan": "Basket Indoor",
    "hari": "Jumat",
    "jam": "16.00 - 17.00",
    "image": "assets/basket.png",
  },
  {
    "lapangan": "Futsal B",
    "hari": "Sabtu",
    "jam": "08.00 - 09.00",
    "image": "assets/futsal.png",
  },
  {
    "lapangan": "Badminton 1",
    "hari": "Sabtu",
    "jam": "11.00 - 12.00",
    "image": "assets/badminton.png",
  },
  {
    "lapangan": "Basket Indoor",
    "hari": "Minggu",
    "jam": "18.00 - 19.00",
    "image": "assets/basket.png",
  },
];
