import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'plan_add_on_screen.dart';

class PlanSelectionScreen extends StatefulWidget {
  const PlanSelectionScreen({super.key});

  @override
  State<PlanSelectionScreen> createState() => _PlanSelectionScreenState();
}

class _PlanSelectionScreenState extends State<PlanSelectionScreen> {

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
                        TextSpan(text: 'CHOOSE YOUR '),
                        TextSpan(
                          text: 'VIBE',
                          style: TextStyle(color: Color(0xFFFAC00C)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                      children: const [
                        TextSpan(text: 'Evaluate your performance at '),
                        TextSpan(
                          text: 'Ozone Gym with plans',
                          style: TextStyle(
                            color: Color(0xFFFAC00C),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(text: ' designed for ultimate Tuff results.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Main Featured Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=800&q=80',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Plan Cards
            _buildPlanCard(
              title: 'Ozone Basic',
              price: '59.66',
              features: [
                'Single branch access.',
                'Locker room and showers.',
                'Standard weight floor.',
              ],
            ),
            
            _buildPlanCard(
              title: 'Ozone Premium',
              price: '78',
              isHighlighted: true,
              features: [
                'Multi branch access.',
                'Unlimited HIIT/Yoga classes.',
                '2 Guest passes per month.',
                'Sauna and Recovery zone.',
              ],
            ),

            _buildPlanCard(
              title: 'Ozone Unlimited',
              price: '89.91',
              features: [
                'Global access(All locations)',
                'Personal coaching.',
                'Bio-metric DNA tracking.',
                'Priority class booking.',
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required List<String> features,
    bool isHighlighted = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFAC00C).withValues(alpha: isHighlighted ? 0.8 : 0.2),
          width: isHighlighted ? 2 : 1,
        ),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: const Color(0xFFFAC00C).withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF8B4513),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '/mo',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...features.map((feature) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFFFAC00C),
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlanAddOnScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFAC00C),
                foregroundColor: Colors.black,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
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
              child: const Text(
                'SELECT PLAN',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
