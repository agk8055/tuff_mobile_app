import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class PurchasedPlansScreen extends StatelessWidget {
  const PurchasedPlansScreen({super.key});

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
            // Active Plans Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: 0.5,
                    ),
                    children: [
                      TextSpan(text: 'Active '),
                      TextSpan(
                        text: 'Plans',
                        style: TextStyle(color: Color(0xFFFAC00C)),
                      ),
                    ],
                  ),
                ),
                Text(
                  '2 PROGRAMS RUNNING',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[600],
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Premium Membership Card
            _buildPremiumPlanCard(),
            const SizedBox(height: 24),

            // Program Card
            _buildProgramCard(),
            const SizedBox(height: 32),

            // Past Purchases Section
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
                children: [
                  TextSpan(text: 'Past '),
                  TextSpan(
                    text: 'Purchases',
                    style: TextStyle(color: Color(0xFFFAC00C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            _buildPastPurchaseItem(
              'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=200&q=80',
              'Fat Loss Blitz',
              'Completed Dec 2023 • 6 Weeks',
            ),
            _buildPastPurchaseItem(
              'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=200&q=80',
              'Beginner Strength',
              'Completed Aug 2023 • 4 Weeks',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumPlanCard() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?auto=format&fit=crop&w=800&q=80',
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
              Colors.black.withValues(alpha: 0.7),
            ],
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAC00C),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'PREMIUM',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.verified_user, color: Color(0xFFFAC00C), size: 18),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              'Elite Membership',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Valid until Oct 2024',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFAC00C),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'ACTIVE NOW',
                          style: TextStyle(
                            color: Color(0xFFFAC00C),
                            fontSize: 11,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAC00C),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Access Gym',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
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

  Widget _buildProgramCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(40),
        border: const Border(
          left: BorderSide(color: Color(0xFFFAC00C), width: 6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hypertrophy Program',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '42%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFAC00C),
                    ),
                  ),
                  Text(
                    'PROGRESS',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[600],
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Advanced 12-week module focused on progressive overload and muscular density.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          Stack(
            children: [
              Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAC00C).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Container(
                height: 6,
                width: 140, // 42% of width roughly
                decoration: BoxDecoration(
                  color: const Color(0xFFFAC00C),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildMiniIcon(Icons.fitness_center),
                  const SizedBox(width: 8),
                  _buildMiniIcon(Icons.timer_outlined),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAC00C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Start Training',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFFFEF9E7),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: const Color(0xFFFAC00C), size: 18),
    );
  }

  Widget _buildPastPurchaseItem(String imageUrl, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(imageUrl, width: 60, height: 60, fit: BoxFit.cover),
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
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.receipt_long, color: Color(0xFFFAC00C), size: 24),
          ),
        ],
      ),
    );
  }
}
