import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'plan_selection_screen.dart';

class BranchSelectionScreen extends StatelessWidget {
  const BranchSelectionScreen({super.key});

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
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  letterSpacing: 1.1,
                ),
                children: const [
                  TextSpan(text: 'LOCATE YOUR '),
                  TextSpan(
                    text: 'ARENA',
                    style: TextStyle(color: Color(0xFFFAC00C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Fine the high-performace studio that matches your momentum.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),

            // Filters
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('NEARBY', isActive: true),
                  _buildFilterChip('PREMIUM'),
                  _buildFilterChip('24/7 ACCESS'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Branch Cards
            _buildBranchCard(
              context,
              imageUrl: 'https://images.unsplash.com/photo-1540497077202-7c8a3999166f?auto=format&fit=crop&w=800&q=80',
              title: 'UNIT 45 FITNESS',
              distance: '0.8 MI',
              rating: 4.8,
              openingInfo: 'Open Closes 12 am',
              address: 'Metro Pillar No - 705, KPCC Junction, 2nd floor',
              tags: ['Crossfit', 'HIIT exercise classes', 'Weight training', 'Nutrition consulting', 'Zumba'],
              crowdLevel: 0.8,
            ),
            const SizedBox(height: 24),
            _buildBranchCard(
              context,
              imageUrl: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=800&q=80',
              title: 'OZONE GYM',
              distance: '1.2 MI',
              rating: 5.4,
              openingInfo: 'Open Closes 1 am',
              address: 'Doraiswamy iyer lane , mahathmagandhi road, kochi',
              tags: ['Aerobics', 'Personal training', 'Youth Sports', 'Yoga class', 'Zumba'],
              crowdLevel: 0.6,
              isPrimary: true,
            ),
            const SizedBox(height: 24),
            _buildBranchCard(
              context,
              imageUrl: 'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?auto=format&fit=crop&w=800&q=80',
              title: 'STARK FITNESS',
              distance: '0.8 MI',
              rating: 5.4,
              openingInfo: 'Open Closes 1 am',
              address: 'Regional sports centre , Gandhinagar , Kochi',
              tags: ['Crossfit', 'HIIT exercise classes', 'Weight training', 'Nutrition consulting', 'Zumba'],
              crowdLevel: 0.4,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFAC00C) : const Color(0xFFFDF1D3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFAC00C).withOpacity(isActive ? 1 : 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: isActive ? Colors.black : Colors.black54,
        ),
      ),
    );
  }

  Widget _buildBranchCard(
    BuildContext context, {
    required String imageUrl,
    required String title,
    required String distance,
    required double rating,
    required String openingInfo,
    required String address,
    required List<String> tags,
    required double crowdLevel,
    bool isPrimary = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1D3).withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFFAC00C).withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
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
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF1D3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.near_me, size: 10, color: Color(0xFFFAC00C)),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAC00C).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Active Now',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),

          // Info Section
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF8B4513),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    ...List.generate(
                        5,
                        (index) => const Icon(
                              Icons.star,
                              size: 18,
                              color: Color(0xFFFAC00C),
                            )),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Color(0xFF8B4513)),
                    const SizedBox(width: 8),
                    Text(
                      'Open',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.green[700],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      openingInfo.split('Open ')[1],
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Capacity Bar
                Stack(
                  children: [
                    Container(
                      height: 6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: crowdLevel,
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAC00C),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags
                      .map((tag) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFDF1D3),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFFAC00C).withOpacity(0.2)),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),

                // Select Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PlanSelectionScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFAC00C),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: const Color(0xFFFAC00C).withOpacity(0.5)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
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
                      'SELECT BRANCH',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
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
