import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/lapangan_screen.dart';
import 'screens/jadwal_screen.dart';
import 'screens/riwayat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fasaaa Field',

      // TEMA GELAP – TANPA PUTIH & TANPA HIJAU
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1220),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0B1220),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      ),

      // LOGIN SEBAGAI AWAL
      home: LoginScreen(),

      // ROUTES
      routes: {
        '/home': (_) => const HomeScreen(),
        '/lapangan': (_) => const LapanganScreen(),
        '/jadwal': (_) => const JadwalScreen(),
        '/riwayat': (_) => const RiwayatScreen(),
      },
    );
  }
}
