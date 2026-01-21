import 'package:flutter/material.dart';
import 'field_detail_screen.dart';
import '../models/field_model.dart';

class FutsalListScreen extends StatelessWidget {
  const FutsalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lapangan Futsal"),
        backgroundColor: const Color(0xFF1F2937),
      ),
      backgroundColor: const Color(0xFFF1F5F9),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildCard(
            context,
            FieldModel(
              name: "Mini Soccer",
              price: 150000,
              desc: "Lapangan luas standar nasional, cocok turnamen",
              image: "assets/minisoccer.png",
            ),
            true,
          ),
          buildCard(
            context,
            FieldModel(
              name: "Matras",
              price: 120000,
              desc: "Empuk & aman, cocok latihan rutin",
              image: "assets/matras.png",
            ),
            true,
          ),
          buildCard(
            context,
            FieldModel(
              name: "Sintetis",
              price: 180000,
              desc: "Rumput sintetis premium, nyaman bermain",
              image: "assets/sintetis.png",
            ),
            false,
          ),
          buildCard(
            context,
            FieldModel(
              name: "Semen",
              price: 100000,
              desc: "Lapangan keras, kuat & tahan lama",
              image: "assets/semen.png",
            ),
            true,
          ),
          buildCard(
            context,
            FieldModel(
              name: "Multifungsi",
              price: 200000,
              desc: "Bisa futsal, basket & event olahraga",
              image: "assets/multifungsi.png",
            ),
            false,
          ),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context, FieldModel field, bool available) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FieldDetailScreen(field: field),
          ),
        );
      },
      child: Container(
        height: 190,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: AssetImage(field.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            /// OVERLAY
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.75),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            /// STATUS
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: available ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  available ? "TERSEDIA" : "FULL",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            /// TEXT
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    field.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    field.desc,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Rp ${field.price} / jam",
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
