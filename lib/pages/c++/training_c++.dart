import 'dart:math'; // Import math library for sin function
import 'package:flutter/material.dart';
import 'package:fitness/pages/settings.dart'; // Ensure this points to the correct file
import 'package:fitness/pages/c++/documentation_c++.dart'; // Import the Documentation page
import 'package:fitness/pages/c++/lessons/introduction.dart';
// Add more as you create them

class TrainingCppPage extends StatefulWidget {
  const TrainingCppPage({super.key});

  @override
  _TrainingCppPageState createState() => _TrainingCppPageState();
}

class _TrainingCppPageState extends State<TrainingCppPage> {
  final List<String> cppLessons = [ // Renamed from cppConcepts to cppLessons
    "Introduction",
    "Lesson",
    "Lesson",
    "Loops",
    "Lesson",
    "Lesson",
    "Competition",
    "Vector",
    "Lesson",
    "Lesson",
    "Competition",
  ];

  // New: List of lesson page routes or widget constructors (null if not implemented)
  final List<Widget?> cppLessonPages = [
    // These should be replaced with the actual lesson widgets you create
    // Example: IntroductionLessonPage(), LoopsLessonPage(), etc.
    IntroductionLessonPage(), // for "Introduction"
    null, // for "Lesson"
    null, // for "Lesson"
    null, // for "Loops"
    null, // for "Lesson"
    null, // for "Lesson"
    null, // for "Competition"
    null, // for "Vector"
    null, // for "Lesson"
    null, // for "Lesson"
    null, // for "Competition"
  ];

  String _selectedOption = 'C++'; // Default to C++
  int _lastPressedButton = -1; // -1 means no button is pressed initially

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (ModalRoute.of(context)?.settings.name == '/training_cpp') {
        setState(() {
          _lastPressedButton = 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'C++ Training',
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
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // Add the CustomPaint widget to draw the line
                  CustomPaint(
                    size: Size(double.infinity, cppLessons.length * 90.0),
                    painter: LinePainter(cppLessons.length),
                  ),
                  ...cppLessons.asMap().entries.map((entry) {
                    int index = entry.key;
                    String concept = entry.value;

                    // Calculate position dynamically
                    const double coefficient = 150; // Coefficient for horizontal offset
                    final double y = index * 90.0; // Vertical offset is always 90
                    final double x = sin(y * pi / 180) * coefficient + 150; // Horizontal offset

                    Color squareColor;
                    IconData? icon;
                    if (concept == "Lesson") {
                      squareColor = Colors.grey;
                      icon = Icons.book;
                    } else if (concept == "Competition") {
                      squareColor = Colors.orange;
                      icon = Icons.emoji_events;
                    } else {
                      squareColor = Colors.blue;
                      icon = Icons.code;
                    }

                    return Positioned(
                      left: x,
                      top: y,
                      child: GestureDetector(
                        onTap: () {
                          final page = cppLessonPages[index];
                          if (page != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page),
                            );
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: squareColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(icon, color: Colors.white, size: 30),
                            ),
                            const SizedBox(height: 8), // Space between square and text
                            Text(
                              concept,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          // Add buttons at the bottom
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
                        backgroundColor: Colors.blue, // Always blue
                        foregroundColor: Colors.white, // Text color for better contrast
                        elevation: 0, // Remove button shadow
                      ),
                      onPressed: () {
                        setState(() {
                          _lastPressedButton = 1; // Track Practice button as pressed
                        });
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DocumentationCppPage()), // Navigate to Documentation
                        );
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

class LinePainter extends CustomPainter {
  final int itemCount;

  LinePainter(this.itemCount);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Change color to match C++ theme
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const double coefficient = 150; // Coefficient for horizontal offset
    final Path path = Path();
    const double xSquareOffset = 40; // so it matches horizontally the square
    const double ySquareOffset = 30; // so it matches vertically the square
    for (int i = 0; i < itemCount * 90 - 90; i++) {
      double y = 1.0 * i; // Vertical offset
      double x = sin(y * pi / 180) * coefficient + 150; // Horizontal offset

      y += ySquareOffset; // Adjust y position for square
      x += xSquareOffset; // Adjust x position for square

      if (i == 0) {
        path.moveTo(x, y); // Move to the first point
      } else {
        path.lineTo(x, y); // Draw a line to the next point
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}