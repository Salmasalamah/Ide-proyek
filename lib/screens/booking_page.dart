import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; 
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking_model.dart'; 

class BookingPage extends StatefulWidget {
  final String fieldName;
  final int pricePerHour;

  const BookingPage({
    super.key, 
    required this.fieldName, 
    required this.pricePerHour
  });

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _teamController = TextEditingController();
  
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _duration = 1;

  // ✅ TAMBAHAN — anti double click
  bool _isLoading = false;
  
  Map<String, dynamic>? _selectedPackageData;
  late List<Map<String, dynamic>> _currentPackages;

  @override
  void initState() {
    super.initState();
    _currentPackages = _getPackages();
    _selectedPackageData = _currentPackages[0];
  }

  List<Map<String, dynamic>> _getPackages() {
    String name = widget.fieldName.toLowerCase();
    if (name.contains('sepak')) {
      return [
        {"name": "Paket Kick Off", "price": 200000},
        {"name": "Paket Friendly", "price": 220000},
        {"name": "Paket Weekend", "price": 250000},
        {"name": "Paket Training", "price": 210000},
        {"name": "Paket Liga Mini", "price": 230000},
        {"name": "Paket Night Game", "price": 270000},
        {"name": "Paket Pagi Hemat", "price": 180000},
        {"name": "Paket Sore Prime", "price": 260000},
        {"name": "Paket Bulanan Tim", "price": 190000},
        {"name": "Paket Akademi", "price": 170000},
      ];
    } else if (name.contains('futsal')) {
      return [
        {"name": "Paket Santai", "price": 90000},
        {"name": "Paket Reguler", "price": 100000},
        {"name": "Paket Prime Time", "price": 120000},
        {"name": "Paket Malam", "price": 130000},
        {"name": "Paket Sparing", "price": 110000},
        {"name": "Paket Komunitas", "price": 95000},
        {"name": "Paket Turnamen", "price": 140000},
        {"name": "Paket Pagi", "price": 80000},
        {"name": "Paket Sore", "price": 115000},
        {"name": "Paket Akademi", "price": 85000},
      ];
    } else if (name.contains('basket')) {
      return [
        {"name": "Paket Fun Game", "price": 70000},
        {"name": "Paket Reguler", "price": 80000},
        {"name": "Paket Prime Court", "price": 100000},
        {"name": "Paket Team Play", "price": 90000},
        {"name": "Paket Night Game", "price": 110000},
        {"name": "Paket Latihan", "price": 75000},
        {"name": "Paket Turnamen", "price": 120000},
        {"name": "Paket Pagi", "price": 65000},
        {"name": "Paket Sore", "price": 95000},
        {"name": "Paket Sekolah Basket", "price": 60000},
      ];
    } else if (name.contains('badminton')) {
      return [
        {"name": "Paket Single", "price": 350000},
        {"name": "Paket Double", "price": 400000},
        {"name": "Paket Prime Time", "price": 500000},
        {"name": "Paket Training", "price": 450000},
        {"name": "Paket Night Smash", "price": 550000},
        {"name": "Paket Komunitas", "price": 380000},
        {"name": "Paket Turnamen", "price": 600000},
        {"name": "Paket Pagi", "price": 300000},
        {"name": "Paket Sore", "price": 480000},
        {"name": "Paket Klub", "price": 330000},
      ];
    } else if (name.contains('padel')) {
      return [
        {"name": "Paket Intro", "price": 150000},
        {"name": "Paket Fun Rally", "price": 170000},
        {"name": "Paket Prime Court", "price": 200000},
        {"name": "Paket Double Match", "price": 180000},
        {"name": "Paket Night Padel", "price": 210000},
        {"name": "Paket Training", "price": 160000},
        {"name": "Paket Mini League", "price": 220000},
        {"name": "Paket Pagi", "price": 140000},
        {"name": "Paket Sore", "price": 190000},
        {"name": "Paket Akademi", "price": 130000},
      ];
    } else { 
      return [
        {"name": "Paket Umum", "price": 150000},
        {"name": "Paket Keluarga", "price": 200000},
        {"name": "Paket Prime Time", "price": 250000},
        {"name": "Paket Latihan", "price": 180000},
        {"name": "Paket Malam", "price": 220000},
        {"name": "Paket Private Lane", "price": 400000},
        {"name": "Paket Sekolah Renang", "price": 170000},
        {"name": "Paket Pagi", "price": 120000},
        {"name": "Paket Sore", "price": 230000},
        {"name": "Paket Klub", "price": 160000},
      ];
    }
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(), 
      lastDate: DateTime(2027),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  @override
  Widget build(BuildContext context) {
    int packagePrice = _selectedPackageData?['price'] ?? 0;
    int totalPrice = packagePrice * _duration;
    final denimColor = const Color(0xFF1B3C58);

    return Scaffold(
      appBar: AppBar(
        title: Text("Konfirmasi Booking", 
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: denimColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.fieldName, 
              style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: denimColor)),
            const SizedBox(height: 20),
            
            TextField(
              controller: _teamController,
              decoration: const InputDecoration(
                labelText: "Nama Tim / Pemesan",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.group_work),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _pickDate,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: "Tanggal", 
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today, size: 18),
                      ),
                      child: Text(DateFormat('dd/MM/yyyy').format(_selectedDate)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: _pickTime,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: "Mulai Jam", 
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.access_time, size: 18),
                      ),
                      child: Text(_selectedTime.format(context)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text("Pilih Paket:", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            
            DropdownButtonFormField<Map<String, dynamic>>(
              isExpanded: true,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: _selectedPackageData,
              items: _currentPackages.map((p) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: p,
                  child: Text("${p['name']} (Rp ${p['price']}/jam)"),
                );
              }).toList(),
              onChanged: (val) {
                setState(() => _selectedPackageData = val);
              },
            ),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Durasi Sewa:", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                Text("$_duration Jam", 
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: denimColor, fontSize: 18)),
              ],
            ),
            Slider(
              value: _duration.toDouble(),
              min: 1, max: 12, divisions: 11,
              activeColor: denimColor,
              onChanged: (val) => setState(() => _duration = val.toInt()),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                children: [
                  _summaryRow("Harga Paket", "Rp $packagePrice"),
                  _summaryRow("Durasi", "$_duration Jam"),
                  const Divider(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Bayar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("Rp $totalPrice", 
                        style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[800])),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: denimColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                ),
                onPressed: _isLoading ? null : () async {
                  if (_teamController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Nama tim tidak boleh kosong!"))
                    );
                    return;
                  }

                  setState(() => _isLoading = true);

                  String fullDate = "${DateFormat('dd/MM/yyyy').format(_selectedDate)} Pukul ${_selectedTime.format(context)}";

                  try {
                    await FirebaseFirestore.instance.collection('bookings').add({
                      'id': "FS-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}",
                      'teamName': _teamController.text,
                      'fieldName': widget.fieldName,
                      'date': fullDate,
                      'duration': _duration,
                      'totalPrice': totalPrice,
                      'package': _selectedPackageData!['name'],
                      'status': "Menunggu Pembayaran",
                      'timestamp': FieldValue.serverTimestamp(),
                    });

                    setState(() => _isLoading = false);

                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Booking Berhasil Disimpan Online!"),
                    ));
                  } catch (e) {
                    setState(() => _isLoading = false);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Gagal menyimpan: $e"),
                    ));
                  }
                },
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "KONFIRMASI SEKARANG",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
