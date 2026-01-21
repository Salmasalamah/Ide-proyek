class Booking {
  final String id;
  final String nama;
  final String lapangan;
  final String tanggal;
  final String harga;

  Booking({
    required this.id, 
    required this.nama, 
    required this.lapangan, 
    required this.tanggal, 
    required this.harga
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id_booking']?.toString() ?? '0',
      // Mencari key 'nama_tim' atau 'nama' agar tidak muncul "Kosong"
      nama: json['nama_tim'] ?? json['nama'] ?? 'Tim Umum',
      lapangan: json['jenis_lapangan'] ?? json['lapangan'] ?? 'Umum',
      tanggal: json['tanggal_booking'] ?? json['tanggal'] ?? '-',
      harga: json['total_harga']?.toString() ?? json['harga']?.toString() ?? '0',
    );
  }
}