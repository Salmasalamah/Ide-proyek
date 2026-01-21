class Lapangan {
  final String id;
  final String nama;
  final String harga;
  final String image;
  final String kategori; // futsal | basket | badminton

  Lapangan({
    required this.id,
    required this.nama,
    required this.harga,
    required this.image,
    required this.kategori,
  });
}

/// ================== DATA FINAL ==================
final List<Lapangan> lapanganData = [

  // ================= FUTSAL (5 FOTO) =================
  Lapangan(
    id: "1",
    nama: "Futsal Minisoccer",
    harga: "150.000",
    image: "assets/minisocer.png",
    kategori: "futsal",
  ),
  Lapangan(
    id: "2",
    nama: "Futsal Matras",
    harga: "130.000",
    image: "assets/matras.png",
    kategori: "futsal",
  ),
  Lapangan(
    id: "3",
    nama: "Futsal Sintetis",
    harga: "140.000",
    image: "assets/sintetis.png",
    kategori: "futsal",
  ),
  Lapangan(
    id: "4",
    nama: "Futsal Semen",
    harga: "120.000",
    image: "assets/semen.png",
    kategori: "futsal",
  ),
  Lapangan(
    id: "5",
    nama: "Futsal Multifungsi",
    harga: "160.000",
    image: "assets/multifungsi.png",
    kategori: "futsal",
  ),

  // ================= BASKET (6 FOTO) =================
  Lapangan(
    id: "6",
    nama: "Basket Standar",
    harga: "170.000",
    image: "assets/standar.png",
    kategori: "basket",
  ),
  Lapangan(
    id: "7",
    nama: "Basket VIP",
    harga: "220.000",
    image: "assets/vip.png",
    kategori: "basket",
  ),
  Lapangan(
    id: "8",
    nama: "Basket Semen",
    harga: "150.000",
    image: "assets/semen_basket.png",
    kategori: "basket",
  ),
  Lapangan(
    id: "9",
    nama: "Basket Multifungsi",
    harga: "180.000",
    image: "assets/multifungsi.png",
    kategori: "basket",
  ),
  Lapangan(
    id: "10",
    nama: "Basket Indoor",
    harga: "200.000",
    image: "assets/indoor.png",
    kategori: "basket",
  ),
  Lapangan(
    id: "11",
    nama: "Basket Outdoor",
    harga: "160.000",
    image: "assets/outdoor.png",
    kategori: "basket",
  ),

  // ================= BADMINTON (7 FOTO) =================
  Lapangan(
    id: "12",
    nama: "Badminton Semi GOR",
    harga: "100.000",
    image: "assets/semigor.png",
    kategori: "badminton",
  ),
  Lapangan(
    id: "13",
    nama: "Badminton Lapang Dua",
    harga: "110.000",
    image: "assets/lapang_dua.png",
    kategori: "badminton",
  ),
  Lapangan(
    id: "14",
    nama: "Badminton Semen",
    harga: "90.000",
    image: "assets/semen1.png",
    kategori: "badminton",
  ),
  Lapangan(
    id: "15",
    nama: "Badminton Biasa",
    harga: "95.000",
    image: "assets/biasa.png",
    kategori: "badminton",
  ),
  Lapangan(
    id: "16",
    nama: "Badminton Outdoor",
    harga: "85.000",
    image: "assets/outdor.png",
    kategori: "badminton",
  ),
  Lapangan(
    id: "17",
    nama: "Badminton Turnamen",
    harga: "140.000",
    image: "assets/turnamen.png",
    kategori: "badminton",
  ),
  Lapangan(
    id: "18",
    nama: "Badminton Nyaman",
    harga: "120.000",
    image: "assets/nyaman.png",
    kategori: "badminton",
  ),
];
