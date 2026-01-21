import 'package:flutter/material.dart';
import 'booking_screen.dart'; 
import 'riwayat_screen.dart'; // Pastikan nanti kamu buat file ini untuk fitur Lihat/Edit/Hapus

class LapanganScreen extends StatelessWidget {
  const LapanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataFutsal = [
      {"nama": "Futsal Minisoccer", "foto": "assets/minisocer.png", "harga": "150.000"},
      {"nama": "Futsal Matras", "foto": "assets/matras.png", "harga": "120.000"},
      {"nama": "Futsal Sintetis", "foto": "assets/sintetis.png", "harga": "130.000"},
      {"nama": "Futsal Semen", "foto": "assets/semen.png", "harga": "100.000"},
      {"nama": "Futsal Multifungsi", "foto": "assets/multifungsi.png", "harga": "110.000"},
    ];

    final List<Map<String, String>> dataBasket = [
      {"nama": "Basket Standar", "foto": "assets/standar.png", "harga": "140.000"},
      {"nama": "Basket VIP", "foto": "assets/vip.png", "harga": "200.000"},
      {"nama": "Basket Semen", "foto": "assets/semen_basket.png", "harga": "90.000"},
      {"nama": "Basket Multifungsi", "foto": "assets/multifungsi2.png", "harga": "110.000"},
      {"nama": "Basket Indoor Kayu", "foto": "assets/indoor_kayu.png", "harga": "160.000"},
      {"nama": "Basket Outdoor", "foto": "assets/outdoor.png", "harga": "80.000"},
    ];

    // SUDAH DISESUAIKAN ADA 7 DATA BADMINTON
    final List<Map<String, String>> dataBadminton = [
      {"nama": "Badminton Semi GOR", "foto": "assets/semigor.png", "harga": "50.000"},
      {"nama": "Badminton Lapang Dua", "foto": "assets/lapang_dua.png", "harga": "45.000"},
      {"nama": "Badminton Semen", "foto": "assets/semen1.png", "harga": "30.000"},
      {"nama": "Badminton Biasa", "foto": "assets/biasa.png", "harga": "35.000"},
      {"nama": "Badminton Outdoor", "foto": "assets/outdor.png", "harga": "25.000"},
      {"nama": "Badminton Turnamen", "foto": "assets/turnamen.png", "harga": "60.000"},
      {"nama": "Badminton Nyaman", "foto": "assets/nyaman.png", "harga": "55.000"},
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF020617),
        appBar: AppBar(
          title: const Text("Pilih Lapangan", 
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18)),
          backgroundColor: const Color(0xFF020617),
          elevation: 0,
          centerTitle: true,
          // TOMBOL MENUJU RIWAYAT (CRUD)
          actions: [
            IconButton(
              icon: const Icon(Icons.history, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RiwayatScreen()));
              },
            )
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFF2563EB),
            labelColor: Color(0xFF2563EB),
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: "Futsal"),
              Tab(text: "Basket"),
              Tab(text: "Badminton"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGrid(context, dataFutsal),
            _buildGrid(context, dataBasket),
            _buildGrid(context, dataBadminton),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, List<Map<String, String>> data) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.0, // TETAP KOTAK
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return InkWell(
          onTap: () {
            int hargaInt = int.parse(item['harga']!.replaceAll('.', ''));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingScreen(
                  namaLapangan: item['nama']!,
                  hargaPerJam: hargaInt,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(item['foto']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['nama']!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Rp ${item['harga']}",
                    style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}