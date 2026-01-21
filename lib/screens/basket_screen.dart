import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  static const Color bg = Color(0xFF0B1220);
  static const Color card = Color(0xFF111827);

  final List<Map<String, String>> basketList = const [
    {
      "title": "Basket Standar",
      "image": "assets/standar.png",
      "desc": "Lapangan basket standar untuk latihan dan permainan santai."
    },
    {
      "title": "Basket VIP",
      "image": "assets/vip.png",
      "desc": "Lapangan basket eksklusif dengan fasilitas premium."
    },
    {
      "title": "Basket Semen",
      "image": "assets/semen_basket.png",
      "desc": "Lapangan basket outdoor dengan lantai semen kuat dan tahan lama."
    },
    {
      "title": "Basket Multifungsi",
      "image": "assets/multifungsi.png",
      "desc": "Lapangan basket yang bisa digunakan untuk berbagai kegiatan olahraga."
    },
    {
      "title": "Basket Indoor",
      "image": "assets/indoor.png",
      "desc": "Lapangan basket indoor nyaman dengan pencahayaan maksimal."
    },
    {
      "title": "Basket Outdoor",
      "image": "assets/outdoor.png",
      "desc": "Lapangan basket outdoor dengan sirkulasi udara terbuka."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: const Text(
          "Lapangan Basket",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: basketList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (context, index) {
          final item = basketList[index];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              // NANTI SAMBUNG KE DETAIL / BOOKING
            },
            child: Container(
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// IMAGE
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      item["image"]!,
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item["desc"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
