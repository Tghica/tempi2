import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fitness/pages/settings.dart';
import 'package:fitness/pages/ask_a_question.dart';
import 'package:fitness/pages/html/lessons/introduction.dart';
import 'package:fitness/pages/c++/training_c++.dart';

class TrainingHtmlPage extends StatefulWidget {
  const TrainingHtmlPage({super.key});

  @override
  _TrainingHtmlPageState createState() => _TrainingHtmlPageState();
}

class _TrainingHtmlPageState extends State<TrainingHtmlPage> {
  final List<String> htmlLessons = [
    "Introduction",
    "Lesson",
    "Lesson",
    "Tags",
    "Lesson",
    "Lesson",
    "Competition",
    "Forms",
    "Lesson",
    "Lesson",
    "Competition",
  ];

  final List<Widget?> htmlLessonPages = [
    IntroductionHtmlLessonPage(), // for "Introduction"
    null, // for "Lesson"
    null, // for "Lesson"
    null, // for "Tags"
    null, // for "Lesson"
    null, // for "Lesson"
    null, // for "Competition"
    null, // for "Forms"
    null, // for "Lesson"
    null, // for "Lesson"
    null, // for "Competition"
  ];

  String _selectedOption = 'HTML';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HTML Training',
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
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_selectedOption == 'HTML')
                      const Icon(Icons.web, color: Colors.green)
                    else if (_selectedOption == 'C++')
                      const Icon(Icons.code, color: Colors.blue)
                    else
                      const Icon(Icons.language, color: Colors.grey),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        _selectedOption,
                        style: TextStyle(
                          color: _selectedOption == 'HTML'
                              ? Colors.green
                              : _selectedOption == 'C++'
                                  ? Colors.blue
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
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(double.infinity, htmlLessons.length * 90.0),
                    painter: LinePainter(htmlLessons.length),
                  ),
                  ...htmlLessons.asMap().entries.map((entry) {
                    int index = entry.key;
                    String concept = entry.value;

                    const double coefficient = 150;
                    final double y = index * 90.0;
                    final double x = sin(y * pi / 180) * coefficient + 150;

                    Color squareColor;
                    IconData? icon;
                    if (concept == "Lesson") {
                      squareColor = Colors.grey;
                      icon = Icons.book;
                    } else if (concept == "Competition") {
                      squareColor = Colors.orange;
                      icon = Icons.emoji_events;
                    } else {
                      squareColor = Colors.green;
                      icon = Icons.web;
                    }

                    return Positioned(
                      left: x,
                      top: y,
                      child: GestureDetector(
                        onTap: () {
                          final page = htmlLessonPages[index];
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
                            const SizedBox(height: 8),
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
                        backgroundColor: Colors.green,
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
                              builder: (context) => const AskAQuestionPage(previousPage: "html")),
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
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const double coefficient = 150;
    final Path path = Path();
    const double xSquareOffset = 40;
    const double ySquareOffset = 30;
    for (int i = 0; i < itemCount * 90 - 90; i++) {
      double y = 1.0 * i;
      double x = sin(y * pi / 180) * coefficient + 150;

      y += ySquareOffset;
      x += xSquareOffset;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}