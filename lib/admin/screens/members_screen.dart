import 'package:flutter/material.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/admin_app_bar.dart';
import 'admin_dashboard.dart';
import 'branch_management.dart';
import 'trainer_mangaement.dart';
import 'user_role_screen.dart';
import 'online_courses_screen.dart';
import 'plan_management_screen.dart';
import 'report_screen.dart';



class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  final Color primaryYellow = const Color(0xFFFAC00C);
  final Color creamBg = const Color(0xFFFFFDF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AdminAppBar(title: "Members"),
      drawer: Drawer(
        child: AdminSidebar(
          selectedItem: "Members",
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
                  selectedItem: "Members",
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
                          _buildUserInsights(constraints.maxWidth),
                          const SizedBox(height: 32),
                          _buildUserDirectory(),
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
        Text(
          "Members",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: isDesktop ? 28 : 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "View and manage all gym members",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
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
      childAspectRatio: width > 1200 ? 2.0 : 2.5,
      children: [
        _statCard("TOTAL USERS", "142,8k", "+12% vs last month", Icons.people_alt_outlined, isPositive: true),
        _statCard("NEW SIGNUPS", "+5%", "Growth trend this week", Icons.person_add_outlined, isPositive: true),
        _statCard("ACTIVE SUB", "94%", "Stable", Icons.verified_user_outlined, isPositive: null),
        _statCard("CHURN RATE", "12", "-0.3%", Icons.trending_down_rounded, isPositive: false),
      ],
    );
  }

  Widget _statCard(String label, String value, String sub, IconData icon, {bool? isPositive}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryYellow.withValues(alpha: 0.15), width: 1.5),
      ),
      child: Stack(
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
                  color: Colors.grey,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (isPositive != null)
                    Icon(
                      isPositive ? Icons.trending_up : Icons.trending_down,
                      color: isPositive ? Colors.green : Colors.red,
                      size: 14,
                    ),
                  if (isPositive != null) const SizedBox(width: 4),
                  Text(
                    sub,
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 10,
                      color: isPositive == true ? Colors.green : (isPositive == false ? Colors.red : Colors.grey),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Icon(icon, color: primaryYellow, size: 20),
          )
        ],
      ),
    );
  }

  Widget _buildUserInsights(double width) {
    bool isMobile = width < 900;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "USER INSIGHTS",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        if (isMobile)
          Column(
            children: [
              _insightCard("Gender Distribution", _buildGenderChart()),
              const SizedBox(height: 16),
              _insightCard("Age Distribution", _buildAgeChart()),
              const SizedBox(height: 16),
              _insightCard("Top Branch", _buildTopBranchInfo()),
              const SizedBox(height: 16),
              _insightCard("Retention Rate", _buildRetentionInfo()),
            ],
          )
        else
          Row(
            children: [
              Expanded(child: _insightCard("Gender Distribution", _buildGenderChart())),
              const SizedBox(width: 16),
              Expanded(child: _insightCard("Age Distribution", _buildAgeChart())),
              const SizedBox(width: 16),
              Expanded(child: _insightCard("Top Branch", _buildTopBranchInfo())),
              const SizedBox(width: 16),
              Expanded(child: _insightCard("Retention Rate", _buildRetentionInfo())),
            ],
          ),
      ],
    );
  }

  Widget _insightCard(String title, Widget content) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B5E3C),
              ),
            ),
          ),
          const SizedBox(height: 24),
          content,
        ],
      ),
    );
  }

  Widget _buildGenderChart() {
    return Column(
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: CustomPaint(
            painter: _DonutChartPainter(
              slices: [
                _ChartSlice(color: primaryYellow, percentage: 0.58),
                _ChartSlice(color: const Color(0xFF6C63FF), percentage: 0.31),
                _ChartSlice(color: const Color(0xFFE53935), percentage: 0.11),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        _legendItem("31% FEMALE", const Color(0xFFE53935)),
        const SizedBox(height: 8),
        _legendItem("58% MALE", primaryYellow),
      ],
    );
  }

  Widget _buildAgeChart() {
    return Column(
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: CustomPaint(
            painter: _DonutChartPainter(
              slices: [
                _ChartSlice(color: const Color(0xFF4C49ED), percentage: 0.4),
                _ChartSlice(color: const Color(0xFF7C79E0), percentage: 0.25),
                _ChartSlice(color: const Color(0xFFE53935), percentage: 0.2),
                _ChartSlice(color: const Color(0xFFB2FF59), percentage: 0.15),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _legendItem("16-25", const Color(0xFF4C49ED)),
            const SizedBox(width: 16),
            _legendItem("46-55", const Color(0xFF7C79E0)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _legendItem("36-45", const Color(0xFFB2FF59)),
            const SizedBox(width: 16),
            _legendItem("26-35", const Color(0xFFE53935)),
          ],
        ),
      ],
    );
  }

  Widget _buildTopBranchInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF7E6),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.business_rounded, color: primaryYellow, size: 24),
        ),
        const SizedBox(height: 16),
        const Text(
          "Unit 45 Fitness",
          style: TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Text(
          "2,346",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: primaryYellow,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRetentionInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text(
          "76%",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4E342E),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text(
              "65%",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFAC00C),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              "vs last month",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 10,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _legendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontFamily: 'Lexend', fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildUserDirectory() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryYellow.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "User Directory",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(const Color(0xFFFFF7F0)),
              columnSpacing: 40,
              columns: const [
                DataColumn(label: Text("USER", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("STATUS", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("PLAN", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("BRANCH", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("LAST ACTIVE", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("ACTIONS", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
              ],
              rows: [
                _userRow("Alex vivera", "alexvv@gmail.com", "ACTIVE", "ELITE", "Uptown Kinetic", "Today, 09:12 AM"),
                _userRow("Arun Dev", "arundpv@gmail.com", "ACTIVE", "PRO", "Westside Pulse", "Yesterday, 06:12 PM"),
                _userRow("John Mathew", "Johnm@gmail.com", "INACTIVE", "BASIC", "Unit 45 Fitness", "4 Days ago"),
                _userRow("Amal Antony", "amalant@gmail.com", "PENDING", "ELITE", "Downside Fitness", "N/A"),
                _userRow("Sooraj Menon", "Sooraj@gmail.com", "ACTIVE", "PRO", "Westside Pulse", "Yesterday, 06:12 PM"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Showing 1 to 3 of 150 total personnel",
                  style: TextStyle(fontFamily: 'Lexend', color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    _pageButton("<", false),
                    _pageButton("1", true),
                    _pageButton("2", false),
                    _pageButton("3", false),
                    _pageButton(">", false),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _userRow(String name, String email, String status, String plan, String branch, String lastActive) {
    Color statusColor;
    switch (status) {
      case "ACTIVE":
        statusColor = Colors.green.shade100;
        break;
      case "INACTIVE":
        statusColor = Colors.orange.shade100;
        break;
      case "PENDING":
        statusColor = Colors.yellow.shade100;
        break;
      default:
        statusColor = Colors.grey.shade100;
    }

    Color statusTextColor;
    switch (status) {
      case "ACTIVE":
        statusTextColor = Colors.green.shade700;
        break;
      case "INACTIVE":
        statusTextColor = Colors.orange.shade700;
        break;
      case "PENDING":
        statusTextColor = Colors.yellow.shade800;
        break;
      default:
        statusTextColor = Colors.grey.shade700;
    }

    return DataRow(cells: [
      DataCell(Row(
        children: [
          const CircleAvatar(radius: 16, backgroundColor: Colors.grey),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13)),
              Text(email, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ],
      )),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(8)),
        child: Text(status, style: TextStyle(fontSize: 9, color: statusTextColor, fontWeight: FontWeight.bold)),
      )),
      DataCell(Text(plan, style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 12))),
      DataCell(Text(branch, style: const TextStyle(fontFamily: 'Lexend', fontSize: 12))),
      DataCell(Text(lastActive, style: const TextStyle(fontFamily: 'Lexend', fontSize: 11, color: Colors.grey))),
      DataCell(Row(
        children: [
          Icon(Icons.edit_outlined, size: 16, color: Colors.grey.shade600),
          const SizedBox(width: 16),
          Icon(Icons.visibility_outlined, size: 16, color: Colors.grey.shade600),
        ],
      )),
    ]);
  }

  Widget _pageButton(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: isActive ? primaryYellow : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: isActive ? Colors.black : Colors.black54,
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String item) {
    if (item == "Members") return;

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
      case "Online Courses":
        nextScreen = const OnlineCoursesScreen();
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

class _ChartSlice {
  final Color color;
  final double percentage;
  _ChartSlice({required this.color, required this.percentage});
}

class _DonutChartPainter extends CustomPainter {
  final List<_ChartSlice> slices;
  _DonutChartPainter({required this.slices});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 12.0;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    double startAngle = -1.57; // Start from top

    for (var slice in slices) {
      paint.color = slice.color;
      double sweepAngle = slice.percentage * 2 * 3.14159;
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius - strokeWidth / 2), startAngle, sweepAngle, false, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
