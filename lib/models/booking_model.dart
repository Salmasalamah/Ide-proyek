class BookingModel {
  final String id;
  final String teamName;
  final String fieldName;
  final String date;
  final int duration;
  final int totalPrice;
  final String package;
  final String status;

  BookingModel({
    required this.id,
    required this.teamName,
    required this.fieldName,
    required this.date,
    required this.duration,
    required this.totalPrice,
    required this.package,
    required this.status,
  });

factory BookingModel.fromMap(Map<String, dynamic> map, String id) {
  return BookingModel(
    id: id,
    teamName: map['teamName'] ?? '',
    fieldName: map['fieldName'] ?? '',
    date: map['date'] ?? '',
    duration: int.tryParse(map['duration'].toString()) ?? 0,
    totalPrice: int.tryParse(map['totalPrice'].toString()) ?? 0,
    package: map['package'] ?? '',
    status: map['status'] ?? '',
  );
}



  // 🔥 Object → Firebase
  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'fieldName': fieldName,
      'date': date,
      'duration': duration,
      'totalPrice': totalPrice,
      'package': package,
      'status': status,
    };
  }
}
