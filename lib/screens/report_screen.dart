import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Date
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
              children: const [
                TextSpan(text: 'Weekly '),
                TextSpan(
                  text: 'Review',
                  style: TextStyle(color: Color(0xFFFAC00C)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 18, color: Color(0xFFFAC00C)),
              const SizedBox(width: 8),
              Text(
                'Mar 14 - Mar 20',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Daily Activity Chart
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF1D3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Daily Activity',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF8B4513).withOpacity(0.8),
                          ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDF1D3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Active',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF8B4513),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Intensity points earned per day',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildBar(context, 'MON', 0.6),
                    _buildBar(context, 'TUE', 0.8),
                    _buildBar(context, 'WED', 0.4),
                    _buildBar(context, 'THU', 0.9),
                    _buildBar(context, 'FRI', 0.7),
                    _buildBar(context, 'SAT', 1.0, isSpecial: true),
                    _buildBar(context, 'SUN', 0.2),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Stats Row
          Row(
            children: [
              Expanded(
                child: _buildSmallStatCard(
                  context,
                  icon: Icons.favorite,
                  iconColor: const Color(0xFFC05A11),
                  title: 'RECOVERY SCORE',
                  value: '88',
                  unit: '%',
                  subtitle: 'Optimum Readiness',
                  borderColor: const Color(0xFFC05A11),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildSmallStatCard(
                  context,
                  icon: Icons.local_fire_department,
                  iconColor: const Color(0xFFFAC00C),
                  title: 'AVG DAILY CALORIES',
                  value: '2,450',
                  unit: 'KCAL',
                  subtitle: '12% VS Last week',
                  isHighlight: true,
                  borderColor: const Color(0xFFFAC00C),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Focus Areas Section
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
              children: const [
                TextSpan(text: 'Focus '),
                TextSpan(
                  text: 'Areas',
                  style: TextStyle(color: Color(0xFFFAC00C)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildFocusAreaTile(
            context,
            icon: Icons.fitness_center,
            title: 'STRENGTH TRAINING',
            percentage: 82,
            color: const Color(0xFFFAC00C),
          ),
          const SizedBox(height: 16),
          _buildFocusAreaTile(
            context,
            icon: Icons.directions_run,
            title: 'CARDIO / ENDURANCE',
            percentage: 65,
            color: const Color(0xFF8B4513),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildBar(BuildContext context, String label, double heightFactor, {bool isSpecial = false}) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 24,
          decoration: BoxDecoration(
            color: const Color(0xFFFDF1D3),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100 * heightFactor,
            width: 24,
            decoration: BoxDecoration(
              color: isSpecial ? const Color(0xFF8B4513) : const Color(0xFFFAC00C),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSmallStatCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required String unit,
    required String subtitle,
    required Color borderColor,
    bool isHighlight = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          left: BorderSide(color: borderColor, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E1E1E),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: isHighlight ? const Color(0xFFFAC00C) : const Color(0xFF8B4513),
                    ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (isHighlight)
                const Icon(Icons.trending_up, color: Color(0xFFFAC00C), size: 14),
              if (isHighlight) const SizedBox(width: 4),
              Expanded(
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFocusAreaTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int percentage,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFAC00C).withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF8B4513), size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$percentage ',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: color,
                      ),
                    ),
                    const TextSpan(
                      text: '%',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF1D3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              FractionallySizedBox(
                widthFactor: percentage / 100,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
