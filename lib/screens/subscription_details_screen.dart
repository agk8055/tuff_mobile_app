import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class SubscriptionDetailsScreen extends StatelessWidget {
  const SubscriptionDetailsScreen({super.key});

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
            // Membership Card
            _buildMembershipCard(),
            const SizedBox(height: 20),

            // Info Cards Row
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard(
                    title: 'UPCOMING CHARGE',
                    content: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '\$19.99',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFFAC00C),
                            ),
                          ),
                          TextSpan(
                            text: ' /mo',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8B735B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    footer: Row(
                      children: [
                        const Icon(Icons.sync, size: 16, color: Color(0xFFFAC00C)),
                        const SizedBox(width: 4),
                        Text(
                          'Auto-Renewal active',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildInfoCard(
                    icon: Icons.credit_card,
                    title: 'Manage payment method',
                    content: Text(
                      'Visa ending in **** 4242',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Benefits Section
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
                children: [
                  TextSpan(text: 'YOUR '),
                  TextSpan(
                    text: 'BENEFITS',
                    style: TextStyle(color: Color(0xFFFAC00C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _buildBenefitItem(
              icon: Icons.fitness_center,
              title: 'Unlimited Gym Access',
              subtitle: '24/7 access to all worldwide locations',
            ),
            _buildBenefitItem(
              icon: Icons.support_agent,
              title: 'Personal Coach Support',
              subtitle: 'Priority chat with expert trainers',
            ),
            _buildBenefitItem(
              icon: Icons.restaurant_menu,
              title: 'Diet Plans',
              subtitle: 'Customized nutrition based on goals',
            ),

            const SizedBox(height: 32),

            // Action Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEF9E7),
                  foregroundColor: const Color(0xFF8B4513),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Color(0xFFFAC00C), width: 1),
                  ),
                ),
                child: const Text(
                  'UPGRADE PLAN',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Cancel Subscription',
                  style: TextStyle(
                    color: Color(0xFFFAC00C),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMembershipCard() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=800&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.8),
            ],
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFAC00C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Active Plan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'ELITE MEMBERSHIP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'ACTIVE • SINCE 2023',
              style: TextStyle(
                color: Color(0xFFFAC00C),
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Next Billing : Jan 2023',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    IconData? icon,
    required String title,
    required Widget content,
    Widget? footer,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFFFFF7E6),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFFFAC00C), size: 24),
            ),
            const SizedBox(height: 12),
          ],
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: Color(0xFF8B4513),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          content,
          if (footer != null) ...[
            const SizedBox(height: 8),
            footer,
          ],
        ],
      ),
    );
  }

  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
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
            child: Icon(icon, color: const Color(0xFFFAC00C), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
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
