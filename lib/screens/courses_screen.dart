import 'package:flutter/material.dart';
import '../widgets/continue_watching_card.dart';
import 'course_watching_screen.dart';
import 'course_detail_screen.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                  children: const [
                    TextSpan(text: 'Continue '),
                    TextSpan(
                      text: 'Watching',
                      style: TextStyle(color: Color(0xFFFAC00C)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF1D3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFFAC00C).withOpacity(0.5)),
                ),
                child: const Text(
                  '2 Active Sessions',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF8B4513),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

         
          ContinueWatchingCard(
            imageUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
            title: 'Hyper-Burn Metcon',
            coach: "Sarah 'The storm' vance",
            progress: 0.65,
            timeLeft: '12.04 LEFT',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CourseWatchingScreen(
                    imageUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ContinueWatchingCard(
            imageUrl: 'https://images.unsplash.com/photo-1518611012118-696072aa579a?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
            title: 'Dynamic Flow Mastery',
            coach: "Marcus Thorne",
            progress: 0.40,
            timeLeft: '12.04 LEFT',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CourseWatchingScreen(
                    imageUrl: 'https://images.unsplash.com/photo-1518611012118-696072aa579a?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 32),

      
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
              children: const [
                TextSpan(text: 'Featured '),
                TextSpan(
                  text: 'Courses',
                  style: TextStyle(color: Color(0xFFFAC00C)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Featured Courses List
          _buildFeaturedCourseCard(
            context,
            imageUrl: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=800&q=80',
            tag: 'HARD',
            title: 'Mastering Swiss Ball Training',
            duration: '65 MIN',
            description: 'Master the snatch and clean & jerk with elite level technical breakdown and explosive..',
            coachName: 'COACH DAVID KINKAID',
            coachImageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=100&q=80',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CourseDetailScreen()),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildFeaturedCourseCard(
            context,
            imageUrl: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
            tag: 'MEDIUM',
            title: 'Sports Yoga Mastery',
            duration: '45 MIN',
            description: 'Enhance your athletic performance with Sports Yoga for Athletic Performance..',
            coachName: 'COACH GEORGE PT',
            coachImageUrl: 'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=100&q=80',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CourseDetailScreen()),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildFeaturedCourseCard(
            context,
            imageUrl: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
            tag: 'EASY',
            title: 'Elite Recovery Flow',
            duration: '30 MIN',
            description: 'Gentle movement and target release for sore muscles.The perfect end to High..',
            coachName: 'COACH SANE IRSHI',
            coachImageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&auto=format&fit=crop&w=100&q=80',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CourseDetailScreen()),
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildFeaturedCourseCard(
    BuildContext context, {
    required String imageUrl,
    required String tag,
    required String title,
    required String duration,
    required String description,
    required String coachName,
    required String coachImageUrl,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFDF1D3).withOpacity(0.2),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFFAC00C).withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  child: Image.network(
                    imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAC00C),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF8B4513),
                          ),
                        ),
                      ),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFFAC00C),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundImage: NetworkImage(coachImageUrl),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            coachName,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDF1D3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'READ MORE',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward, size: 12, color: Color(0xFFFAC00C)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
