import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Color lineColor = themeProvider.themeMode == ThemeMode.dark
        ? Colors.black
        : Colors.white;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 8, // Add shadow for a stylish look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: themeProvider.themeMode == ThemeMode.dark
                  ? [
                    
                      const Color.fromARGB(255, 223, 214, 205),
                      const Color(0xFFFAF0E6),
                      
                    ]
                  : [
                    Color.fromARGB(255, 85, 76, 108),
                      Color(0xFF352F44),
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Monthly Performance',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              AspectRatio(
                aspectRatio: 1.7,
                child: LineChart(
                  showAvg ? avgData(lineColor) : mainData(lineColor),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    showAvg = !showAvg;
                  });
                },
                child: Text(
                  showAvg ? 'Show Main Data' : 'Show Average',
                  style: TextStyle(
                    fontSize: 14,
                    color: lineColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData mainData(Color color) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: color.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: color.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (double value, TitleMeta meta) {
              const style = TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              );
              String text;
              switch (value.toInt()) {
                case 0:
                  text = 'Jan';
                  break;
                case 1:
                  text = 'Feb';
                  break;
                case 2:
                  text = 'Mar';
                  break;
                case 3:
                  text = 'Apr';
                  break;
                case 4:
                  text = 'May';
                  break;
                default:
                  text = '';
              }
              return Text(text, style: style);
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 40,
            getTitlesWidget: (double value, TitleMeta meta) {
              const style = TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              );
              return Text(
                value.toInt().toString(),
                style: style,
                textAlign: TextAlign.left,
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 1),
            FlSpot(2, 4),
            FlSpot(3, 2),
            FlSpot(4, 5),
          ],
          isCurved: true,
          color: color,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.3),
                color.withOpacity(0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData(Color color) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: color.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: color.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (double value, TitleMeta meta) {
              const style = TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              );
              String text;
              switch (value.toInt()) {
                case 0:
                  text = 'Jan';
                  break;
                case 1:
                  text = 'Feb';
                  break;
                case 2:
                  text = 'Mar';
                  break;
                case 3:
                  text = 'Apr';
                  break;
                case 4:
                  text = 'May';
                  break;
                default:
                  text = '';
              }
              return Text(text, style: style);
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 40,
            getTitlesWidget: (double value, TitleMeta meta) {
              const style = TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              );
              return Text(
                value.toInt().toString(),
                style: style,
                textAlign: TextAlign.left,
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 2.5),
            FlSpot(1, 2.5),
            FlSpot(2, 2.5),
            FlSpot(3, 2.5),
            FlSpot(4, 2.5),
          ],
          isCurved: true,
          color: color,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.3),
                color.withOpacity(0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}