import 'package:flutter/material.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/admin_app_bar.dart';
import 'admin_dashboard.dart';
import 'branch_management.dart';
import 'trainer_mangaement.dart';
import 'user_role_screen.dart';
import 'online_courses_screen.dart';
import 'members_screen.dart';
import 'plan_management_screen.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  final Color primaryYellow = const Color(0xFFFAC00C);
  final Color creamBg = const Color(0xFFFFFDF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AdminAppBar(title: "Report"),
      drawer: Drawer(
        child: AdminSidebar(
          selectedItem: "Report",
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
                  selectedItem: "Report",
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
                          _buildStatGrid(constraints.maxWidth),
                          const SizedBox(height: 32),
                          _buildChartGrid(constraints.maxWidth),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Report",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Text(
          "Monitor system, manage access and track activities",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 14,
            color: Color(0xFFD4A017),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStatGrid(double width) {
    int crossAxisCount = width > 1200 ? 4 : (width > 800 ? 2 : 1);
    
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: width > 1200 ? 2.0 : 2.2,
      children: [
        _statCard("SYSTEM STATUS", "Operational", Icons.check_circle_outline, isCheck: true),
        _statCard("ACTIVE STATUS", "5", Icons.check_circle_outline, isCheck: true),
        _statCard("ACTIVE USERS", "12k", Icons.person_outline),
        _statCard("SYSTEM UPTIME", "99.9%", null),
      ],
    );
  }

  Widget _statCard(String label, String value, IconData? icon, {bool isCheck = false}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryYellow.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF8B5E3C),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          if (icon != null)
            Icon(
              icon,
              color: isCheck ? Colors.green : primaryYellow,
              size: 24,
            )
          else if (label == "SYSTEM UPTIME")
            const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildChartGrid(double width) {
    int crossAxisCount = width > 900 ? 2 : 1;
    
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: width > 900 ? 1.1 : 1.3,
      children: [
        _chartCard("System Activity", ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"], [0.3, 0.4, 0.45, 0.6, 0.58, 0.55, 0.65]),
        _chartCard("Active Sub", ["JAN", "FEB", "MAR", "APR"], [0.2, 0.5, 0.45, 0.75]),
        _chartCard("Active Users", ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"], [0.4, 0.3, 0.55, 0.5, 0.7, 0.55, 0.85]),
        _chartCard("Online Course", ["JAN", "FEB", "MAR", "APR"], [0.45, 0.65, 0.75, 0.9]),
      ],
    );
  }

  Widget _chartCard(String title, List<String> labels, List<double> dataPoints) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryYellow.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.filter_list, size: 14, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(
                      "Filter by Role",
                      style: TextStyle(
                        fontFamily: 'Lexend',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, size: 14, color: Colors.orange),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: CustomPaint(
                painter: _LineChartPainter(dataPoints, primaryYellow),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: labels.map((label) => Text(
              label,
              style: const TextStyle(
                fontFamily: 'Lexend',
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String item) {
    if (item == "Report") return;

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
      case "Members":
        nextScreen = const MembersScreen();
        break;
      case "Plans":
        nextScreen = const PlanManagementScreen();
        break;
      case "User & Role":
        nextScreen = const UserRoleScreen();
        break;
      case "Online Courses":
        nextScreen = const OnlineCoursesScreen();
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

class _LineChartPainter extends CustomPainter {
  final List<double> dataPoints;
  final Color color;

  _LineChartPainter(this.dataPoints, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.length < 2) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final double stepX = size.width / (dataPoints.length - 1);

    for (int i = 0; i < dataPoints.length; i++) {
      double x = i * stepX;
      double y = size.height * (1 - dataPoints[i]);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        // Use quadratic bezier for smoothness
        double prevX = (i - 1) * stepX;
        double prevY = size.height * (1 - dataPoints[i - 1]);
        path.quadraticBezierTo(
          prevX + stepX / 2,
          prevY,
          prevX + stepX / 2,
          (prevY + y) / 2,
        );
        path.quadraticBezierTo(
          prevX + stepX / 2,
          y,
          x,
          y,
        );
      }
    }

    canvas.drawPath(path, paint);

    // Draw dots
    final dotPaint = Paint()..color = color;
    for (int i = 0; i < dataPoints.length; i++) {
      double x = i * stepX;
      double y = size.height * (1 - dataPoints[i]);
      canvas.drawCircle(Offset(x, y), 5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
