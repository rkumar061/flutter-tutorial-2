import 'package:flutter/material.dart';

class home_view extends StatelessWidget {
  const home_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.yellow,
        child: const Center(
          child: Text(
            'Hello, duniya!',
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
