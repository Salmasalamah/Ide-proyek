import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'field_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color denimColor = const Color(0xFF1B3C58);
  
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> ads = [
    {"title": "PROMO BADMINTON", "desc": "Sewa 2 jam, gratis kok!", "color": Colors.blue[800]},
    {"title": "BYURRR! RENANG", "desc": "Tiket terusan cuma 25rb.", "color": Colors.cyan[700]},
    {"title": "PADEL MANIA", "desc": "Main malam diskon 15%.", "color": Colors.indigo[900]},
    {"title": "FUTSAL TIME", "desc": "Booking pagi lebih hemat.", "color": Colors.green[800]},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.9);
    
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < ads.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            floating: true,
            pinned: true,
            backgroundColor: denimColor,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("FASAAA FIELD", 
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
              background: Container(color: denimColor),
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. DESKRIPSI (JUDUL LANGSUNG DESKRIPSI TANPA 'TENTANG')
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pusat Booking Lapangan Premium", 
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18, color: denimColor)),
                      const SizedBox(height: 5),
                      Text(
                        "Kami menyediakan berbagai fasilitas olahraga terbaik dengan sistem booking yang mudah dan cepat untuk menunjang gaya hidup sehat Anda.",
                        style: GoogleFonts.poppins(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                // 2. BANNER IKLAN BERJALAN
                SizedBox(
                  height: 130, 
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) => setState(() => _currentPage = index),
                    itemCount: ads.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: ads[index]['color'],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Positioned(right: -15, top: -15, child: CircleAvatar(radius: 50, backgroundColor: Colors.white10)),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(ads[index]['title'], 
                                    style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                                  Text(ads[index]['desc'], 
                                    style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Pilih Jenis Olahraga", 
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: denimColor)),
                ),
              ],
            ),
          ),

          // 3. GRID LAPANGAN DENGAN WALLPAPER
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.8, 
              ),
              delegate: SliverChildListDelegate([
                _buildFieldCard("Sepakbola", "walpeper_sepakbola.png"),
                _buildFieldCard("Futsal", "walpeper_futsal.png"),
                _buildFieldCard("Basket", "walpeper_basket.jpg"),
                _buildFieldCard("Badminton", "walpeper_badminton.png"),
                _buildFieldCard("Padel", "walpeper_padel.png"),
                _buildFieldCard("Kolam Renang", "walpeper_renang.png"),
              ]),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildFieldCard(String name, String imageName) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // MENGGUNAKAN IMAGE ASSET SESUAI NAMA FILE
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/$imageName"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(name, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 12),
          SizedBox(
            width: 80,
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FieldListScreen(sportName: name)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: denimColor, 
                padding: EdgeInsets.zero,
                shape: const StadiumBorder()
              ),
              child: const Text("Pilih", style: TextStyle(color: Colors.white, fontSize: 11)),
            ),
          )
        ],
      ),
    );
  }
}