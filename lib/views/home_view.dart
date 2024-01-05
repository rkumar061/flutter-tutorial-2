import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/calculator_view.dart';

class home_view extends StatelessWidget {
  const home_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: SafeArea(
        child: calculator_view(),
      ),
    );
  }
}
