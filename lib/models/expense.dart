import 'package:uuid/uuid.dart';

class Expense {
  final String id;
  String judul;
  double jumlah;
  DateTime tanggal;
  String tag;

  Expense({
    required this.id,
    required this.judul,
    required this.jumlah,
    required this.tanggal,
    required this.tag,
  });

  // Mengkonversi Expense ke Map untuk SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'jumlah': jumlah,
      'tanggal': tanggal.toIso8601String(),
      'tag': tag,
    };
  }

  // Membuat Expense dari Map dari SQLite
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as String,
      judul: map['judul'] as String,
      jumlah: map['jumlah'] as double,
      tanggal: DateTime.parse(map['tanggal'] as String),
      tag: map['tag'] as String,
    );
  }

  // Membuat Expense baru
  factory Expense.create({
    required String judul,
    required double jumlah,
    required DateTime tanggal,
    required String tag,
  }) {
    return Expense(
      id: const Uuid().v4(),
      judul: judul,
      jumlah: jumlah,
      tanggal: tanggal,
      tag: tag,
    );
  }
}
