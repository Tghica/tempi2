import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Prevents the default back arrow
        title: Text('Map Page'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward), // Back arrow icon
            onPressed: () {
              Navigator.pop(context); // Navigate back to the HomePage
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset('assets/images/monkey.png'),
      ),
    );
  }
}