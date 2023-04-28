// Student Number: 220030521
// Surname Initial: Direko T

import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Error',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
