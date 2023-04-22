import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFFFFF),
      child: SafeArea(
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
