
import 'package:currancyrate/Screen/currency.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(
      
      textTheme: TextTheme(
        bodyMedium:GoogleFonts.urbanist(
       fontWeight: FontWeight.w700,
       fontSize: 14,
       color: Colors.white
    ),
    bodyLarge:GoogleFonts.urbanist(
       fontWeight: FontWeight.w600,
       fontSize: 24,
       color: Colors.white
    ),
      )
     ),
     debugShowCheckedModeBanner: false,
     home: const Currencies(),
     
    );
  }
}

