import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme_provider.dart';

class RendezVousScreen extends StatefulWidget {
  const RendezVousScreen({super.key});

  @override
  State<RendezVousScreen> createState() => _RendezVousScreenState();
}

class _RendezVousScreenState extends State<RendezVousScreen> {
  // Dummy list of rendezvous (replace with your data source)
  List<Map<String, dynamic>> _rendezvousList = [
    {
      'name': 'John Doe',
      'place': 'Paris',
      'date': '2023-10-15',
      'isTreated': true,
    },
    {
      'name': 'Jane Smith',
      'place': 'Lyon',
      'date': '2023-10-20',
      'isTreated': false,
    },
  ];

  // Function to add a new rendezvous
  void _addRendezVous() {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        String place = '';
        String date = '';
        bool isTreated = false;

        return AlertDialog(
          title: const Text('Add Rendez-Vous'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Place'),
                onChanged: (value) => place = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
                onChanged: (value) => date = value,
              ),
              SwitchListTile(
                title: const Text('Bien Traité'),
                value: isTreated,
                onChanged: (value) => isTreated = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _rendezvousList.add({
                    'name': name,
                    'place': place,
                    'date': date,
                    'isTreated': isTreated,
                  });
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Function to edit a rendezvous
  void _editRendezVous(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String name = _rendezvousList[index]['name'];
        String place = _rendezvousList[index]['place'];
        String date = _rendezvousList[index]['date'];
        bool isTreated = _rendezvousList[index]['isTreated'];

        return AlertDialog(
          title: const Text('Edit Rendez-Vous'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: TextEditingController(text: name),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Place'),
                controller: TextEditingController(text: place),
                onChanged: (value) => place = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
                controller: TextEditingController(text: date),
                onChanged: (value) => date = value,
              ),
              SwitchListTile(
                title: const Text('Bien Traité'),
                value: isTreated,
                onChanged: (value) => isTreated = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _rendezvousList[index] = {
                    'name': name,
                    'place': place,
                    'date': date,
                    'isTreated': isTreated,
                  };
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Function to delete a rendezvous
  void _deleteRendezVous(int index) {
    setState(() {
      _rendezvousList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      
      body: ListView.builder(
        itemCount: _rendezvousList.length,
        itemBuilder: (context, index) {
          final rendezvous = _rendezvousList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: isDarkMode ? const Color(0xFF5C5470) : const Color(0xFFFAF0E6),
            child: ListTile(
              title: Text(
                rendezvous['name'],
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Place: ${rendezvous['place']}',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  Text(
                    'Date: ${rendezvous['date']}',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  Text(
                    'Status: ${rendezvous['isTreated'] ? 'Bien Traité' : 'En Attente'}',
                    style: TextStyle(
                      color: rendezvous['isTreated'] ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: isDarkMode ? Colors.white : Colors.black),
                    onPressed: () => _editRendezVous(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteRendezVous(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRendezVous,
        backgroundColor: isDarkMode ? const Color(0xFF5C5470) : const Color(0xFFB9B4C7),
        child: Icon(Icons.add, color: isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}