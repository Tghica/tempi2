import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Prevents the default back arrow
        title: const Text('Settings Page'),
        centerTitle: true,
        leading: IconButton( // Moved the arrow to the left side
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Image.asset('assets/images/monkey.png'),
      ),
    );
  }
}