import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const AthenaeumApp());
}

class AthenaeumApp extends StatelessWidget {
  const AthenaeumApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Athenaeum',
      home: LoginScreen(),
    );
  }
}