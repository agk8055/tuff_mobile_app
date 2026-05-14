import 'package:flutter/material.dart';
import 'payment_success_screen.dart';

class PaymentProcessingScreen extends StatefulWidget {
  const PaymentProcessingScreen({super.key});

  @override
  State<PaymentProcessingScreen> createState() => _PaymentProcessingScreenState();
}

class _PaymentProcessingScreenState extends State<PaymentProcessingScreen> {
  @override
  void initState() {
    super.initState();
    _simulateProcessing();
  }

  void _simulateProcessing() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PaymentSuccessScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: 0.75,
                    strokeWidth: 12,
                    backgroundColor: const Color(0xFF1E1E1E).withOpacity(0.1),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFAC00C)),
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF9E7),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.bolt, color: Color(0xFFFAC00C), size: 60),
                      const Text(
                        '75%',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFAC00C),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            const Text(
              'PROCESSING YOUR',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            const Text(
              'TRANSFORMATION..',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFFFAC00C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
