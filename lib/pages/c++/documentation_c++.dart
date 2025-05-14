import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fitness/pages/settings.dart'; // Ensure this points to the correct file
import 'package:fitness/pages/c++/training_c++.dart'; // Import the Training page

class DocumentationCppPage extends StatefulWidget {
  const DocumentationCppPage({super.key});

  @override
  _DocumentationCppPageState createState() => _DocumentationCppPageState();
}

class _DocumentationCppPageState extends State<DocumentationCppPage> {
  String _selectedOption = 'C++'; // Default to C++
  int _lastPressedButton = 2; // Default to Documentation button being active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'C++ Documentation',
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
                MaterialPageRoute(builder: (context) => const SettingsPage()), // Navigate to SettingsPage
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Main Content Here',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(80), // Set button height to 80
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Remove button border radius
                        ),
                        backgroundColor: _lastPressedButton == 1
                            ? Colors.blue // Highlight Practice button
                            : Colors.white, // Default color
                        foregroundColor: _lastPressedButton == 1
                            ? Colors.white // Text color for highlighted button
                            : Colors.black, // Default text color
                        elevation: 0, // Remove button shadow
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TrainingCppPage()), // Navigate to Training page
                        );
                      },
                      child: const Text('Practice'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(80), // Set button height to 80
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Remove button border radius
                        ),
                        backgroundColor: _lastPressedButton == 2
                            ? Colors.green // Highlight Documentation button
                            : Colors.white, // Default color
                        foregroundColor: _lastPressedButton == 2
                            ? Colors.white // Text color for highlighted button
                            : Colors.black, // Default text color
                        elevation: 0, // Remove button shadow
                      ),
                      onPressed: () {
                        setState(() {
                          _lastPressedButton = 2; // Track Documentation button as pressed
                        });
                        log('Documentation button pressed');
                      },
                      child: const Text('Documentation'),
                    ),
                  ),
                ],
              ),
              // Vertical line in the middle
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 0.5, // Center the line
                bottom: 0, // Align to the bottom
                child: Container(
                  width: 1, // Line width
                  height: 80, // Line height
                  color: Colors.black, // Line color
                ),
              ),
              // Horizontal line dividing buttons from the rest
              Positioned(
                left: 0, // Start from the left edge
                right: 0, // Extend to the right edge
                bottom: 78, // Position 80 pixels from the bottom
                child: Container(
                  height: 2, // Line height
                  color: Colors.black, // Line color
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}