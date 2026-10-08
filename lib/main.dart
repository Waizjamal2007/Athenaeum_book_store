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
      title: 'Athenaeum Book Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}