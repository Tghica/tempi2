import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tempi/pages/settings.dart';
import 'package:tempi/pages/ask_a_question.dart';
import 'package:tempi/pages/java/lessons/introduction.dart';
import 'package:tempi/pages/c++/training_c++.dart';
import 'package:tempi/pages/html/training_html.dart';

class TrainingJavaPage extends StatefulWidget {
  const TrainingJavaPage({super.key});

  @override
  _TrainingJavaPageState createState() => _TrainingJavaPageState();
}

class _TrainingJavaPageState extends State<TrainingJavaPage> {
  final List<String> javaLessons = [
    "Introduction",
    "Lesson",
    "Lesson",
    "Loops",
    "Lesson",
    "Lesson",
    "Competition",
    "Arrays",
    "Lesson",
    "Lesson",
    "Competition",
  ];

  final List<Widget?> javaLessonPages = [
    IntroductionJavaLessonPage(), // for "Introduction"
    null, // for "Lesson"
    null, // for "Lesson"
    null, // for "Loops"
    null, // for "Lesson"
    null, // for "Lesson"
    null, // for "Competition"
    null, // for "Arrays"
    null, // for "Lesson"
    null, // for "Lesson"
    null, // for "Competition"
  ];

  String _selectedOption = 'Java';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Java Training',
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
                    const PopupMenuItem(
                      value: 'Java',
                      child: Row(
                        children: [
                          Icon(Icons.coffee, color: Color(0xFFFFC300)),
                          SizedBox(width: 10),
                          Text('Java',
                              style: TextStyle(
                                  color: Color(0xFFFFC300),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                );
                if (selected != null) {
                  if (selected == 'C++') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrainingCppPage(),
                      ),
                    );
                  } else if (selected == 'HTML') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrainingHtmlPage(),
                      ),
                    );
                  } else if (selected == 'Java') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrainingJavaPage(),
                      ),
                    );
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_selectedOption == 'Java')
                      const Icon(Icons.coffee, color: Color(0xFFFFC300))
                    else if (_selectedOption == 'C++')
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
                          color: _selectedOption == 'Java'
                              ? Colors.orange
                              : _selectedOption == 'C++'
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
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Faded orange and purple gradient background
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xCCFFB347), // Orange, 80% opacity
                          Color(0xB37B2FF2), // Purple, 70% opacity
                          Color(0xCCFFB347), // Orange, 80% opacity
                        ],
                        stops: [0.0, 0.5, 1.0],
                      ),
                    ),
                  ),
                ),
                // Main content
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(double.infinity, javaLessons.length * 90.0),
                        painter: LinePainter(javaLessons.length),
                      ),
                      ...javaLessons.asMap().entries.map((entry) {
                        int index = entry.key;
                        String concept = entry.value;

                        // Calculate position dynamically
                        const double correction = 20; // Correction to move the sine wave to the right
                        const double coefficient = 150; // Coefficient for horizontal offset
                        final double y = index * 90.0; // Vertical offset is always 90
                        final double x = sin(y * pi / 180) * coefficient + 150 + correction; // Move correction pixels to the right

                        Color squareColor;
                        IconData? icon;
                        if (concept == "Lesson") {
                          squareColor = Colors.grey;
                          icon = Icons.book;
                        } else if (concept == "Competition") {
                          squareColor = Colors.orange;
                          icon = Icons.emoji_events;
                        } else {
                          squareColor = Colors.orange;
                          icon = Icons.coffee;
                        }

                        return Positioned(
                          left: x,
                          top: y + 5,
                          child: GestureDetector(
                            onTap: () {
                              final page = javaLessonPages[index];
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
                                // Icon with white outline
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: squareColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 2.5,
                                        blurRadius: 0,
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: Icon(icon, color: Colors.white, size: 30),
                                ),
                                const SizedBox(height: 8), // Space between square and text
                                Text(
                                  concept,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black26,
                                        offset: Offset(1, 1),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(80),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Text('Practice'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(80),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AskAQuestionPage(previousPage: "java")),
                        );
                      },
                      child: const Text('Ask A Question'),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 0.5,
                bottom: 0,
                child: Container(
                  width: 1,
                  height: 80,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 78,
                child: Container(
                  height: 2,
                  color: Colors.black,
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
      ..color = const Color(0xFFFFC300) // Bright orange for high contrast
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    const double coefficient = 150; // Coefficient for horizontal offset
    final Path path = Path();
    const double correction = 20; // Correction to move the sine wave to the right
    const double xSquareOffset = 40; // so it matches horizontally the square
    const double ySquareOffset = 30; // so it matches vertically the square
    for (int i = 0; i < itemCount * 90 - 90; i++) {
      double y = 1.0 * (i + 1); // Vertical offset
      double x = sin(y * pi / 180) * coefficient + 150 + correction; // Move correction pixels to the right

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