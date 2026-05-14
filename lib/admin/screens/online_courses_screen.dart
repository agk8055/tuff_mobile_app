import 'package:flutter/material.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/admin_app_bar.dart';
import 'admin_dashboard.dart';
import 'branch_management.dart';
import 'trainer_mangaement.dart';
import 'user_role_screen.dart';
import 'members_screen.dart';
import 'plan_management_screen.dart';
import 'report_screen.dart';




class OnlineCoursesScreen extends StatelessWidget {
  const OnlineCoursesScreen({super.key});

  final Color primaryYellow = const Color(0xFFFAC00C);
  final Color creamBg = const Color(0xFFFFFDF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AdminAppBar(title: "Online Courses"),
      drawer: Drawer(
        child: AdminSidebar(
          selectedItem: "Online Courses",
          onItemSelected: (item) {
            Navigator.pop(context);
            _navigateTo(context, item);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 1100;
          
          return Row(
            children: [
              if (isDesktop)
                AdminSidebar(
                  selectedItem: "Online Courses",
                  onItemSelected: (item) => _navigateTo(context, item),
                ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(isDesktop ? 16 : 0),
                  decoration: BoxDecoration(
                    color: creamBg,
                    borderRadius: BorderRadius.circular(isDesktop ? 32 : 0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(isDesktop ? 32 : 0),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(isDesktop ? 40 : 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(isDesktop),
                          const SizedBox(height: 32),
                          if (constraints.maxWidth > 900)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left Column: Stats and Categories
                                SizedBox(
                                  width: 300,
                                  child: Column(
                                    children: [
                                      _buildLibraryHealth(),
                                      const SizedBox(height: 24),
                                      _buildCategories(),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 32),
                                // Right Column: Course Grid
                                Expanded(
                                  child: _buildCourseGrid(constraints.maxWidth),
                                ),
                              ],
                            )
                          else
                            Column(
                              children: [
                                _buildLibraryHealth(),
                                const SizedBox(height: 24),
                                _buildCategories(),
                                const SizedBox(height: 32),
                                _buildCourseGrid(constraints.maxWidth),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(bool isDesktop) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Courses & Curriculam",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: isDesktop ? 28 : 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "Manage your digital training library and monitor student engagement all Tuff learing platform.",
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 14,
                  color: primaryYellow.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildLibraryHealth() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("LIBRARY HEALTH", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 32),
          _buildStatRow("Enrollment", "12.4 k", 0.7, primaryYellow),
          const SizedBox(height: 24),
          _buildStatRow("Completion", "64%", 0.64, const Color(0xFF8D6E63)),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value, double progress, Color color) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, color: Colors.brown)),
            Text(value, style: TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, color: color)),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey.shade200,
          color: color,
          minHeight: 10,
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return _cardWrapper(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("CATEGORIES", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 16)),
              Icon(Icons.edit_note, color: primaryYellow),
            ],
          ),
          const SizedBox(height: 20),
          _categoryTile("Strength", "12", isSelected: true, icon: Icons.bolt),
          _categoryTile("Cardio", "8", icon: Icons.directions_run),
          _categoryTile("Nutrition", "15", icon: Icons.restaurant),
          _categoryTile("Yoga & Flow", "4", icon: Icons.self_improvement),
          _categoryTile("Mindset", "3", icon: Icons.lightbulb_outline),
        ],
      ),
    );
  }

  Widget _categoryTile(String title, String count, {bool isSelected = false, required IconData icon}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? primaryYellow : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: isSelected ? Colors.black : Colors.black54),
              const SizedBox(width: 12),
              Text(title, style: TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, color: isSelected ? Colors.black : Colors.black87)),
            ],
          ),
          CircleAvatar(
            radius: 12,
            backgroundColor: isSelected ? Colors.black.withValues(alpha: 0.1) : Colors.brown.shade50,
            child: Text(count, style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseGrid(double width) {
    int crossAxisCount = width > 1200 ? 3 : (width > 600 ? 2 : 1);
    
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 0.85,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _courseCard("STRENGTH TRAINING", "HIIT Fundamentals", "12 Videos", "6h 45m", true),
        _courseCard("RESTORACTIVE", "Yoga Flow", "4 Videos", "10h 30m", true),
        _courseCard("NUTRITION", "Macro Mastery", "15 Videos", "4h 30m", false),
        _courseCard("ENDURANCE", "Marathon Prep", "12 Videos", "6h 45m", true),
        _courseCard("POWER LIFTING", "Powerlifting 101", "8 Videos", "8h 45m", true),
        _createNewCard(),
      ],
    );
  }

  Widget _courseCard(String tag, String title, String videos, String time, bool isProtected) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    color: Colors.grey.shade300, 
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5), 
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isProtected ? Icons.lock_outline_rounded : Icons.lock_open_rounded, 
                          size: 10, 
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isProtected ? "Protected" : "UnProtected", 
                          style: const TextStyle(
                            fontFamily: 'Lexend',
                            color: Colors.white,
                            fontSize: 8, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  tag, 
                  style: TextStyle(
                    fontFamily: 'Poppins', 
                    fontSize: 11, 
                    fontWeight: FontWeight.w900, 
                    color: Colors.brown.shade400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title, 
                  style: const TextStyle(
                    fontFamily: 'Lexend', 
                    fontWeight: FontWeight.bold, 
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.videocam_outlined, size: 16, color: primaryYellow),
                    const SizedBox(width: 4),
                    Text(videos, style: const TextStyle(fontSize: 10, fontFamily: 'Lexend', color: Colors.grey)),
                    const SizedBox(width: 12),
                    Icon(Icons.access_time, size: 16, color: primaryYellow),
                    const SizedBox(width: 4),
                    Text(time, style: const TextStyle(fontSize: 10, fontFamily: 'Lexend', color: Colors.grey)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createNewCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryYellow, style: BorderStyle.solid, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: primaryYellow,
            child: const Icon(Icons.add, color: Colors.black),
          ),
          const SizedBox(height: 16),
          const Text(
            "CREATE NEW COURSE", 
            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 14)
          ),
          const SizedBox(height: 8),
          const Text(
            "Design a new training program\nfor your athlets",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Lexend', fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _cardWrapper({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryYellow.withValues(alpha: 0.1)),
      ),
      child: child,
    );
  }

  void _navigateTo(BuildContext context, String item) {
    if (item == "Online Courses") return;

    Widget nextScreen;
    switch (item) {
      case "Dashboard":
        nextScreen = const AdminDashboardScreen();
        break;
      case "Branches":
        nextScreen = const BranchManagementScreen();
        break;
      case "Trainers":
        nextScreen = const TrainerManagementScreen();
        break;
      case "User & Role":
        nextScreen = const UserRoleScreen();
        break;
      case "Members":
        nextScreen = const MembersScreen();
        break;
      case "Plans":
        nextScreen = const PlanManagementScreen();
        break;
      case "Report":
        nextScreen = const ReportScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
      ),
    );
  }
}