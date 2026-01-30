import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';
import 'main_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  
  bool _isLoading = false; 
  final Color denimColor = const Color(0xFF1B3C58); 

  // --- FUNGSI LOGIN ---
  void _handleLogin() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar("Email dan Password tidak boleh kosong!", Colors.orange);
      return;
    }

    setState(() => _isLoading = true);
    try {
      final user = await _authService.login(
        _emailController.text.trim(), 
        _passwordController.text
      );

      if (user != null) {
        if (!mounted) return;
        _showSnackBar("Login Berhasil!", Colors.green);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigation()),
        );
      } else {
        _showSnackBar("Email/Password Salah atau Akun tidak terdaftar", Colors.red);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // --- FUNGSI SIGN UP (DAFTAR) ---
  void _handleSignUp() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar("Isi email dan password untuk mendaftar", Colors.orange);
      return;
    }

    setState(() => _isLoading = true);
    try {
      // Pastikan di AuthService kamu ada fungsi register
      final user = await _authService.register(
        _emailController.text.trim(), 
        _passwordController.text
      );

      if (user != null) {
        _showSnackBar("Akun Berhasil Dibuat!", Colors.green);
        // Bisa langsung login otomatis ke Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigation()),
        );
      }
    } catch (e) {
      _showSnackBar("Gagal Daftar: ${e.toString()}", Colors.red);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: color, content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Denim
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: denimColor,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.stadium_rounded, size: 80, color: Colors.white),
                  const SizedBox(height: 10),
                  Text("FASAAA FIELD",
                    style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 2)),
                  Text("PREMIUM SPORTS BOOKING",
                    style: GoogleFonts.poppins(fontSize: 10, color: Colors.white70, letterSpacing: 4)),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome", style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: denimColor)),
                  const Text("Silakan login atau daftar akun baru"),
                  const SizedBox(height: 30),
                  
                  // Input Email
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      prefixIcon: Icon(Icons.alternate_email, color: denimColor),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Input Password
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_outline, color: denimColor),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Tombol LOGIN
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: denimColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: _isLoading ? null : _handleLogin,
                      child: _isLoading 
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("LOGIN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Tombol DAFTAR (SIGN UP)
                  Center(
                    child: TextButton(
                      onPressed: _isLoading ? null : _handleSignUp,
                      child: RichText(
                        text: TextSpan(
                          text: "Belum punya akun? ",
                          style: const TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: "Daftar di sini",
                              style: TextStyle(color: denimColor, fontWeight: FontWeight.bold),
                            ),
                          ],
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
    );
  }
}