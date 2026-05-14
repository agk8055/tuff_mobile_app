import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'checkout_screen.dart';

class PlanAddOnScreen extends StatelessWidget {
  const PlanAddOnScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 1.2,
                ),
                children: [
                  TextSpan(text: 'BOOST YOUR '),
                  TextSpan(
                    text: 'RESULT',
                    style: TextStyle(color: Color(0xFFFAC00C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Enhance your Training with premium add-ons tailored to your specific fitness journey.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 32),

            _buildAddOnCard(
              context,
              imageUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=800&q=80',
              category: 'Elite Performance',
              categoryIcon: Icons.fitness_center,
              title: 'Personal Training',
              description: '1-On-1 sessions with expert coaches.',
              price: '40',
              isAdded: true,
            ),

            const SizedBox(height: 24),

            _buildAddOnCard(
              context,
              imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd?auto=format&fit=crop&w=800&q=80',
              category: 'Expert Guidance',
              categoryIcon: Icons.restaurant,
              title: 'Pro Dietician',
              description: 'Custom nutrition plans and weekly check-ins',
              price: '25',
              isAdded: false,
            ),

            const SizedBox(height: 32),

            // Info Box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF9E7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, color: Color(0xFFFAC00C), size: 24),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'You can also add or change these anytime later in your subscription settings. We adapt as your goals evolve.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Checkout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutScreen()),
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
                ).copyWith(
                  overlayColor: WidgetStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
                        return const Color(0xFFE5AE0B); // Darker yellow
                      }
                      return null;
                    },
                  ),
                ),
                child: const Text(
                  'GO TO CHECKOUT',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAddOnCard(
    BuildContext context, {
    required String imageUrl,
    required String category,
    required IconData categoryIcon,
    required String title,
    required String description,
    required String price,
    bool isAdded = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.2)),
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
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAC00C).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(categoryIcon, size: 14, color: const Color(0xFF8B4513)),
                      const SizedBox(width: 6),
                      Text(
                        category,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      '+\$$price',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFFAC00C),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '/session',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFAC00C),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: const Color(0xFFFAC00C).withValues(alpha: 0.5),
                        ),
                      ),
                    ).copyWith(
                      overlayColor: WidgetStateProperty.resolveWith<Color?>(
                        (states) {
                          if (states.contains(WidgetState.hovered) || states.contains(WidgetState.pressed)) {
                            return const Color(0xFFE5AE0B); // Darker yellow
                          }
                          return null;
                        },
                      ),
                    ),
                    child: Text(
                      isAdded ? 'ADDED TO PLAN' : 'ADD TO PLAN',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
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
