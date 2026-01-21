import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/booking_model.dart';

class ApiService {
  // UNTUK FLUTTER WEB (Chrome)
  static const String baseUrl = 'http://localhost/fasaaa_api';

  Future<Map<String, dynamic>> loginUser(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {
        "status": "error",
        "message": "Server login tidak terhubung"
      };
    }
  }

  Future<Map<String, dynamic>> registerUser(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {
        "status": "error",
        "message": "Server register tidak terhubung"
      };
    }
  }

  Future<List<Booking>> fetchBookings() async {
    final response =
        await http.get(Uri.parse('$baseUrl/get_bookings.php'));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Booking.fromJson(e)).toList();
    } else {
      throw Exception('Gagal ambil data');
    }
  }
}
