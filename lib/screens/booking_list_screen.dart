import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  List<Map<String, dynamic>> bookings = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final data = await DBHelper.getBookings();
    setState(() => bookings = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Booking")),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (c, i) {
          final b = bookings[i];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(b['name']),
              subtitle: Text(
                "${b['field']} | ${b['package']}\nRp ${b['price']}",
              ),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // DELETE
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await DBHelper.deleteBooking(b['id']);
                      _loadData();
                    },
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
