import 'package:flutter/material.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/admin_app_bar.dart';
import 'branch_management.dart';
import 'trainer_mangaement.dart';
import 'user_role_screen.dart';
import 'online_courses_screen.dart';
import 'members_screen.dart';
import 'plan_management_screen.dart';
import 'report_screen.dart';




class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  final Color primaryYellow = const Color(0xFFFAC00C);
  final Color creamBg = const Color(0xFFFFFDF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AdminAppBar(title: "Admin Dashboard"),
      drawer: Drawer(
        child: AdminSidebar(
          selectedItem: "Dashboard",
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
                  selectedItem: "Dashboard",
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
                          _buildChartsRow(constraints.maxWidth),
                          const SizedBox(height: 32),
                          _buildBranchMatrix(),
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
          "Welcome Back Admin !!",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: isDesktop ? 28 : 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "Here's whats happening with your gym today",
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 14,
            color: primaryYellow.withValues(alpha: 0.9),
            fontWeight: FontWeight.w600,
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
      childAspectRatio: width > 1200 ? 1.6 : 2.0,
      children: [
        _statCard("TOTAL USERS", "12,345", "+12% Growth vs last month", Icons.people_alt_rounded),
        _statCard("ACTIVE SUB", "85,473", "65% Conversion rate optimized", Icons.verified_user_rounded),
        _statCard("MONTHLY REVENUE", "\$1.4M", "+8% last month", Icons.account_balance_wallet_rounded),
        _statCard("DAILY ATTENDANCE", "4,200", "88% Total global capacity", Icons.fitness_center_rounded),
      ],
    );
  }

  Widget _statCard(String label, String value, String sub, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryYellow.withValues(alpha: 0.15), width: 1.5),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  sub,
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 9,
                    color: primaryYellow.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF795548).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF795548), size: 24),
          )
        ],
      ),
    );
  }

  Widget _buildChartsRow(double width) {
    if (width < 900) {
      return Column(
        children: [
          _buildRevenueChart(),
          const SizedBox(height: 24),
          _buildUserTiers(),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildRevenueChart()),
        const SizedBox(width: 24),
        Expanded(child: _buildUserTiers()),
      ],
    );
  }

  Widget _buildRevenueChart() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Revenue Momentum", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 18)),
              Row(
                children: [
                  _chip("6 Months", isSelected: true),
                  const SizedBox(width: 8),
                  _chip("Export"),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          const Text("Financial performance over the last 6 months", style: TextStyle(fontFamily: 'Lexend', fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 32),
          Stack(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: CustomPaint(
                  painter: _AreaChartPainter(primaryYellow),
                ),
              ),
              Positioned(
                top: 20,
                right: 40,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: primaryYellow),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  ),
                  child: Text("\$1.2M PEAK", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: primaryYellow)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE"
            ].map((m) => Text(m, style: const TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold))).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTiers() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("User Tiers", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 18)),
          const Text("Active membership distribution", style: TextStyle(fontFamily: 'Lexend', fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 32),
          Center(
            child: SizedBox(
              height: 140,
              width: 140,
              child: CustomPaint(
                painter: _DonutChartPainter(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _tierLegend("Unlimited", "55%", primaryYellow),
          _tierLegend("Plus", "32%", const Color(0xFF9C27B0).withValues(alpha: 0.6)),
          _tierLegend("Basic", "13%", const Color(0xFF795548).withValues(alpha: 0.7)),
        ],
      ),
    );
  }

  Widget _buildBranchMatrix() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Branch Performance Matrix", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 18)),
          const Text("Real-time engagement and revenue across regional locations", style: TextStyle(fontFamily: 'Lexend', fontSize: 11, color: Colors.grey)),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(const Color(0xFFFFF7F0)),
              columnSpacing: 30,
              horizontalMargin: 12,
              columns: const [
                DataColumn(label: Text("BRANCH LOCATION", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("ACTIVE MEMBERS", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("MEMBER GROWTH", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("REVENUE CONTRIBUTION", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("LIVE STATUS", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
              ],
              rows: [
                _branchRow("Downtown Elite", "24,500", "+4.2%", "\$342,000", "PEAK HOURS", Colors.orange),
                _branchRow("Uptown Kinetic", "18,200", "+2.1%", "\$210,500", "STEADY", Colors.blue),
                _branchRow("Westside Pulse", "15,800", "+8.5%", "\$188,400", "SURGING", Colors.green),
                _branchRow("Eastside Power", "12,400", "+1.2%", "\$156,000", "OFF-PEAK", Colors.grey),
                _branchRow("Suburbia Flow", "9,100", "+1.8%", "\$112,000", "STEADY", Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _branchRow(String loc, String members, String growth, String rev, String status, Color statusColor) {
    return DataRow(cells: [
      DataCell(Row(
        children: [
          Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: primaryYellow.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.business_rounded, size: 14, color: Colors.brown)),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(loc, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13)),
              const Text("Metro central hub", style: TextStyle(fontSize: 9, color: Colors.grey)),
            ],
          ),
        ],
      )),
      DataCell(Text(members, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold))),
      DataCell(Row(
        children: [
          Container(width: 40, height: 4, decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 8),
          Text(growth, style: TextStyle(fontFamily: 'Lexend', fontSize: 11, color: statusColor, fontWeight: FontWeight.bold)),
        ],
      )),
      DataCell(Text(rev, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(border: Border.all(color: statusColor.withValues(alpha: 0.5)), borderRadius: BorderRadius.circular(20)),
        child: Text(status, style: TextStyle(fontSize: 8, color: statusColor, fontWeight: FontWeight.bold)),
      )),
    ]);
  }

  Widget _chip(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4E342E) : primaryYellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _tierLegend(String label, String val, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [CircleAvatar(radius: 4, backgroundColor: color), const SizedBox(width: 8), Text(label, style: const TextStyle(fontFamily: 'Lexend', fontSize: 12))]),
          Text(val, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _cardWrapper({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: primaryYellow.withValues(alpha: 0.1))),
      child: child,
    );
  }

  void _navigateTo(BuildContext context, String item) {
    if (item == "Dashboard") return;

    Widget nextScreen;
    switch (item) {
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

class _AreaChartPainter extends CustomPainter {
  final Color color;
  _AreaChartPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.6, size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9, size.width, size.height * 0.4);

    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, paint);
    canvas.drawPath(path, linePaint);

    // Draw markers
    final dotPaint = Paint()..color = Colors.black;
    canvas.drawCircle(Offset(0, size.height * 0.7), 4, dotPaint);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.65), 4, dotPaint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.8), 4, dotPaint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.85), 4, dotPaint);
    canvas.drawCircle(Offset(size.width, size.height * 0.4), 4, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = 25.0;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    // Unlimited (55%)
    paint.color = const Color(0xFFFAC00C);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - strokeWidth / 2), -1.5, 3.5, false, paint);

    // Plus (32%)
    paint.color = const Color(0xFF9C27B0).withValues(alpha: 0.6);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - strokeWidth / 2), 2.0, 2.0, false, paint);

    // Basic (13%)
    paint.color = const Color(0xFF795548).withValues(alpha: 0.7);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - strokeWidth / 2), 4.0, 0.8, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}