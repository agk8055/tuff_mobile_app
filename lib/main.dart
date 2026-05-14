import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFAC00C), 
          primary: const Color(0xFFFAC00C),
          surface: const Color(0xFFFAFAFA),
        ),
        textTheme: GoogleFonts.lexendTextTheme(
          Theme.of(context).textTheme.copyWith(
            displayLarge: GoogleFonts.poppins(color: const Color(0xFF33201C)),
            displayMedium: GoogleFonts.poppins(color: const Color(0xFF33201C)),
            displaySmall: GoogleFonts.poppins(color: const Color(0xFF33201C)),
            headlineLarge: GoogleFonts.poppins(color: const Color(0xFF33201C)),
            headlineMedium: GoogleFonts.poppins(color: const Color(0xFF33201C)),
            headlineSmall: GoogleFonts.poppins(color: const Color(0xFF33201C)),
            titleLarge: GoogleFonts.poppins(color: const Color(0xFF33201C)),
            titleMedium: GoogleFonts.poppins(color: const Color(0xFF33201C)),
            titleSmall: GoogleFonts.poppins(color: const Color(0xFF33201C)),
          ),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
