import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_dashboard/screens/analytics_screen.dart';
import 'package:ui_dashboard/screens/dashboard_screen.dart';
import 'package:ui_dashboard/screens/login_screen.dart';
import 'package:ui_dashboard/screens/profil_screen.dart';
import 'package:ui_dashboard/screens/rendezvous_screen.dart';


import '../themes/theme_provider.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; 

  // List of screens to display
  final List<Widget> _screens = [
    const DashboardScreen(),
    const RendezVousScreen(), 
    const AnalyticsScreen(), 
    const ProfileScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      key: GlobalKey<ScaffoldState>(), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 40,
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xFF352F44).withOpacity(0.2)
                : Colors.white70.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle:
                  TextStyle(color: isDarkMode ? Colors.white : Colors.black54),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search,
                  color: isDarkMode ? Colors.white : Colors.black54),
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Builder(
              
              builder: (context) => PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'login') {
                    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const LoginScreen()),
);
                  } else if (value == 'settings') {
                    Scaffold.of(context).openDrawer(); 
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'login',
                    child: Row(
                      children: [
                        Icon(Icons.login,
                            color:
                                isDarkMode ? Colors.black87 : Colors.white70),
                        const SizedBox(width: 10),
                        const Text('Login'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'settings',
                    child: Row(
                      children: [
                        Icon(Icons.settings,
                            color:
                                isDarkMode ?Colors.black87 : Colors.white70 ),
                        const SizedBox(width: 10),
                        const Text('Settings'),
                      ],
                    ),
                  ),
                ],
                icon: const CircleAvatar(
                  backgroundImage: AssetImage('images/profil.jpg'),
                  radius: 20,
                ),
                color: isDarkMode ? Colors.white : const Color(0xFF5C5470),
              ),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: themeProvider.themeMode == ThemeMode.dark
                    ? const Color(0xFF352F44)
                    : const Color(0xFFB9B4C7),
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Light Mode'),
                  Switch(
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      themeProvider.toggleTheme(value);
                    },
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Help & Support'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; 
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Rendez-Vous',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: isDarkMode ? const Color.fromARGB(255, 175, 165, 206) : const Color.fromARGB(255, 93, 82, 120),
        unselectedItemColor: isDarkMode ? const Color(0xFF352F44) : const Color(0xFFB9B4C7),
        backgroundColor:
            isDarkMode ? const Color(0xFF352F44) : const Color(0xFFB9B4C7),
      ),

      
    );
  }
}
