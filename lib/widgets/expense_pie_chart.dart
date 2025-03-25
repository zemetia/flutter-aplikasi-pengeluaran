import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpensePieChart extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensePieChart({Key? key, required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return const SizedBox.shrink();
    }

    // Mengelompokkan pengeluaran berdasarkan tag
    final Map<String, double> tagExpenses = {};
    for (var expense in expenses) {
      tagExpenses[expense.tag] =
          (tagExpenses[expense.tag] ?? 0) + expense.jumlah;
    }

    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final total = expenses.fold<double>(
      0,
      (sum, expense) => sum + expense.jumlah,
    );

    // Membuat data untuk pie chart
    final sections = tagExpenses.entries.map((entry) {
      final percentage = (entry.value / total) * 100;
      final color = _getColorForTag(entry.key);

      return PieChartSectionData(
        value: entry.value,
        title: '${percentage.toStringAsFixed(1)}%',
        radius: 100,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        color: color,
      );
    }).toList();

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Persentase per Kategori',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: PieChart(
                      PieChartData(
                        sections: sections,
                        sectionsSpace: 2,
                        centerSpaceRadius: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: tagExpenses.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: _getColorForTag(entry.key),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      entry.key,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      formatter.format(entry.value),
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
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

  Color _getColorForTag(String tag) {
    final colors = {
      'Makanan': Colors.red,
      'Transportasi': Colors.blue,
      'Belanja': Colors.green,
      'Hiburan': Colors.purple,
      'Pendidikan': Colors.orange,
      'Kesehatan': Colors.pink,
      'Lainnya': Colors.grey,
    };

    return colors[tag] ?? Colors.grey;
  }
}
