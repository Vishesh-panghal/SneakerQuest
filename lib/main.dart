import 'package:flutter/material.dart';

import 'authentication/login.dart';
import 'homePage_NikeStore.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NikeHomePage(),
    );
  }
}
