import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import '../services/auth_service.dart';
import '../models/booking_model.dart';
import '../services/booking_service.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  final Color denimColor = const Color(0xFF1B3C58);
  final AuthService _authService = AuthService();
  final BookingService _bookingService = BookingService();

  void _handleLogout() async {
    await _authService.logout();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const HomeScreen(),

      // ✅ HALAMAN RIWAYAT
      Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              width: double.infinity,
              color: denimColor,
              child: Center(
                child: Text(
                  "Riwayat Booking",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Expanded(
              child: StreamBuilder<List<BookingModel>>(
                stream: _bookingService.getBookings(),
                builder: (context, snapshot) {
                  // 🔹 loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  // 🔹 error
                  if (snapshot.hasError) {
                    return Center(
                        child: Text("Error: ${snapshot.error}"));
                  }

                  final bookings = snapshot.data ?? [];

                  // 🔹 kosong
                  if (bookings.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Icon(Icons.history_edu,
                              size: 80,
                              color:
                                  denimColor.withOpacity(0.2)),
                          const SizedBox(height: 10),
                          const Text(
                            "Belum ada riwayat booking.",
                            style:
                                TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }

                  // 🔹 ada data
                  return ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: bookings.length,
                    itemBuilder: (context, index) {
                      final item = bookings[index];

                      return Card(
                        margin:
                            const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        elevation: 3,
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.all(15),
                          leading: CircleAvatar(
                            backgroundColor:
                                denimColor.withOpacity(0.1),
                            child: Icon(
                              Icons.confirmation_number,
                              color: denimColor,
                            ),
                          ),
                          title: Text(
                            item.teamName,
                            style: const TextStyle(
                                fontWeight:
                                    FontWeight.bold),
                          ),
                          subtitle: Text(
                              "${item.fieldName}\n${item.date} | ${item.package}"),
                          trailing: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Rp ${item.totalPrice}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                              Text(
                                item.status,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ✅ HALAMAN AKUN
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: denimColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,
                        size: 60,
                        color: Color(0xFF1B3C58)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Salma Fasaaa",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "salma@fasaaa.com",
                    style:
                        TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("WhatsApp"),
                    subtitle:
                        Text("+62 812 3456 789"),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Alamat"),
                    subtitle: Text(
                        "Bandung, Jawa Barat"),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red[700],
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  15),
                        ),
                      ),
                      onPressed: _handleLogout,
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "KELUAR AKUN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar:
          BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: denimColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (index) =>
            setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: "Akun",
          ),
        ],
      ),
    );
  }
}
