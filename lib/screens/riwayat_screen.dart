import 'package:flutter/material.dart';
import '../database/db_helper.dart'; // Menggunakan Database
import 'edit_booking_screen.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  // Fungsi untuk memicu refresh tampilan
  void _refreshData() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617), // Dark Navy
      appBar: AppBar(
        title: const Text("Riwayat Pesanan", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF020617),
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DBHelper.getBookings(), // Ambil data dari database
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Belum ada riwayat", style: TextStyle(color: Colors.white54))
            );
          }

          final listData = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: listData.length,
            itemBuilder: (context, index) {
              final item = listData[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white10),
                ),
                child: ListTile(
                  title: Text(
                    item['name'] ?? '-', 
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  subtitle: Text(
                    "${item['field']} • ${item['date']}", 
                    style: const TextStyle(color: Colors.white60)
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Tombol Edit
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blueAccent),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditBookingScreen(data: item) // Kirim Map data
                            ),
                          ).then((_) => _refreshData());
                        },
                      ),
                      // Tombol Hapus
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () async {
                          await DBHelper.deleteBooking(item['id']);
                          _refreshData();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}