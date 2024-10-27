import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Slice',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0XFFFBF4F4),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0XFFFBF4F4)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
