import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  void _navigateToSignup() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentPage == 3 ? Colors.black : Colors.white,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          physics: const BouncingScrollPhysics(),
          children: [
            _buildLightPage(
              pageIndex: 0,
              title: 'Push Beyond Your Limits.',
              subtitle:
                  'Unlock your true potential with personalized workouts and expert guidance tailored just for you.',
              illustration: const Icon(Icons.fitness_center, size: 100, color: Colors.grey),
            ),
            _buildLightPage(
              pageIndex: 1,
              title: 'Train Smart. Stay Consistent.',
              subtitle:
                  'Track progress, follow structured programs, and stay on top of your fitness journey every single day.',
              illustration: const Icon(Icons.directions_run, size: 100, color: Colors.grey),
            ),
            _buildLightPage(
              pageIndex: 2,
              title: 'Your Fitness Journey Starts\nHere.',
              subtitle:
                  'Build strength, improve endurance, and transform your lifestyle—one workout at a time.',
              illustration: const Icon(Icons.sports_gymnastics, size: 100, color: Colors.grey),
            ),
            _buildDarkPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildLightPage({
    required int pageIndex,
    required String title,
    required String subtitle,
    required Widget illustration,
  }) {
    return Column(
      children: [
       
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (pageIndex == 0)
                TextButton(
                  onPressed: _navigateToLogin,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Color(0xFFFAC00C)),
                    ),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFFFAC00C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              else
                const SizedBox(height: 48), // Match height of skip button
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: Container(
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: index <= pageIndex
                        ? const Color(0xFFFAC00C)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Main Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: illustration,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: const Color(0xFFFAC00C),
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Bottom Button
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onNextPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFAC00C),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'NEXT',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDarkPage() {
    return Column(
      children: [
        // Image section
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/start_image.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
        // Text and buttons section
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(text: 'Train '),
                          TextSpan(
                              text: 'Smarter',
                              style: TextStyle(color: Color(0xFFFAC00C))),
                          TextSpan(text: '. Move '),
                          TextSpan(
                              text: 'Stronger',
                              style: TextStyle(color: Color(0xFFFAC00C))),
                          TextSpan(text: '.\nBecome '),
                          TextSpan(
                              text: 'Unstoppable',
                              style: TextStyle(color: Color(0xFFFAC00C))),
                          TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _navigateToSignup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFAC00C),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'START',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _navigateToLogin,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.white24,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Already our user ?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.white24,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: _navigateToLogin,
                  child: const Text(
                    'Continue with your existing account >',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
