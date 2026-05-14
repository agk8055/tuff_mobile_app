import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'bmi_screen.dart';
import 'subscription_details_screen.dart';
import 'attendance_report_screen.dart';
import 'bmi_history_screen.dart';
import 'purchased_plans_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        children: [
          // Profile Header
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFFAC00C), width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=400&q=80',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFAC00C),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.verified, size: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  ' Alan',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF33201C),
                        letterSpacing: 0.5,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ELITE STATUS • SINCE 2024',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Stats Row
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  'HEIGHT',
                  '175',
                  'cm',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context,
                  'WEIGHT',
                  '68',
                  'kg',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BmiScreen()),
                    );
                  },
                  child: _buildStatCard(
                    context,
                    'BMI',
                    '22.4',
                    'Healthy',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Action List
          _buildActionItem(
            context,
            icon: Icons.badge,
            title: 'Subscription Details',
            subtitle: 'ELITE MEMBER',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionDetailsScreen()),
              );
            },
          ),
          _buildActionItem(
            context,
            icon: Icons.calendar_today,
            title: 'Attendance Report',
            subtitle: '24 SESSIONS THIS MONTH',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendanceReportScreen()),
              );
            },
          ),
          _buildActionItem(
            context,
            icon: Icons.analytics,
            title: 'BMI History',
            subtitle: 'STABLE PERFORMANCE',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BmiHistoryScreen()),
              );
            },
          ),
          _buildActionItem(
            context,
            icon: Icons.shopping_bag,
            title: 'Purchased Plans',
            subtitle: '3 ACTIVE TRAINING MODULES',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PurchasedPlansScreen()),
              );
            },
          ),

          const SizedBox(height: 24),

          // Edit Profile Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFFAC00C)),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Color(0xFF6B5A4E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Logout Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFAC00C),
                foregroundColor: Colors.black,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 12),
                  Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, String unit) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1D3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xFF8B735B),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E1E1E),
            ),
          ),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF8B735B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFFAC00C).withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color(0xFFFFF7E6),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFFFAC00C), size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Color(0xFF1E1E1E),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.grey[600],
            letterSpacing: 0.5,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.black),
      ),
    );
  }
}
