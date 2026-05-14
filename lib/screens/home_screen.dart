import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custom_app_bar.dart';
import 'profile_screen.dart';
import 'report_screen.dart';
import 'courses_screen.dart';
import 'branch_selection_screen.dart';
import 'bmi_screen.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({super.key, this.initialIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _pages = [
    const _HomeBody(),
    const ReportScreen(),
    const CoursesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: _buildLeading(),
        trailing: _buildTrailing(),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget? _buildLeading() {
    switch (_currentIndex) {
      case 0: // Home
        return const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
          ),
        );
      case 1: // Report
      case 2: // Courses
      case 3: // Profile
        return IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFFFAC00C)),
          onPressed: () {},
        );
      default:
        return null;
    }
  }

  Widget? _buildTrailing() {
    switch (_currentIndex) {
      case 0: // Home
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF2C2518),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.notifications_none,
            color: Color(0xFFFAC00C),
            size: 20,
          ),
        );
      case 1: // Report
      case 2: // Courses
        return const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80',
          ),
        );
      case 3: // Profile
        return IconButton(
          icon: const Icon(Icons.settings, color: Color(0xFFFAC00C)),
          onPressed: () {},
        );
      default:
        return null;
    }
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            'Welcome back, Alan',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF33201C),
                ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF3D0), // light yellow
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFFAC00C), width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.bolt, color: Color(0xFFFAC00C), size: 16),
                const SizedBox(width: 4),
                Text(
                  'Active Subscription : Pro Member',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6B5A4E),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Stats Row
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context: context,
                  title: 'ATTENDANCE',
                  icon: Icons.calendar_today,
                  value: '85',
                  unit: '%',
                  bottomWidget: _buildProgressBar(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BmiScreen()),
                    );
                  },
                  child: _buildStatCard(
                    context: context,
                    title: 'BMI',
                    icon: Icons.fitness_center,
                    value: '22.4',
                    unit: '',
                    bottomWidget: Text(
                      'HEALTHY RANGE',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: const Color(0xFFFAC00C),
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Promotional Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF1D3),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unleash the Beast',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1E1E1E),
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Unlock hyper-personalized training\nprotocols and elite meal plans.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF5A4D40),
                      ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BranchSelectionScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFAC00C),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text(
                    'PURCHASE PLAN',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Live Updates Section
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF1D3),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFAC00C), width: 1),
              ),
              child: Text(
                'LIVE UPDATES',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: const Color(0xFF6B5A4E),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Update List
          _buildUpdateTile(
            icon: Icons.check_circle,
            title: 'WORKOUT COMPLETE',
            subtitle: 'Upper body hypertrophy.',
            time: '2h ago',
          ),
          _buildUpdateTile(
            icon: Icons.rocket_launch,
            title: 'NEW CHALLENGE AVAILABLE',
            subtitle: 'The 7-day velocity sprint starts tomorrow.',
            time: '',
            isNew: true,
          ),
          _buildUpdateTile(
            icon: Icons.emoji_events,
            title: 'MILESTONE ACHIEVED',
            subtitle: '10-day workout streak. Keep it up!',
            time: '1d ago',
          ),
          const SizedBox(height: 20), // Padding for bottom nav
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String value,
    required String unit,
    required Widget bottomWidget,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF6EBEB), // light pinkish
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFFFAC00C), size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: const Color(0xFF6B5A4E),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1E1E1E),
                    ),
              ),
              if (unit.isNotEmpty)
                Text(
                  unit,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFAC00C),
                      ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          bottomWidget,
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Stack(
      children: [
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        Container(
          height: 6,
          width: 60, // approximate 85% width
          decoration: BoxDecoration(
            color: const Color(0xFFFAC00C),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }

  Widget _buildUpdateTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    bool isNew = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1D3), // slightly different pale yellow
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFF6B6554),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFFFAC00C), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          letterSpacing: 0.5,
                          color: Color(0xFF1E1E1E),
                        ),
                      ),
                    ),
                    if (isNew)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFAC00C),
                          shape: BoxShape.circle,
                        ),
                      )
                    else
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF5A4D40),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF5A4D40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
