import 'package:flutter/material.dart';

class BadmintonScreen extends StatelessWidget {
  const BadmintonScreen({super.key});

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
          "Lapangan Badminton",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _BadmintonCard(
            image: "assets/semigor.png",
            title: "Lapangan Semi GOR",
            desc: "Indoor, pencahayaan baik, cocok latihan rutin",
          ),
          _BadmintonCard(
            image: "assets/lapang_dua.png",
            title: "Lapangan 2",
            desc: "Standar nasional, lantai aman & nyaman",
          ),
          _BadmintonCard(
            image: "assets/semen1.png",
            title: "Lapangan Semen",
            desc: "Harga ekonomis, cocok main santai",
          ),
          _BadmintonCard(
            image: "assets/biasa.png",
            title: "Lapangan Biasa",
            desc: "Untuk pemula & latihan ringan",
          ),
          _BadmintonCard(
            image: "assets/outdor.png",
            title: "Lapangan Outdoor",
            desc: "Sirkulasi udara bebas, main sore hari",
          ),
          _BadmintonCard(
            image: "assets/turnamen.png",
            title: "Lapangan Turnamen",
            desc: "Standar lomba, karpet premium",
          ),
          _BadmintonCard(
            image: "assets/nyaman.png",
            title: "Lapangan Nyaman",
            desc: "Anti licin, cocok main lama",
          ),
        ],
      ),
    );
  }
}

class _BadmintonCard extends StatelessWidget {
  final String image;
  final String title;
  final String desc;

  const _BadmintonCard({
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: BadmintonScreen.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
