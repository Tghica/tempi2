import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class IntroductionLessonPage extends StatelessWidget {
  const IntroductionLessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Introduction',
          style: TextStyle(color: Colors.white), // Title stays white
        ),
        centerTitle: true,
        backgroundColor: Colors.blue, // <-- Changed from Colors.deepPurple to Colors.blue
        iconTheme: const IconThemeData(
          color: Colors.white, // <-- This makes the back button white
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFede7f6), Color(0xFFfffde7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                'C++ Variables',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Variables in C++ are containers for storing data values. Each variable must be declared with a type before it can be used.',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 12),
              const Text(
                'You can store different kinds of data in variables, such as:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              const SizedBox(height: 8),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '- Integers (int): ',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'int age = 25;\n'),
                    TextSpan(
                      text: '- Floating point numbers (float, double): ',
                      style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'double pi = 3.14;\n'),
                    TextSpan(
                      text: '- Characters (char): ',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "char grade = 'A';\n"),
                    TextSpan(
                      text: '- Strings (std::string): ',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'std::string city = "London";\n'),
                    TextSpan(
                      text: '- Boolean values (bool): ',
                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'bool isOpen = false;'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Common operations you can perform on variables include:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Assigning values: int x = 10;\n'
                '- Arithmetic operations: x + y, x - y, x * y, x / y, x % y\n'
                '- Comparison: x == y, x != y, x < y, x > y, x <= y, x >= y\n'
                '- Logical operations: (x > 0 && y > 0), (x == 1 || y == 1), !(x == y)\n'
                '- Incrementing and decrementing: x++, y--',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 12),
              const Text(
                'Example:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.deepPurple, width: 1),
                ),
                padding: const EdgeInsets.all(8),
                child: const SelectableText(
                  'int number = 5;\ndouble price = 10.5;\nchar letter = \'A\';\nbool isActive = true;\nstd::string name = "Alice";',
                  style: TextStyle(fontSize: 16, fontFamily: 'monospace', color: Colors.black87),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Reading Variables from a File',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              const SizedBox(height: 12),
              const Text(
                'You can read variables from a file using file streams in C++. Here is a simple example:',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.deepPurple, width: 1),
                ),
                padding: const EdgeInsets.all(8),
                child: HighlightView(
                  '#include <iostream>\n#include <fstream>\nusing namespace std;\n\nint main() {\n  ifstream file("data.txt");\n  int number;\n  string name;\n  if (file >> number >> name) {\n    cout << "Number: " << number << endl;\n    cout << "Name: " << name << endl;\n  }\n  file.close();\n  return 0;\n}',
                  language: 'cpp',
                  theme: atomOneDarkTheme,
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(fontSize: 16, fontFamily: 'monospace'),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'This code reads an integer and a string from a file named "data.txt".',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}