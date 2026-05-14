import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const IntroScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Teamuniversal',
              style: GoogleFonts.murecho(
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFFFAC00C),
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FITNESS',
                  style: GoogleFonts.murecho(
                    textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: const Color(0xFFFAC00C),
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                  ),
                ),
                const SizedBox(width: 12),
                RotatedBox(
                  quarterTurns: 1, // 90 degrees clockwise
                  child: SvgPicture.asset(
                    'assets/icons/course_icon.svg',
                    colorFilter: const ColorFilter.mode(
                      Color(0xFFFAC00C),
                      BlendMode.srcIn,
                    ),
                    height: 36,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'FUSION',
                  style: GoogleFonts.murecho(
                    textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
