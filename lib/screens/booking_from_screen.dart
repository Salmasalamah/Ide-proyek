import 'package:flutter/material.dart';

class BookingFormScreen extends StatefulWidget {
  final String fieldType;

  const BookingFormScreen({super.key, required this.fieldType});

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final _nameController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int duration = 1;

  String? selectedPackage;
  int basePrice = 0;

  late Map<String, int> paketHarga;

  @override
  void initState() {
    super.initState();
    paketHarga = _getPaket(widget.fieldType);
  }

  Map<String, int> _getPaket(String field) {
    if (field.toLowerCase().contains('futsal')) {
      return {
        'Futsal Reguler': 100000,
        'Futsal Malam': 130000,
        'Futsal VIP': 180000,
        'Futsal Latihan Tim': 150000,
        'Futsal Kompetisi': 220000,
        'Futsal Junior': 90000,
        'Futsal Fun Game': 120000,
        'Futsal Weekend': 200000,
        'Futsal Private': 250000,
        'Futsal Combo': 280000,
      };
    } else if (field.toLowerCase().contains('basket')) {
      return {
        'Basket Reguler': 120000,
        'Basket Malam': 150000,
        'Basket VIP': 200000,
        'Basket Latihan Tim': 180000,
        'Basket Kompetisi': 250000,
        'Basket Junior': 100000,
        'Basket Fun Game': 130000,
        'Basket Weekend': 220000,
        'Basket Private': 300000,
        'Basket Combo': 350000,
      };
    } else {
      return {
        'Badminton Reguler': 50000,
        'Badminton Malam': 70000,
        'Badminton VIP': 100000,
        'Badminton Latihan': 80000,
        'Badminton Kompetisi': 120000,
        'Badminton Junior': 40000,
        'Badminton Fun Game': 60000,
        'Badminton Weekend': 110000,
        'Badminton Private': 150000,
        'Badminton Combo': 180000,
      };
    }
  }

  int get totalPrice => basePrice * duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: Text("Booking ${widget.fieldType}"),
        backgroundColor: const Color(0xFF1F2937),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _label("Nama Pemesan"),
          _input(_nameController, "Masukkan nama"),

          _label("Paket"),
          _dropdownPaket(),

          _label("Tanggal"),
          _pickerTile(
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
            Icons.calendar_today,
            () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2026),
              );
              if (picked != null) setState(() => selectedDate = picked);
            },
          ),

          _label("Jam"),
          _pickerTile(
            selectedTime.format(context),
            Icons.access_time,
            () async {
              final picked =
                  await showTimePicker(context: context, initialTime: selectedTime);
              if (picked != null) setState(() => selectedTime = picked);
            },
          ),

          _label("Durasi"),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  if (duration > 1) setState(() => duration--);
                },
              ),
              Text("$duration Jam",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () => setState(() => duration++),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// TOTAL
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Bayar"),
                Text(
                  "Rp $totalPrice",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          /// KONFIRMASI
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F2937),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: _canSubmit()
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Booking berhasil")),
                      );
                      Navigator.pop(context);
                    }
                  : null,
              child: const Text(
                "KONFIRMASI BOOKING",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===== HELPER =====

  bool _canSubmit() {
    return _nameController.text.isNotEmpty &&
        selectedPackage != null &&
        basePrice > 0;
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 6),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  Widget _input(TextEditingController c, String hint) => TextField(
        controller: c,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      );

  Widget _dropdownPaket() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedPackage,
            hint: const Text("Pilih Paket"),
            items: paketHarga.entries
                .map(
                  (e) => DropdownMenuItem(
                    value: e.key,
                    child: Text("${e.key} — Rp ${e.value}"),
                  ),
                )
                .toList(),
            onChanged: (v) {
              setState(() {
                selectedPackage = v;
                basePrice = paketHarga[v]!;
              });
            },
          ),
        ),
      );

  Widget _pickerTile(String text, IconData icon, VoidCallback onTap) => ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon),
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onTap,
      );
}
