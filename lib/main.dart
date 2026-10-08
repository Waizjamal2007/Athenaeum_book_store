import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const AthenaeumApp());
}

class AthenaeumApp extends StatelessWidget {
  const AthenaeumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Athenaeum',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      home: const LoginScreen(),
    );
  }
}