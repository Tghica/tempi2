import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitness/pages/map.dart'; // Import map.dart

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fitness App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0, // Removes the shadow
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/arrow-left-svgrepo-com.svg'),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const MapPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(-1.0, 0.0); // Start from the left
                const end = Offset.zero; // End at the current position
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                position: offsetAnimation,
                child: child,
                );
              },
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/dots-horizontal-double-svgrepo-com.svg'),
            onPressed: () {
              // Handle settings icon press
            },
          ),
        ],
      ),
    );
  }
}