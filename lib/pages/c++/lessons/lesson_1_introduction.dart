import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter/services.dart';

class Lesson1IntroductionPage extends StatefulWidget {
  const Lesson1IntroductionPage({super.key});

  @override
  State<Lesson1IntroductionPage> createState() => _Lesson1IntroductionPageState();
}

class _Lesson1IntroductionPageState extends State<Lesson1IntroductionPage> {
  double _dividerPosition = 0.5; // 0.0 = top, 1.0 = bottom
  bool _showHint1 = false;
  bool _showHint2 = false;

  bool _showTypeBar = false; // <-- Add this line
  bool _showCircle = true; // Add a new state variable to control the visibility of the circle

  final TextEditingController _typeBarController = TextEditingController(); // <-- Add this line

  TextEditingController _editorController = TextEditingController(
    text: '''
#include <iostream>
using namespace std;

int main() {
  cout << "Hello, C++!" << endl;
  return 0;
}
''',
  );

  final FocusNode _keyboardListenerFocusNode = FocusNode();
  final FocusNode _editorFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _editorController.addListener(() {
      setState(() {}); // This will rebuild the widget and update the bottom code window
    });
  }

  @override
  void dispose() {
    _editorController.dispose();
    _editorFocusNode.dispose();
    _keyboardListenerFocusNode.dispose();
    _typeBarController.dispose(); // <-- Add this line
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 1: Introduction', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue, // Match introduction.dart
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFede7f6), Color(0xFFfffde7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            const dividerHeight = 16.0;
            const circleDiameter = 32.0;
            final height = constraints.maxHeight - dividerHeight;
            final topHeight = height * _dividerPosition;
            final bottomHeight = height * (1 - _dividerPosition);

            return Stack(
              children: [
                Column(
                  children: [
                    ClipRect(
                      child: SizedBox(
                        height: topHeight,
                        child: AnimatedOpacity(
                          opacity: topHeight < 40 ? 0.0 : 1.0,
                          duration: const Duration(milliseconds: 150),
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(height: 24),
                                  const Text(
                                    'This is the first exercise.',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue), // was deepPurple
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Task: Calculate the total price for 3 apples and 2 bananas.\n'
                                    'If one apple costs 4 and one banana costs 2, use C++ variables and\n'
                                    'addition and multiplication to find the total.',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 24),
                                  // Floating dot style Hint 1
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showHint1 = !_showHint1;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blue.withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: const Icon(Icons.lightbulb, color: Colors.white, size: 28),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showHint1 = !_showHint1;
                                      });
                                    },
                                    child: const Text(
                                      "Hint 1",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue, // was deepPurple
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    child: _showHint1
                                        ? Padding(
                                            key: const ValueKey('hint1'),
                                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                                            child: Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color: Colors.teal.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: Colors.teal, width: 1),
                                              ),
                                              child: const Text(
                                                'Use variables for the prices and quantities.',
                                                style: TextStyle(fontSize: 16, color: Colors.teal),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  const SizedBox(height: 24),
                                  // Floating dot style Hint 2
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showHint2 = !_showHint2;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blue.withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: const Icon(Icons.lightbulb, color: Colors.white, size: 28),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showHint2 = !_showHint2;
                                      });
                                    },
                                    child: const Text(
                                      "Hint 2",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue, // was deepPurple
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    child: _showHint2
                                        ? Padding(
                                            key: const ValueKey('hint2'),
                                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                                            child: Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color: Colors.teal.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: Colors.teal, width: 1),
                                              ),
                                              child: const Text(
                                                'Multiply the price by the quantity for each fruit, then add.',
                                                style: TextStyle(fontSize: 16, color: Colors.teal),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                  const SizedBox(height: 32),
                                  const Text(
                                    "Don't forget to use the AI!!",
                                    style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (details) {
                        setState(() {
                          _dividerPosition += details.delta.dy / height;
                          final minBottom = 80.0 / height;
                          _dividerPosition = _dividerPosition.clamp(0.0, 1 - minBottom);
                        });
                      },
                      child: Container(
                        height: dividerHeight,
                        color: Colors.blue,
                        child: const Center(
                          child: Icon(Icons.drag_handle, color: Colors.white),
                        ),
                      ),
                    ),
                    ClipRect(
                      child: SizedBox(
                        height: bottomHeight,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Stack(
                            children: [
                              // Syntax-highlighted code in the background
                              Positioned.fill(
                                child: HighlightView(
                                  _editorController.text,
                                  language: 'cpp',
                                  theme: atomOneDarkTheme,
                                  padding: const EdgeInsets.all(12),
                                  textStyle: const TextStyle(fontSize: 16, fontFamily: 'monospace'),
                                ),
                              ),
                              // Transparent TextField on top
                              Shortcuts(
                                shortcuts: <LogicalKeySet, Intent>{
                                  LogicalKeySet(LogicalKeyboardKey.tab): const InsertTabIntent(),
                                },
                                child: Actions(
                                  actions: <Type, Action<Intent>>{
                                    InsertTabIntent: CallbackAction<InsertTabIntent>(
                                      onInvoke: (InsertTabIntent intent) {
                                        final value = _editorController.value;
                                        final selection = value.selection;
                                        final text = value.text;
                                        final newText = text.replaceRange(
                                          selection.start,
                                          selection.end,
                                          '    ', // 4 spaces
                                        );
                                        final newSelectionIndex = selection.start + 4;
                                        _editorController.value = value.copyWith(
                                          text: newText,
                                          selection: TextSelection.collapsed(offset: newSelectionIndex),
                                        );
                                        return null;
                                      },
                                    ),
                                  },
                                  child: TextField(
                                    focusNode: _editorFocusNode,
                                    controller: _editorController,
                                    maxLines: null,
                                    expands: true,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'monospace',
                                      color: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      height: 1.2,
                                      letterSpacing: 0,
                                    ),
                                    cursorColor: Colors.blue, // for textfields
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ),
                    ),
                  ],
                ),
                // The floating circle or type bar
                Positioned(
                  right: 5, // Keep 5 pixels from the right
                  top: (height * _dividerPosition) + (dividerHeight / 2) - (circleDiameter / 2) - 30,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      // Slide in from right for the bar, fade for the button
                      if (child.key == const ValueKey('typebar')) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      } else {
                        // Fade for the button
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      }
                    },
                    child: _showTypeBar
                        ? SizedBox(
                            key: const ValueKey('typebar'), // <-- Key moved here
                            width: 320,
                            height: circleDiameter,
                            child: Container(
                              width: 320,
                              height: circleDiameter,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                                border: Border.all(color: Colors.blue, width: 2), // for borders
                              ),
                              child: Stack(
                                children: [
                                  // The TextField
                                  Positioned(
                                    left: 0,
                                    right: 40,
                                    top: 8,
                                    bottom: 0,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: TextField(
                                        controller: _typeBarController,
                                        autofocus: true,
                                        decoration: const InputDecoration(
                                          hintText: "Ask Helpy here ...", // <-- Updated hint
                                          border: InputBorder.none,
                                          isCollapsed: true,
                                          contentPadding: EdgeInsets.only(top: 4, bottom: 8),
                                        ),
                                        style: const TextStyle(fontSize: 16),
                                        onSubmitted: (value) {
                                          setState(() {
                                            _showTypeBar = false;
                                            _showCircle = true;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  // The X button
                                  Positioned(
                                    top: -10,
                                    right: -15,
                                    child: IconButton(
                                      icon: const Icon(Icons.close, color: Colors.blue), // for close icon
                                      onPressed: () {
                                        setState(() {
                                          _showTypeBar = false;
                                          _showCircle = true;
                                        });
                                      },
                                      tooltip: "Close",
                                      padding: const EdgeInsets.all(0),
                                      constraints: const BoxConstraints(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(
                            key: const ValueKey('circle'), // <-- Key added here
                            width: 320,
                            height: circleDiameter,
                            child: Visibility(
                              visible: _showCircle,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showTypeBar = true;
                                    _showCircle = false;
                                  });
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: circleDiameter,
                                    height: circleDiameter,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(Icons.star, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class InsertTabIntent extends Intent {
  const InsertTabIntent();
}