import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fungsi Daftar Akun Baru
  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Menangani error spesifik Firebase
      if (e.code == 'weak-password') {
        debugPrint("Error: Password terlalu lemah.");
      } else if (e.code == 'email-already-in-use') {
        debugPrint("Error: Email sudah terdaftar.");
      }
      return null;
    } catch (e) {
      debugPrint("Error Register: $e");
      return null;
    }
  }

  // Fungsi Login
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Dosen bakal suka kalau kamu menghandle error spesifik begini
      String message = "";
      if (e.code == 'user-not-found') {
        message = "Email tidak terdaftar.";
      } else if (e.code == 'wrong-password') {
        message = "Password salah.";
      } else if (e.code == 'network-request-failed') {
        message = "Koneksi internet bermasalah.";
      } else {
        message = "Terjadi kesalahan: ${e.message}";
      }
      debugPrint("Firebase Login Error: $message");
      return null;
    } catch (e) {
      debugPrint("Error Login: $e");
      return null;
    }
  }

  // Fungsi Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Tambahan: Mengecek apakah user masih login atau tidak
  User? get currentUser => _auth.currentUser;
}