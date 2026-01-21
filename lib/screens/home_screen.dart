import 'package:flutter/material.dart';
import 'lapangan_screen.dart';
import 'riwayat_screen.dart';
import 'jadwal_kosong.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020617), 
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              const Text(
                "Layanan Utama",
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 18, 
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 16),
              
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
                children: [
                  _buildMenuCard(
                    context,
                    title: "Pilih Lapangan",
                    subtitle: "Futsal, Basket, dll",
                    icon: Icons.sports_soccer,
                    color: const Color(0xFF2563EB),
                    target: const LapanganScreen(),
                  ),
                  _buildMenuCard(
                    context,
                    title: "Jadwal Kosong",
                    subtitle: "Cek jam tersedia",
                    icon: Icons.calendar_month,
                    color: const Color(0xFF059669),
                    target: const JadwalKosongScreen(),
                  ),
                  _buildMenuCard(
                    context,
                    title: "Riwayat",
                    subtitle: "Cek pesananmu",
                    icon: Icons.history,
                    color: const Color(0xFFD97706),
                    target: const RiwayatScreen(),
                  ),
                  _buildMenuCard(
                    context,
                    title: "Info Promo",
                    subtitle: "Diskon menarik",
                    icon: Icons.confirmation_number,
                    color: const Color(0xFF7C3AED),
                    target: null, // Logika khusus snackbar di bawah
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildPromoBanner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Selamat Datang 👋",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Mau olahraga apa hari ini?",
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xFF1E293B),
          child: Icon(Icons.person, color: Colors.blueAccent, size: 30),
        ),
      ],
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget? target,
  }) {
    return InkWell(
      onTap: () {
        if (target != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => target));
        } else {
          // Logika jika Promo diklik (target null)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Promo $title belum tersedia saat ini."),
              backgroundColor: color,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(24),
          // Perbaikan withOpacity ke withValues
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white38, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          const Icon(Icons.stars, color: Colors.amber, size: 40),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Member VIP",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Dapatkan potongan harga 20% setiap penyewaan di akhir pekan.",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}