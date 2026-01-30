import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking_model.dart';

class BookingService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // simpan booking
  Future<void> addBooking(BookingModel booking) async {
    await _db.collection('bookings').add(booking.toMap());
  }

  // stream riwayat booking
  Stream<List<BookingModel>> getBookings() {
    return _db
        .collection('bookings')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => BookingModel.fromMap(doc.data(), doc.id))
            .toList());
  }

  // ✅ TAMBAHAN: update status pembayaran
  Future<void> updateStatus(String bookingId) async {
    await _db.collection('bookings')
        .doc(bookingId)
        .update({
          'status': 'Pembayaran Berhasil',
        });
  }
}
