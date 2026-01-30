import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async'; // Penting untuk timer splash screen

// Import halaman kamu
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart'; // Pastikan kamu sudah buat file splash_screen.dart tadi

void main() async {
  // 1. Pastikan mesin Flutter siap
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. Koneksikan ke Firebase
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase Error: $e");
  }

  runApp(const FasaaaFieldApp());
}

class FasaaaFieldApp extends StatelessWidget {
  const FasaaaFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fasaaa Field',
      
      // Setting Tema Denim Salma
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1B3C58),
        // Gunakan Poppins secara otomatis untuk seluruh aplikasi
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      
      // JALUR MASUK UTAMA: Splash Screen dulu baru ke Login
      home: const SplashScreen(),
    );
  }
}