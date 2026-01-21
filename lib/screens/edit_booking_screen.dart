import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class EditBookingScreen extends StatefulWidget {
  // Kita ubah agar menerima Map data, bukan index
  final Map<String, dynamic> data;

  const EditBookingScreen({super.key, required this.data});

  @override
  State<EditBookingScreen> createState() => _EditBookingScreenState();
}

class _EditBookingScreenState extends State<EditBookingScreen> {
  late TextEditingController _nameController;
  late TextEditingController _packageController;
  late TextEditingController _durationController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    // Mengambil data dari widget.data yang dikirim dari Riwayat
    _nameController = TextEditingController(text: widget.data['name']);
    _packageController = TextEditingController(text: widget.data['package']);
    _durationController = TextEditingController(text: widget.data['duration'].toString());
    _priceController = TextEditingController(text: widget.data['price'].toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _packageController.dispose();
    _durationController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617), // Dark Navy
      appBar: AppBar(
        title: const Text("Edit Pesanan", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF020617),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTextField("Nama Pemesan", _nameController),
            _buildTextField("Paket", _packageController),
            _buildTextField("Durasi (Jam)", _durationController, isNumber: true),
            _buildTextField("Total Harga", _priceController, isNumber: true),
            
            const SizedBox(height: 30),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () async {
                  // Update ke Database menggunakan ID yang ada di widget.data
                  await DBHelper.updateBooking(
                    widget.data['id'],
                    _nameController.text,
                    _packageController.text,
                    int.parse(_durationController.text),
                    int.parse(_priceController.text),
                  );

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Berhasil memperbarui data")),
                    );
                    Navigator.pop(context); // Kembali ke Riwayat
                  }
                },
                child: const Text("SIMPAN PERUBAHAN", 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blueAccent),
          ),
          filled: true,
          fillColor: const Color(0xFF0F172A),
        ),
      ),
    );
  }
}