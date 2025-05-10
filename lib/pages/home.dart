import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fitness/pages/settings.dart'; // Ensure this points to the correct file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedOption = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tempi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTapDown: (TapDownDetails details) async {
                final RenderBox box = context.findRenderObject() as RenderBox;
                final Offset offset = box.localToGlobal(Offset.zero);
                final selected = await showMenu<String>(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    offset.dx,
                    offset.dy + kToolbarHeight,
                    offset.dx + 1,
                    offset.dy,
                  ),
                  items: [
                    const PopupMenuItem(
                      value: 'C++',
                      child: Row(
                        children: [
                          Icon(Icons.code, color: Colors.blue),
                          SizedBox(width: 10),
                          Text('C++',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'HTML',
                      child: Row(
                        children: [
                          Icon(Icons.web, color: Colors.green),
                          SizedBox(width: 10),
                          Text('HTML',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                );
                if (selected != null) {
                  setState(() => _selectedOption = selected);
                  log('$selected selected');
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_selectedOption == 'C++')
                      const Icon(Icons.code, color: Colors.blue)
                    else if (_selectedOption == 'HTML')
                      const Icon(Icons.web, color: Colors.green)
                    else
                      const Icon(Icons.language, color: Colors.grey),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        _selectedOption,
                        style: TextStyle(
                          color: _selectedOption == 'C++'
                              ? Colors.blue
                              : _selectedOption == 'HTML'
                                  ? Colors.green
                                  : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()), // Updated to SettingsPage
              );
            },
          ),
        ],
      ),
    );
  }
}
