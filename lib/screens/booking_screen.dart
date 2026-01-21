import 'package:flutter/material.dart';
import '../database/db_helper.dart'; // Import Database Helper

class BookingScreen extends StatefulWidget {
  final String namaLapangan;
  final int hargaPerJam;

  const BookingScreen({super.key, required this.namaLapangan, required this.hargaPerJam});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();
  final TextEditingController _durasiController = TextEditingController();

  int durasi = 1;
  int totalHarga = 0;

  @override
  void initState() {
    super.initState();
    totalHarga = widget.hargaPerJam;
    _durasiController.text = "1";
  }

  void hitungTotal(String val) {
    setState(() {
      durasi = int.tryParse(val) ?? 0;
      totalHarga = durasi * widget.hargaPerJam;
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _tanggalController.dispose();
    _jamController.dispose();
    _durasiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617),
      appBar: AppBar(
        title: const Text("Konfirmasi Booking", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildInfoCard(),
            const SizedBox(height: 25),
            _buildInput("Nama Pemesan", "Masukkan nama", _namaController),
            _buildInput("Tanggal Main", "Contoh: 25/01/2026", _tanggalController),
            _buildInput("Mulai Jam", "Contoh: 19:00", _jamController, keyboard: TextInputType.datetime),
            
            // Input Durasi
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Durasi (Jam)", style: TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                TextField(
                  controller: _durasiController,
                  onChanged: hitungTotal,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Berapa jam?",
                    hintStyle: const TextStyle(color: Colors.white24),
                    filled: true, 
                    fillColor: const Color(0xFF0F172A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            _buildTotalSection(),
            const SizedBox(height: 30),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[700],
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
              ),
              onPressed: () async {
                if (_namaController.text.isNotEmpty) {
                  // LOGIKA CREATE: Simpan ke Database SQLite
                  await DBHelper.insertBooking({
                    'name': _namaController.text,
                    'field': widget.namaLapangan,
                    'package': 'Reguler', // Default paket
                    'date': _tanggalController.text,
                    'time': _jamController.text,
                    'duration': durasi,
                    'price': totalHarga,
                  });

                  // Cek apakah widget masih aktif sebelum menggunakan context
                  if (!mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Booking Berhasil Disimpan!")),
                  );
                  Navigator.pop(context); 
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Nama pemesan tidak boleh kosong!")),
                  );
                }
              },
              child: const Text("KIRIM PESANAN SEKARANG", 
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // Menggunakan withValues (Standar Flutter Terbaru)
        color: const Color(0xFF2563EB).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2563EB)),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.blue),
          const SizedBox(width: 15),
          Expanded(
            child: Text(widget.namaLapangan, 
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Total Pembayaran", style: TextStyle(color: Colors.white70)),
          Text("Rp ${totalHarga.toString().replaceAllMapped(RegExp(r'(\d{3})+(?!\d)'), (Match m) => '${m[0]}.')}", 
            style: const TextStyle(color: Colors.greenAccent, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildInput(String label, String hint, TextEditingController controller, {TextInputType keyboard = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: keyboard,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint, 
              hintStyle: const TextStyle(color: Colors.white24),
              filled: true, 
              fillColor: const Color(0xFF0F172A),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), 
                borderSide: BorderSide.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}