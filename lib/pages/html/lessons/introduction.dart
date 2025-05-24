import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class IntroductionHtmlLessonPage extends StatelessWidget {
  const IntroductionHtmlLessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Introduction',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe8f5e9), Color(0xFFfffde7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                'HTML Elements',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'HTML (HyperText Markup Language) is the standard language for creating web pages. HTML elements are the building blocks of HTML pages.',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 12),
              const Text(
                'Common HTML elements include:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              const SizedBox(height: 8),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '- Headings: ',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '<h1>, <h2>, ... <h6>\n'),
                    TextSpan(
                      text: '- Paragraphs: ',
                      style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '<p>\n'),
                    TextSpan(
                      text: '- Links: ',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '<a>\n'),
                    TextSpan(
                      text: '- Images: ',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '<img>\n'),
                    TextSpan(
                      text: '- Lists: ',
                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '<ul>, <ol>, <li>'),
                  ],
                ),
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
                  border: Border.all(color: Colors.green, width: 1),
                ),
                padding: const EdgeInsets.all(8),
                child: const SelectableText(
                  '<!DOCTYPE html>\n<html>\n  <head>\n    <title>My First HTML Page</title>\n  </head>\n  <body>\n    <h1>Hello, World!</h1>\n    <p>This is a paragraph.</p>\n    <a href="https://example.com">Visit Example</a>\n  </body>\n</html>',
                  style: TextStyle(fontSize: 16, fontFamily: 'monospace', color: Colors.black87),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Displaying Images',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 12),
              const Text(
                'You can display images in HTML using the <img> tag. Example:',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green, width: 1),
                ),
                padding: const EdgeInsets.all(8),
                child: HighlightView(
                  '<img src="cat.jpg" alt="A cat" width="300">',
                  language: 'html',
                  theme: atomOneDarkTheme,
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(fontSize: 16, fontFamily: 'monospace'),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'This code displays an image named "cat.jpg" with a width of 300 pixels.',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}