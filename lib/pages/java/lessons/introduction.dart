import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class IntroductionJavaLessonPage extends StatelessWidget {
  const IntroductionJavaLessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Introduction',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF9C4), Color(0xFFFFFDE7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                'Java Variables',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 12),
              const Text(
                'Variables in Java are containers for storing data values. Each variable must be declared with a type before it can be used.',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 12),
              const Text(
                'You can store different kinds of data in variables, such as:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              SizedBox(height: 8),
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
                      text: '- Strings (String): ',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'String city = "London";\n'),
                    TextSpan(
                      text: '- Boolean values (boolean): ',
                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'boolean isOpen = false;'),
                  ],
                ),
              ),
              SizedBox(height: 12),
              const Text(
                'Common operations you can perform on variables include:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              SizedBox(height: 8),
              const Text(
                '- Assigning values: int x = 10;\n'
                '- Arithmetic operations: x + y, x - y, x * y, x / y, x % y\n'
                '- Comparison: x == y, x != y, x < y, x > y, x <= y, x >= y\n'
                '- Logical operations: (x > 0 && y > 0), (x == 1 || y == 1), !(x == y)\n'
                '- Incrementing and decrementing: x++, y--',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 12),
              const Text(
                'Example:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange, width: 1),
                ),
                padding: const EdgeInsets.all(8),
                child: const SelectableText(
                  'int number = 5;\ndouble price = 10.5;\nchar letter = \'A\';\nboolean isActive = true;\nString name = "Alice";',
                  style: TextStyle(fontSize: 16, fontFamily: 'monospace', color: Colors.black87),
                ),
              ),
              SizedBox(height: 24),
              const Text(
                'Reading Variables from a File',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              SizedBox(height: 12),
              const Text(
                'You can read variables from a file using file streams in Java. Here is a simple example:',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange, width: 1),
                ),
                padding: const EdgeInsets.all(8),
                child: HighlightView(
                  'import java.io.*;\nimport java.util.*;\n\npublic class Main {\n  public static void main(String[] args) throws Exception {\n    Scanner file = new Scanner(new File("data.txt"));\n    int number = file.nextInt();\n    String name = file.next();\n    System.out.println("Number: " + number);\n    System.out.println("Name: " + name);\n    file.close();\n  }\n}',
                  language: 'java',
                  theme: atomOneDarkTheme,
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(fontSize: 16, fontFamily: 'monospace'),
                ),
              ),
              SizedBox(height: 12),
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