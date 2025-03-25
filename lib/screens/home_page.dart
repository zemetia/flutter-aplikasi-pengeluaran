import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/expense.dart';
import '../widgets/expense_card.dart';
import '../widgets/expense_chart.dart';
import '../widgets/expense_summary.dart';
import '../widgets/expense_pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Expense> _expenses = [];
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  final _jumlahController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedTag = 'Lainnya';

  final List<String> _tags = [
    'Makanan',
    'Transportasi',
    'Belanja',
    'Hiburan',
    'Pendidikan',
    'Kesehatan',
    'Lainnya',
  ];

  void _showExpenseDialog([Expense? expense]) {
    if (expense != null) {
      _judulController.text = expense.judul;
      _jumlahController.text = expense.jumlah.toString();
      _selectedDate = expense.tanggal;
      _selectedTag = expense.tag;
    } else {
      _judulController.clear();
      _jumlahController.clear();
      _selectedDate = DateTime.now();
      _selectedTag = 'Lainnya';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          expense == null ? 'Tambah Pengeluaran' : 'Edit Pengeluaran',
          style: const TextStyle(fontSize: 24),
        ),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(
                  labelText: 'Judul',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _jumlahController,
                decoration: const InputDecoration(
                  labelText: 'Jumlah (Rp)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah tidak boleh kosong';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Masukkan angka yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedTag,
                decoration: const InputDecoration(
                  labelText: 'Kategori',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                items: _tags.map((tag) {
                  return DropdownMenuItem(
                    value: tag,
                    child: Text(tag),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedTag = value);
                  }
                },
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() => _selectedDate = picked);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 8),
                      Text(
                        '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (expense == null) {
                  setState(() {
                    _expenses.add(
                      Expense(
                        id: const Uuid().v4(),
                        judul: _judulController.text,
                        jumlah: double.parse(_jumlahController.text),
                        tanggal: _selectedDate,
                        tag: _selectedTag,
                      ),
                    );
                    // Mengurutkan expenses berdasarkan tanggal terbaru
                    _expenses.sort((a, b) => b.tanggal.compareTo(a.tanggal));
                  });
                } else {
                  setState(() {
                    expense.judul = _judulController.text;
                    expense.jumlah = double.parse(_jumlahController.text);
                    expense.tanggal = _selectedDate;
                    expense.tag = _selectedTag;
                    // Mengurutkan expenses berdasarkan tanggal terbaru
                    _expenses.sort((a, b) => b.tanggal.compareTo(a.tanggal));
                  });
                }
                Navigator.pop(context);
              }
            },
            child: Text(expense == null ? 'Tambah' : 'Simpan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pencatat Pengeluaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _expenses.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long,
                    size: 64,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Belum ada pengeluaran',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tekan tombol + untuk menambahkan',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ExpenseSummary(expenses: _expenses),
                  ExpensePieChart(expenses: _expenses),
                  ExpenseChart(expenses: _expenses),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 80),
                    itemCount: _expenses.length,
                    itemBuilder: (context, index) {
                      final expense = _expenses[index];
                      return ExpenseCard(
                        expense: expense,
                        onTap: () => _showExpenseDialog(expense),
                        onDelete: () {
                          setState(() {
                            _expenses.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showExpenseDialog(),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
    );
  }

  @override
  void dispose() {
    _judulController.dispose();
    _jumlahController.dispose();
    super.dispose();
  }
}
