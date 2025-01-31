import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDarkMode ? const Color(0xFF352F44) : const Color(0xFFFAF0E6),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                headingRowColor: WidgetStateColor.resolveWith(
                  (states) => isDarkMode ? const Color(0xFFB9B4C7) : const Color(0xFF5C5470),
                ),
                dataRowColor: WidgetStateColor.resolveWith(
                  (states) => isDarkMode ?  Colors.white : const Color(0xFF352F44),
                ),
                border: TableBorder.all(
                  color: isDarkMode ? Colors.white30 : Colors.black26,
                  width: 1,
                ),
                columns: const [
                  DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('User', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('2025-01-28')),
                    DataCell(Text('John Doe')),
                    DataCell(Text('\$120.00')),
                    DataCell(Text('Completed')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2025-01-27')),
                    DataCell(Text('Jane Smith')),
                    DataCell(Text('\$250.00')),
                    DataCell(Text('Pending')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2025-01-26')),
                    DataCell(Text('Michael Lee')),
                    DataCell(Text('\$75.00')),
                    DataCell(Text('Failed')),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
