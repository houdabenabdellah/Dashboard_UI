import 'package:flutter/material.dart';
import 'package:ui_dashboard/widgets/calendar_widget.dart';
import 'package:ui_dashboard/widgets/chart_widget.dart';
import 'package:ui_dashboard/widgets/data_table_widget.dart';
import '../widgets/quick_stats_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            // Quick Stats Cards
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                final List<Map<String, dynamic>> stats = [
                  {
                    'title': 'Users',
                    'value': '120',
                    'icon': Icons.people,
                  },
                  {
                    'title': 'Revenue',
                    'value': '\$5,200',
                    'icon': Icons.attach_money,
                  },
                  {
                    'title': 'New Orders',
                    'value': '45',
                    'icon': Icons.shopping_cart,
                  },
                  {
                    'title': 'Support Tickets',
                    'value': '10',
                    'icon': Icons.support_agent,
                  },
                ];
                return QuickStatsCard(
                  title: stats[index]['title'],
                  value: stats[index]['value'],
                  icon: stats[index]['icon'],
                );
              },
            ),
            const SizedBox(height: 20),
            // Chart Widget
            const LineChartWidget(),
            const SizedBox(height: 20),
            // Data Table Widget
            const DataTableWidget(),
            const SizedBox(height: 20),
            // Calendar Widget
            const CalendarWidget(),
          ],
        ),
      ),
    );
  }
}