import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app/provider/solar_provider.dart';
import 'package:space_app/screen/splash_screen/splash_page.dart';

void main() {
  runApp(const AstroLearnApp());
}

class AstroLearnApp extends StatelessWidget {
  const AstroLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SolorProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
