import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'booking_page.dart';

class FieldListScreen extends StatelessWidget {
  final String sportName;
  const FieldListScreen({super.key, required this.sportName});

  // Data Spesifik sesuai nama file yang Salma download
  List<Map<String, String>> getFieldsBySport(String sport) {
    String query = sport.toLowerCase();

    if (query.contains('futsal')) {
      return [
        {"name": "Interlock Futsal", "img": "interlock.png", "desc": "Lantai plastik modular yang empuk dan standar kompetisi."},
        {"name": "Futsal Lantai Kayu", "img": "kayu_futsal.png", "desc": "Permukaan kayu solid, sangat elegan dan pantulan bola sempurna."},
        {"name": "Outdoor Futsal Area", "img": "outdor_futsal.png", "desc": "Lapangan terbuka dengan sirkulasi udara alami yang segar."},
        {"name": "Futsal Semen Halus", "img": "semen_futsal.png", "desc": "Lantai semen beton yang ekonomis namun tetap solid."},
        {"name": "Sintetis Indoor", "img": "sintetis_indoor_futsal.png", "desc": "Rumput sintetis pendek, meminimalisir luka saat terjatuh."},
        {"name": "Vinyl Professional", "img": "vinyl.png", "desc": "Lantai karet empuk standar internasional, sangat nyaman."},
      ];
    } else if (query.contains('renang')) {
      return [
        {"name": "Private Pool", "img": "private_pool.png", "desc": "Kolam eksklusif untuk privasi keluarga atau tim."},
        {"name": "Kolam Latihan", "img": "latihan.png", "desc": "Kedalaman standar untuk pemula dan latihan teknik."},
        {"name": "Lap Pool", "img": "lap_pool.png", "desc": "Kolam panjang yang dikhususkan untuk olahraga renang intens."},
        {"name": "Executive Pool 3", "img": "kolam3.png", "desc": "Fasilitas lengkap dengan area santai di pinggir kolam."},
        {"name": "Executive Pool 4", "img": "kolam4.png", "desc": "Area kolam luas dengan pencahayaan malam yang indah."},
        {"name": "Kolam Biasa", "img": "kolam_biasa.png", "desc": "Kolam renang umum dengan harga terjangkau."},
        {"name": "Infinity Pool", "img": "infinity.png", "desc": "Pemandangan tanpa batas, mewah dan sangat instagramable."},
      ];
    } else if (query.contains('sepak')) {
      return [
        {"name": "Lapangan Tanah", "img": "tanah.png", "desc": "Nuansa klasik sepakbola tradisional yang menantang."},
        {"name": "Rumput Alami", "img": "rumput_alami.png", "desc": "Kualitas rumput asli yang dirawat setiap hari."},
        {"name": "Indoor Soccer", "img": "indoor_sepakbola.png", "desc": "Main bola tanpa takut kehujanan dengan fasilitas indoor."},
        {"name": "Mini Soccer", "img": "minisocer.png", "desc": "Lapangan 7v7 dengan rumput sintetis berkualitas tinggi."},
        {"name": "Sintetis Full", "img": "sintetis.png", "desc": "Permukaan rumput sintetis rata untuk kecepatan lari maksimal."},
        {"name": "Stadion Internasional", "img": "internasional.png", "desc": "Merasakan sensasi bermain di stadion besar nan megah."},
      ];
    } else if (query.contains('padel')) {
      return [
        {"name": "Classic Court", "img": "classic_court.png", "desc": "Desain padel standar untuk pemain hobi."},
        {"name": "Indoor Padel", "img": "indor_padel.png", "desc": "Suhu ruangan terjaga, main nyaman di segala cuaca."},
        {"name": "Outdoor Padel", "img": "outdor_padel.png", "desc": "Lapangan terbuka dengan pemandangan sekitar."},
        {"name": "Padel Court 1", "img": "padel_1.png", "desc": "Kualitas kaca pelindung standar WPT."},
        {"name": "Padel Beton", "img": "padel_beton.png", "desc": "Konstruksi kokoh dengan pantulan bola yang stabil."},
        {"name": "Padel Panoramik", "img": "padel_panoramik.png", "desc": "Kaca full tanpa tiang, pandangan luas luar biasa."},
        {"name": "Private Padel", "img": "private_padel.png", "desc": "Khusus member atau pemesanan satu grup."},
      ];
    } else if (query.contains('basket')) {
      return [
        {"name": "Lantai Parket Kayu", "img": "parket.png", "desc": "Standar NBA, sangat empuk dan melindungi sendi."},
        {"name": "Lantai Poliuretan", "img": "poliuretan.png", "desc": "Permukaan elastis yang tahan lama dan anti slip."},
        {"name": "Akrilik Indoor", "img": "akrilik_indor.png", "desc": "Warna cerah dengan daya cengkeram sepatu yang kuat."},
        {"name": "Akrilik Outdoor", "img": "akrilik_outdor.png", "desc": "Tahan cuaca panas dan hujan, cocok untuk streetball."},
      ];
    } else if (query.contains('badminton')) {
      return [
        {"name": "Lantai Kayu Klasik", "img": "kayu_badminton.png", "desc": "Material kayu jati yang kuat dan artistik."},
        {"name": "Lantai Plastik modular", "img": "plastik.png", "desc": "Modular court yang praktis dan warna menarik."},
        {"name": "2 Lapang (Double)", "img": "2_lapang.png", "desc": "Area luas cocok untuk turnamen kecil keluarga."},
        {"name": "Outdoor Badminton", "img": "outdor_badminton.png", "desc": "Bermain santai di sore hari di area terbuka."},
        {"name": "Indoor Professional", "img": "indor_badminton.png", "desc": "Pencahayaan anti-silau khusus pemain pro."},
        {"name": "Karpet Matras", "img": "karpet_matras.png", "desc": "Matras karet hijau standar PBSI, empuk dan aman."},
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final Color denimColor = const Color(0xFF1B3C58);
    final fields = getFieldsBySport(sportName);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Lapangan $sportName", 
          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18)),
        backgroundColor: denimColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: fields.length,
        itemBuilder: (context, index) {
          final field = fields[index];
          int price = 100000 + (index * 7500); 

          return Card(
            margin: const EdgeInsets.only(bottom: 25),
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    "assets/${field['img']}",
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 190, color: Colors.grey[200], 
                      child: const Center(child: Icon(Icons.broken_image, size: 50)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(field['name']!, 
                            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: denimColor)),
                          Text("⭐ 4.8", style: TextStyle(color: Colors.orange[700], fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // DESKRIPSI YANG SALMA MINTA
                      Text(field['desc']!, 
                        style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600], height: 1.4)),
                      const Divider(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Harga Per Jam", style: TextStyle(color: Colors.grey, fontSize: 11)),
                              Text("Rp $price", 
                                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green[800])),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                BookingPage(fieldName: field['name']!, pricePerHour: price)
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: denimColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            ),
                            child: const Text("Booking Sekarang", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}