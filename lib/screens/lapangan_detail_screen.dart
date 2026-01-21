import 'package:flutter/material.dart';

class LapanganScreen extends StatelessWidget {
  const LapanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220), // Samakan dengan HomeScreen
      appBar: AppBar(
        title: const Text("Pilih Lapangan"),
        backgroundColor: const Color(0xFF0B1220),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              indicatorColor: Color(0xFF818CF8),
              tabs: [
                Tab(text: "Futsal"),
                Tab(text: "Basket"),
                Tab(text: "Badminton"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildLapanganGrid(), // Tab Futsal
                  _buildLapanganGrid(), // Tab Basket
                  _buildLapanganGrid(), // Tab Badminton
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLapanganGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      // PENTING: childAspectRatio mengatur proporsi kartu agar tidak "melorot" ke bawah
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75, // Atur angka ini (lebar / tinggi)
      ),
      itemCount: 4, // Jumlah contoh data
      itemBuilder: (context, index) {
        return _buildItemCard();
      },
    );
  }

  Widget _buildItemCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111827), // Warna kartu samakan dengan menu
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Lapangan
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                "https://images.unsplash.com/photo-1574629810360-7efbbe195018?q=80&w=500", // Contoh gambar
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          // Detail Lapangan
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mini Soccer A",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Rp 150.000 / jam",
                        style: TextStyle(color: Colors.greenAccent.shade400, fontSize: 11),
                      ),
                    ],
                  ),
                  // Tombol Pesan
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF818CF8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                      child: const Text("Pesan", style: TextStyle(fontSize: 12, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}