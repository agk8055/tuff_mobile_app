import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'dart:math' as math;

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFAC00C)),
          onPressed: () => Navigator.pop(context),
        ),
        trailing: const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // BMI Gauge Section
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(280, 140),
                    painter: _BmiGaugePainter(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        '22.4',
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDF1D3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'HEALTHY RANGE',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF8B4513),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Weight Card
            Container(
              width: 140,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF1D3).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const Text(
                    'WEIGHT',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text(
                        '68',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFAC00C),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'kg',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // BMI Trends Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BMI Trends',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Past 6 months activity',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDF1D3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          '-1.2%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFFAC00C),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Simulated Chart
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: _BmiChartPainter(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('JAN', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.black54)),
                      Text('FEB', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.black54)),
                      Text('MAR', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.black54)),
                      Text('APR', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.black54)),
                      Text('MAY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.black54)),
                      Text('JUN', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Coach Insight Box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF1F1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.bolt, color: Color(0xFFFAC00C), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'COACH INSIGHT',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF8B4513),
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(text: 'Our BMI is consistent. Keep focusing on '),
                        TextSpan(
                          text: 'protein intake',
                          style: TextStyle(color: const Color(0xFFFAC00C).withValues(alpha: 0.9), fontWeight: FontWeight.w800),
                        ),
                        const TextSpan(text: ' to maintain lean mass.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Buttons Row
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFFAC00C)),
                      backgroundColor: const Color(0xFFFEF9E7),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Download Full PDF Report',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF8B4513),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFAC00C),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'View Weekly',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 16),
                      ],
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

class _BmiGaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    final backgroundPaint = Paint()
      ..color = const Color(0xFFFAC00C).withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 24
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = const Color(0xFFFAC00C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 24
      ..strokeCap = StrokeCap.round;

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      backgroundPaint,
    );

    // Draw progress arc (simulating 22.4 BMI which is in middle-ish)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * 0.75,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BmiChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFAC00C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.3, size.width * 0.3, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.45, size.height * 0.7, size.width * 0.6, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.8, size.width * 0.9, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.1);

    canvas.drawPath(path, paint);

    // Draw end dot
    final dotPaint = Paint()
      ..color = const Color(0xFFFAC00C)
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.4), 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
