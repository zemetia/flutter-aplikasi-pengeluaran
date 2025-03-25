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

  // Mengkonversi Expense ke Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'jumlah': jumlah,
      'tanggal': tanggal.toIso8601String(),
      'tag': tag,
    };
  }

  // Membuat Expense dari Map
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      judul: map['judul'],
      jumlah: map['jumlah'],
      tanggal: DateTime.parse(map['tanggal']),
      tag: map['tag'],
    );
  }
}
