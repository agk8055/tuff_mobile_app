import 'package:flutter/material.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/admin_app_bar.dart';

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
            Navigator.pop(context); // Close drawer
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
                  onItemSelected: (item) {},
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
                color: primaryYellow.withOpacity(0.9),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        if (isDesktop) _buildAdminTopBar(),
      ],
    );
  }

  Widget _buildStatGrid(double width) {
    int crossAxisCount = width > 1200 ? 4 : (width > 800 ? 2 : 1);
    
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 2.2,
      children: [
        _statCard("TOTAL USERS", "12,345", "+12% Growth", Icons.people_alt_outlined),
        _statCard("ACTIVE SUB", "85,473", "65% Conversion", Icons.verified_outlined),
        _statCard("MONTHLY REVENUE", "\$1.4M", "+8% last month", Icons.payments_outlined),
        _statCard("DAILY ATTENDANCE", "4,200", "88% capacity", Icons.fitness_center),
      ],
    );
  }

  Widget _statCard(String label, String value, String sub, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryYellow.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: const TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontFamily: 'Lexend', fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(sub, style: TextStyle(fontFamily: 'Lexend', fontSize: 10, color: primaryYellow, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFF8D6E63).withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: const Color(0xFF8D6E63), size: 24),
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
          const SizedBox(height: 40),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [primaryYellow.withOpacity(0.3), Colors.transparent],
              ),
            ),
            child: Center(child: Text("Chart Placeholder", style: TextStyle(fontFamily: 'Lexend', color: Colors.grey))),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTiers() {
    return _cardWrapper(
      child: Column(
        children: [
          const Text("User Tiers", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 18)),
          const SizedBox(height: 20),
          const SizedBox(
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(value: 0.7, strokeWidth: 20, color: Color(0xFFFAC00C)),
                Text("Tier Spread", style: TextStyle(fontSize: 10, fontFamily: 'Lexend')),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _tierLegend("Unlimited", "55%", primaryYellow),
          _tierLegend("Plus", "32%", Colors.purple.shade200),
          _tierLegend("Basic", "13%", Colors.brown.shade300),
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
          const Text("Real-time engagement and revenue across regional locations", style: TextStyle(fontFamily: 'Lexend', fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(const Color(0xFFFDF2F0)),
              columns: const [
                DataColumn(label: Text("BRANCH LOCATION", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("ACTIVE MEMBERS", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("REVENUE", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("LIVE STATUS", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold))),
              ],
              rows: [
                _branchRow("Downtown Elite", "24,500", "\$342,000", "PEAK HOURS", Colors.orange),
                _branchRow("Uptown Kinetic", "18,200", "\$210,500", "STEADY", Colors.blue),
                _branchRow("Westside Pulse", "15,800", "\$188,400", "SURGING", Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _branchRow(String loc, String members, String rev, String status, Color statusColor) {
    return DataRow(cells: [
      DataCell(Text(loc, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold))),
      DataCell(Text(members, style: const TextStyle(fontFamily: 'Lexend'))),
      DataCell(Text(rev, style: const TextStyle(fontFamily: 'Lexend'))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(border: Border.all(color: statusColor), borderRadius: BorderRadius.circular(20)),
        child: Text(status, style: TextStyle(fontSize: 9, color: statusColor, fontWeight: FontWeight.bold)),
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
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: primaryYellow.withOpacity(0.1))),
      child: child,
    );
  }

  Widget _buildAdminTopBar() {
    return Row(
      children: [
        Icon(Icons.notifications_none_rounded, color: primaryYellow, size: 28),
        const SizedBox(width: 20),
        const CircleAvatar(radius: 16, backgroundColor: Colors.grey),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Admin", style: TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 12)),
            Text("Super Admin", style: TextStyle(fontFamily: 'Lexend', fontSize: 10)),
          ],
        ),
      ],
    );
  }
}