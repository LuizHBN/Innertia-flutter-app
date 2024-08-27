import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:inertia_flutter/login.dart'; // Import necessário para BackdropFilter

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: LoginPage()),
    );
  }
}
