import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'edit_booking_screen.dart';

class PrintBookingScreen extends StatefulWidget {
  const PrintBookingScreen({super.key});

  @override
  State<PrintBookingScreen> createState() => _PrintBookingScreenState();
}

class _PrintBookingScreenState extends State<PrintBookingScreen> {
  // Fungsi refresh agar UI terupdate otomatis setelah edit/hapus
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617), // Dark Navy
      appBar: AppBar(
        title: const Text("Data Booking", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF020617),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DBHelper.getBookings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Belum ada data booking", style: TextStyle(color: Colors.white54)),
            );
          }

          final bookings = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final b = bookings[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            b['name'].toString().toUpperCase(),
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const Icon(Icons.receipt_long, color: Colors.white24),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _infoRow("Lapangan", b['field']),
                      _infoRow("Paket", b['package']),
                      _infoRow("Waktu", "${b['date']} | ${b['time']}"),
                      _infoRow("Durasi", "${b['duration']} Jam"),
                      
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(color: Colors.white10),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Total Pembayaran", 
                                style: TextStyle(color: Colors.white38, fontSize: 11)),
                              Text(
                                "Rp ${b['price']}",
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Tombol Edit
                              _actionButton(
                                icon: Icons.edit_rounded,
                                color: Colors.orangeAccent,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => EditBookingScreen(data: b)),
                                  ).then((_) => _refresh());
                                },
                              ),
                              const SizedBox(width: 8),
                              // Tombol Delete
                              _actionButton(
                                icon: Icons.delete_outline_rounded,
                                color: Colors.redAccent,
                                onTap: () async {
                                  await DBHelper.deleteBooking(b['id']);
                                  _refresh();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Data berhasil dihapus")),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
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

  Widget _infoRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(label, style: const TextStyle(color: Colors.white38, fontSize: 13)),
          ),
          const Text(" :  ", style: TextStyle(color: Colors.white38)),
          Expanded(
            child: Text(value.toString(), 
              style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _actionButton({required IconData icon, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}