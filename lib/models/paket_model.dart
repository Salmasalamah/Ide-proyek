class Paket {
  final int? id;
  final String olahraga;
  final String nama;
  final int harga;
  final String deskripsi;

  Paket({
    this.id,
    required this.olahraga,
    required this.nama,
    required this.harga,
    required this.deskripsi,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'olahraga': olahraga,
      'nama': nama,
      'harga': harga,
      'deskripsi': deskripsi,
    };
  }
}
