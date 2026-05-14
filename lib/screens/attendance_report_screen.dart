import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class AttendanceReportScreen extends StatelessWidget {
  const AttendanceReportScreen({super.key});

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
            // Monthly Overview Title
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
                children: [
                  TextSpan(text: 'Monthly '),
                  TextSpan(
                    text: 'Overview',
                    style: TextStyle(color: Color(0xFFFAC00C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Overview Cards
            Row(
              children: [
                Expanded(
                  child: _buildOverviewCard(
                    title: 'Total Sessions',
                    value: '24',
                    subtitle: 'SESSIONS',
                    icon: Icons.fitness_center,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildOverviewCard(
                    title: 'Attendance Rate',
                    value: '70',
                    unit: '%',
                    subtitle: 'CONSISTENCY',
                    icon: Icons.analytics,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Calendar Section
            _buildCalendarSection(),
            const SizedBox(height: 24),

            // Consistency Streak Card
            _buildStreakCard(),
            const SizedBox(height: 32),

            // Recent Sessions Section
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
                children: [
                  TextSpan(text: 'RECENT '),
                  TextSpan(
                    text: 'SESSIONS',
                    style: TextStyle(color: Color(0xFFFAC00C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _buildRecentSession(
              icon: Icons.fitness_center,
              title: 'Oct 21: Full Body Power',
              subtitle: 'Strength • High Intensity',
              duration: '65m',
            ),
            _buildRecentSession(
              icon: Icons.self_improvement,
              title: 'Oct 20: Recovery Flow',
              subtitle: 'Mobility • Active Recovery',
              duration: '30m',
            ),
            _buildRecentSession(
              icon: Icons.bolt,
              title: 'Oct 19: Metabolic Burn',
              subtitle: 'Cardio • HIIT',
              duration: '45m',
            ),

            const SizedBox(height: 24),

            // Bottom Summary Cards
            Row(
              children: [
                Expanded(
                  child: _buildBottomSummaryCard(
                    title: 'TOP ACTIVITY',
                    content: 'Hypertrophy',
                    icon: Icons.fitness_center,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildBottomSummaryCard(
                    title: '',
                    content: '+12%',
                    subtitle: 'VELOCITY',
                    icon: Icons.trending_up,
                    isHighlight: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCard({
    required String title,
    required String value,
    String? unit,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            bottom: -10,
            child: Icon(
              icon,
              size: 80,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8B4513),
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: value,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFFAC00C),
                      ),
                    ),
                    if (unit != null)
                      TextSpan(
                        text: unit,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFAC00C),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[600],
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarSection() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final attendance = [1, 2, 4, 5, 6, 7, 9, 10, 13, 14, 15, 16, 17, 18, 20];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          const Text(
            'FEBRUARY 2026',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Color(0xFFFAC00C),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: days
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF8B4513),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 12,
            ),
            itemCount: 35, // 5 weeks
            itemBuilder: (context, index) {
              final dayNumber = index - 5; // Simplified logic for demo
              if (dayNumber < 1 || dayNumber > 28) return const SizedBox.shrink();

              final isAttended = attendance.contains(dayNumber);

              return Column(
                children: [
                  Text(
                    '$dayNumber',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: dayNumber > 0 ? Colors.black : Colors.grey[300],
                    ),
                  ),
                  if (isAttended)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFAC00C),
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStreakCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFFEF9E7),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.whatshot, color: Color(0xFFFAC00C), size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Consistency Streak',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '12 DAY STREAK',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFFAC00C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSession({
    required IconData icon,
    required String title,
    required String subtitle,
    required String duration,
  }) {
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
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFFEF9E7),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFFFAC00C), size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            duration,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Color(0xFFFAC00C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSummaryCard({
    required String title,
    required String content,
    String? subtitle,
    required IconData icon,
    bool isHighlight = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: isHighlight ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          if (isHighlight) ...[
             Icon(icon, color: Colors.black, size: 24),
             const SizedBox(height: 8),
          ] else ...[
             Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: Color(0xFF8B4513),
              ),
            ),
            const SizedBox(height: 8),
          ],
          Row(
            mainAxisAlignment: isHighlight ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              if (!isHighlight) ...[
                Icon(icon, color: const Color(0xFFFAC00C), size: 18),
                const SizedBox(width: 8),
              ],
              Text(
                content,
                style: TextStyle(
                  fontSize: isHighlight ? 24 : 16,
                  fontWeight: FontWeight.w900,
                  color: isHighlight ? const Color(0xFFFAC00C) : Colors.black,
                ),
              ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: Colors.grey[600],
                letterSpacing: 0.5,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
