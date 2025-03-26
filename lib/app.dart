import 'package:flutter/material.dart';
import 'package:visitorslog/screens/welcome_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Federal Ministry of Finance',
      home: WelcomeScreen(),
    );
  }
}
