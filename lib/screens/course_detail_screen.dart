import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'course_watching_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Hero Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=800&q=80',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Course Info
            const Text(
              'STRENGTH',
              style: TextStyle(
                color: Color(0xFFFAC00C),
                fontWeight: FontWeight.w900,
                fontSize: 14,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mastering Swiss Ball Training',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF8B4513),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildCourseStat(Icons.access_time, '45 MINS'),
                const SizedBox(width: 16),
                _buildCourseStat(Icons.bolt, 'HARD'),
                const SizedBox(width: 16),
                _buildCourseStat(Icons.people_outline, '1.2k ENROLLED'),
              ],
            ),
            const SizedBox(height: 32),

            // Course Overview
            _buildSectionHeader('COURSE', 'OVERVIEW'),
            const SizedBox(height: 12),
            Text(
              'Elevate your metabolic conditioning with this high-intensity hybrid program. Hyper-Burn Metcon combines explosive movements with targeted functional training for elite results.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.6,
              ),
            ),
            const SizedBox(height: 32),

            // Curriculam
            _buildSectionHeader('CURRICULAM', ''),
            const SizedBox(height: 16),
            _buildLessonTile(
              context,
              number: '01',
              title: 'Metcon Fundamentals',
              subtitle: '12:00 MIN • INTRO',
              isCompleted: true,
            ),
            _buildLessonTile(
              context,
              number: '02',
              title: 'The Warm-Up',
              subtitle: '8:40 MIN • PREP',
              isPlaying: true,
            ),
            _buildLessonTile(
              context,
              number: '03',
              title: 'Core Activation',
              subtitle: '10:40 MIN • DRILL',
              isLocked: true,
            ),
            _buildLessonTile(
              context,
              number: '04',
              title: 'The Warm-Up',
              subtitle: '8:40 MIN • MAIN',
              isLocked: true,
            ),
            _buildLessonTile(
              context,
              number: '05',
              title: 'The Warm-Up',
              subtitle: '8:40 MIN • COOLDOWN',
              isLocked: true,
            ),

            const SizedBox(height: 32),

            // Coach Profile
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'COACH DAVID KINKAID',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF8B4513),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'MASTER TRAINER',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xFFFAC00C).withOpacity(0.8),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'David is a former pro athlete with 12+ years of experience in metabolic conditioning and functional strength. He specializes in high-output training protocols.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCoachStat('24', 'COURSES'),
                      _buildCoachStat('15 k', 'STUDENTS'),
                      _buildCoachStat('4.9', 'RATING'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseStat(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFFFAC00C)),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String blackText, String yellowText) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFFFAC00C),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              letterSpacing: 1.2,
            ),
            children: [
              TextSpan(text: '$blackText '),
              TextSpan(
                text: yellowText,
                style: const TextStyle(color: Color(0xFFFAC00C)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLessonTile(
    BuildContext context, {
    required String number,
    required String title,
    required String subtitle,
    bool isCompleted = false,
    bool isPlaying = false,
    bool isLocked = false,
  }) {
    return GestureDetector(
      onTap: isLocked
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CourseWatchingScreen(
                    imageUrl: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=800&q=80',
                  ),
                ),
              );
            },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: (isPlaying || isCompleted)
              ? const Color(0xFFFDF1D3).withOpacity(0.3)
              : const Color(0xFFFDF1D3).withOpacity(0.1),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: (isPlaying || isCompleted) ? const Color(0xFFFAC00C) : const Color(0xFFFDF1D3),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 24)
                    : isPlaying
                        ? const Icon(Icons.play_arrow, color: Colors.white, size: 24)
                        : Text(
                            number,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Color(0xFF8B4513),
                            ),
                          ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            if (isLocked)
              const Icon(Icons.lock_outline, color: Colors.grey, size: 20)
            else if (isPlaying)
              const Icon(Icons.bar_chart, color: Color(0xFF8B4513), size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCoachStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color(0xFFFAC00C),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            color: Colors.grey,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
