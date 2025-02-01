import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChartCard(
              context,
              title: 'Monthly Revenue',
              child: SizedBox(
                height: 200,
                child: _buildRevenueChart(isDarkMode),
              ),
            ),
            const SizedBox(height: 20),
            _buildChartCard(
              context,
              title: 'User Growth',
              child: SizedBox(
                height: 200,
                child: _buildUserGrowthChart(isDarkMode),
              ),
            ),
            const SizedBox(height: 20),
            _buildChartCard(
              context,
              title: 'Task Completion Rate',
              child: SizedBox(
                height: 200,
                child: _buildTaskCompletionChart(isDarkMode),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildChartCard(BuildContext context, {required String title, required Widget child}) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Card(
      elevation: 8, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: isDarkMode
                ? [
                    const Color.fromARGB(255, 223, 214, 205),
                    const Color(0xFFFAF0E6),
                  ]
                : [
                    const Color.fromARGB(255, 85, 76, 108),
                    const Color(0xFF352F44),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.black : Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }

  // Example: Monthly Revenue Chart
  Widget _buildRevenueChart(bool isDarkMode) {
    return BarChart(
      BarChartData(
        
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(toY: 5000, color: Colors.blue),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(toY: 7500, color: Colors.blue),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(toY: 10000, color: Colors.blue),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(toY: 6000, color: Colors.blue),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(toY: 9000, color: Colors.blue),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(toY: 12000, color: Colors.blue),
            ],
          ),
        ],
        
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                return Text(
                  months[value.toInt()],
                  style: TextStyle(
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(show: false),
      ),
    );
  }

  // Example: User Growth Chart
  Widget _buildUserGrowthChart(bool isDarkMode) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 100),
              FlSpot(1, 200),
              FlSpot(2, 400),
              FlSpot(3, 600),
              FlSpot(4, 800),
              FlSpot(5, 1000),
            ],
            isCurved: true,
            color: Colors.green,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                return Text(
                  months[value.toInt()],
                  style: TextStyle(
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(show: false),
      ),
    );
  }

  // Example: Task Completion Chart
  Widget _buildTaskCompletionChart(bool isDarkMode) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 75,
            color: Colors.green,
            title: '75%',
            radius: 50,
            titleStyle: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          PieChartSectionData(
            value: 25,
            color: Colors.red,
            title: '25%',
            radius: 50,
            titleStyle: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        sectionsSpace: 0,
        centerSpaceRadius: 40,
      ),
    );
  }
}