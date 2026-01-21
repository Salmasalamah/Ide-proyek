import 'package:flutter/material.dart';

class FutsalScreen extends StatelessWidget {
  const FutsalScreen({super.key});

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
          "Lapangan Futsal",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: futsalDummy.length,
        itemBuilder: (context, index) {
          final item = futsalDummy[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ICON UTAMA (jenis lapangan)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item['icon']!,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 64,
                      height: 64,
                      color: Colors.black26,
                      child:
                          const Icon(Icons.image, color: Colors.white38),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                /// INFO
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['nama']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['desc']!,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 10),

                      /// FITUR ICON
                      Row(
                        children: item['fitur']!
                            .split(',')
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      e,
                                      width: 22,
                                      height: 22,
                                      color: accent,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
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

/// ===== DUMMY DATA FUTSAL (PAKAI ASET KAMU) =====
final List<Map<String, String>> futsalDummy = [
  {
    "nama": "Futsal Indoor Matras",
    "desc": "Lapangan indoor nyaman & empuk",
    "icon": "assets/matras.png",
    "fitur": "assets/multifungsi.png,assets/minisocer.png",
  },
  {
    "nama": "Futsal Sintetis",
    "desc": "Rumput sintetis standar nasional",
    "icon": "assets/sintetis.png",
    "fitur": "assets/minisocer.png,assets/multifungsi.png",
  },
  {
    "nama": "Futsal Semen",
    "desc": "Lapangan keras untuk latihan",
    "icon": "assets/semen.png",
    "fitur": "assets/multifungsi.png",
  },
];
