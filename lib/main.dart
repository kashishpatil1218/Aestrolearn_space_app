import 'package:flutter/material.dart';
import 'package:space_app/screen/splash_screen/splash_page.dart';

void main() {
  runApp(const AstroLearnApp());
}

class AstroLearnApp extends StatelessWidget {
  const AstroLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
