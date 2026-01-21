import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class PrintBookingScreen extends StatelessWidget {
  const PrintBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Booking"),
        backgroundColor: const Color(0xFF2C3E50),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DBHelper.getBookings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Belum ada booking"));
          }

          final bookings = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final b = bookings[index];

              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        b['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text("Lapangan : ${b['field']}"),
                      Text("Paket     : ${b['package']}"),
                      Text("Tanggal   : ${b['date']}"),
                      Text("Jam       : ${b['time']}"),
                      Text("Durasi    : ${b['duration']} Jam"),
                      const SizedBox(height: 6),
                      Text(
                        "Total : Rp ${b['price']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await DBHelper.deleteBooking(b['id']);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Booking dihapus"),
                                ),
                              );

                              // REFRESH HALAMAN (AMAN & RESMI)
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const PrintBookingScreen(),
                                ),
                              );
                            },
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
}
