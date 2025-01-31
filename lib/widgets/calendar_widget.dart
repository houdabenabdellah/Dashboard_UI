import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ui_dashboard/themes/theme_provider.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Card(
      elevation: 4,
      color: isDarkMode ? const Color(0xFF352F44) : const Color(0xFFB9B4C7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calendar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            TableCalendar(
              firstDay: DateTime.utc(
                  2025, 1, 1), // First date the calendar can display
              lastDay: DateTime.utc(
                  2025, 12, 31), // Last date the calendar can display
              focusedDay: _focusedDay.isBefore(DateTime.utc(2025, 1, 1))
                  ? DateTime.utc(2025, 1, 1)
                  : (_focusedDay.isAfter(DateTime.utc(2025, 12, 31))
                      ? DateTime.utc(2025, 12, 31)
                      : _focusedDay), // Ensure focusedDay is within range
              calendarFormat:
                  _calendarFormat, // Calendar format (month, week, etc.)
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format; // Update calendar format
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay; // Update focused date
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xFF5C5470)
                      : const Color(0xFF5C5470),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: isDarkMode
                      ? const Color(0xFF5C5470)
                      : const Color(0xFF5C5470),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                selectedTextStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                defaultTextStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                weekendTextStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                formatButtonTextStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                formatButtonDecoration: BoxDecoration(
                  border: Border.all(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
