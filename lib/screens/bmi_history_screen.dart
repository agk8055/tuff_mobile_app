import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class BmiHistoryScreen extends StatelessWidget {
  const BmiHistoryScreen({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Last Entry Card
            _buildLastEntryCard(),
            const SizedBox(height: 32),

            // Trend Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'TREND',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF9E7),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.3)),
                  ),
                  child: const Text(
                    'Last 6 months',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF8B4513),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTrendChart(),
            const SizedBox(height: 32),

            // Logs Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'LOGS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFAC00C),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildLogItem('Oct 15, 2025', '22.5', '68.2kg'),
            _buildLogItem('Sep 28, 2025', '22.8', '69.1kg'),
            _buildLogItem('Sep 10, 2025', '23.1', '70.2kg'),
            const SizedBox(height: 80), // Space for FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFAC00C),
        foregroundColor: Colors.black,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }

  Widget _buildLastEntryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.more_horiz, color: Color(0xFFFAC00C)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'LAST ENTRY',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF8B735B),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Healthy',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF5D4037),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildSubStatCard(
                      label: 'BMI SCORE',
                      value: '22.4',
                      unit: 'pts',
                      borderColor: const Color(0xFFFAC00C),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSubStatCard(
                      label: 'WEIGHT',
                      value: '80',
                      unit: 'kg',
                      borderColor: const Color(0xFF5D4037),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubStatCard({
    required String label,
    required String value,
    required String unit,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          left: BorderSide(color: borderColor, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: Color(0xFF8B735B),
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFAC00C),
                  ),
                ),
                TextSpan(
                  text: ' $unit',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8B735B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendChart() {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7).withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: _TrendLinePainter(),
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MonthLabel('MAY'),
              _MonthLabel('JUN'),
              _MonthLabel('JUL'),
              _MonthLabel('AUG'),
              _MonthLabel('SEP'),
              _MonthLabel('OCT', isHighlighted: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogItem(String date, String bmi, String weight) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFFEF9E7),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.calendar_today, color: Color(0xFFFAC00C), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'ENTRY WEIGHT',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: bmi,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFFAC00C),
                      ),
                    ),
                    const TextSpan(
                      text: ' BMI',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                weight,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MonthLabel extends StatelessWidget {
  final String label;
  final bool isHighlighted;

  const _MonthLabel(this.label, {this.isHighlighted = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 12,
        fontWeight: isHighlighted ? FontWeight.w900 : FontWeight.w700,
        color: isHighlighted ? const Color(0xFFFAC00C) : Colors.grey[500],
        letterSpacing: 0.5,
      ),
    );
  }
}

class _TrendLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFAC00C)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final dotPaint = Paint()
      ..color = const Color(0xFF5D4037)
      ..style = PaintingStyle.fill;

    final lastDotPaint = Paint()
      ..color = const Color(0xFFFAC00C)
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Sample points for the line chart
    final points = [
      Offset(size.width * 0.05, size.height * 0.8),
      Offset(size.width * 0.2, size.height * 0.75),
      Offset(size.width * 0.4, size.height * 0.65),
      Offset(size.width * 0.6, size.height * 0.55),
      Offset(size.width * 0.8, size.height * 0.6),
      Offset(size.width * 0.95, size.height * 0.45),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    
    // Simple curve using quadratic bezier
    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final xc = (p0.dx + p1.dx) / 2;
      final yc = (p0.dy + p1.dy) / 2;
      path.quadraticBezierTo(p0.dx, p0.dy, xc, yc);
    }
    
    // Finish to the last point
    path.lineTo(points.last.dx, points.last.dy);

    canvas.drawPath(path, paint);

    // Draw dots
    for (int i = 0; i < points.length; i++) {
      if (i == points.length - 1) {
        canvas.drawCircle(points[i], 8, lastDotPaint);
      } else {
        canvas.drawCircle(points[i], 5, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
