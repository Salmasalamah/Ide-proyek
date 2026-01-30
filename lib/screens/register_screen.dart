import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final Color denimColor = const Color(0xFF1B3C58);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: denimColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                color: denimColor,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50)),
              ),
              child: Text(
                "Buat Akun",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: "Email Baru", prefixIcon: Icon(Icons.email, color: denimColor)),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password", prefixIcon: Icon(Icons.lock, color: denimColor)),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: denimColor),
                      onPressed: () async {
                        final user = await _authService.register(_emailController.text, _passwordController.text);
                        if (!mounted) return; // Menghilangkan warning biru
                        if (user != null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Daftar! Silakan Login.")));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("DAFTAR SEKARANG", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}