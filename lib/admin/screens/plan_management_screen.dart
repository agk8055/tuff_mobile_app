import 'package:flutter/material.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/admin_app_bar.dart';
import 'admin_dashboard.dart';
import 'branch_management.dart';
import 'trainer_mangaement.dart';
import 'user_role_screen.dart';
import 'online_courses_screen.dart';
import 'members_screen.dart';
import 'report_screen.dart';


class PlanManagementScreen extends StatefulWidget {
  const PlanManagementScreen({super.key});

  @override
  State<PlanManagementScreen> createState() => _PlanManagementScreenState();
}

class _PlanManagementScreenState extends State<PlanManagementScreen> {
  final Color primaryYellow = const Color(0xFFFAC00C);
  final Color creamBg = const Color(0xFFFFFDF5);
  String selectedTab = "Workout Plans";
  String assignmentType = "Individual";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AdminAppBar(title: "Plans"),
      drawer: Drawer(
        child: AdminSidebar(
          selectedItem: "Plans",
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
                  selectedItem: "Plans",
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
                          _buildTabs(),
                          const SizedBox(height: 32),
                          _buildAssignmentTypeSection(),
                          const SizedBox(height: 32),
                          _buildRecentAssignmentTable(),
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
            const Text(
              "Plans",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Assign workout and diet plans to users",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 14,
                color: Color(0xFFD4A017),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: primaryYellow.withValues(alpha: 0.5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(radius: 3, backgroundColor: Colors.red),
                  const SizedBox(width: 8),
                  Text(
                    "42 PENDING ASSIGNMENTS",
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (isDesktop)
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.black),
            label: const Text(
              "Create Plan",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryYellow,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
      ],
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _tabItem("Workout Plans"),
        const SizedBox(width: 32),
        _tabItem("Diet Plans"),
      ],
    );
  }

  Widget _tabItem(String title) {
    bool isSelected = selectedTab == title;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = title),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 40,
              height: 3,
              color: primaryYellow,
            ),
        ],
      ),
    );
  }

  Widget _buildAssignmentTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Assignment Type",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _assignmentTypeButton("Individual Assignment", Icons.person, "Individual"),
            const SizedBox(width: 16),
            _assignmentTypeButton("Bulk Assignment", Icons.people_outline, "Bulk"),
          ],
        ),
      ],
    );
  }

  Widget _assignmentTypeButton(String label, IconData icon, String type) {
    bool isSelected = assignmentType == type;
    return GestureDetector(
      onTap: () => setState(() => assignmentType = type),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFFFF0F0).withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? primaryYellow : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: isSelected ? [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)] : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? primaryYellow : Colors.grey),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentAssignmentTable() {
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
              "Recent Assignment",
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
                DataColumn(label: Text("PLAN", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("TYPE", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("ASSIGNED TO", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("USERS", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("DATE", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
                DataColumn(label: Text("ASSIGNED BY", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.w800, color: Colors.grey))),
              ],
              rows: [
                _assignmentRow("Muscle Gain Plan", "Workout", "Individual", "John Doe", "1", "May 16, 2025", "Admin"),
                _assignmentRow("Weight Loss Plan", "Diet", "Bulk", "Westside Branch", "25", "May 18, 2025", "Admin"),
                _assignmentRow("Strength Plan", "Workout", "Bulk", "Premium Members", "120", "May 18, 2025", "Admin"),
                _assignmentRow("Keto Diet Plan", "Diet", "Individual", "Sarah John", "1", "May 18, 2025", "Admin"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Showing 1 to 4 of 150 members",
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

  DataRow _assignmentRow(String plan, String category, String type, String assignedTo, String users, String date, String assignedBy) {
    return DataRow(cells: [
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(plan, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13)),
          Text(category, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      )),
      DataCell(Text(
        type,
        style: TextStyle(
          fontFamily: 'Lexend',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.orange.shade800,
        ),
      )),
      DataCell(Text(assignedTo, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13))),
      DataCell(Text(users, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13))),
      DataCell(Text(date, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13))),
      DataCell(Text(assignedBy, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13))),
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
    if (item == "Plans") return;

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
      case "User & Role":
        nextScreen = const UserRoleScreen();
        break;
      case "Online Courses":
        nextScreen = const OnlineCoursesScreen();
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
