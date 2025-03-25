import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpenseSummary extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseSummary({Key? key, required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return const SizedBox.shrink();
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

    final today = DateTime.now();
    final thisMonth = expenses.where((expense) {
      return expense.tanggal.year == today.year &&
          expense.tanggal.month == today.month;
    });
    final totalThisMonth = thisMonth.fold<double>(
      0,
      (sum, expense) => sum + expense.jumlah,
    );

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ringkasan Pengeluaran',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _SummaryItem(
                    title: 'Total Pengeluaran',
                    amount: formatter.format(total),
                    icon: Icons.account_balance_wallet,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _SummaryItem(
                    title: 'Bulan Ini',
                    amount: formatter.format(totalThisMonth),
                    icon: Icons.calendar_month,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;
  final Color color;

  const _SummaryItem({
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
