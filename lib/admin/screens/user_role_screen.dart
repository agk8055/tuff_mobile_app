import 'package:flutter/material.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/admin_app_bar.dart';
import 'admin_dashboard.dart';
import 'branch_management.dart';
import 'trainer_mangaement.dart';
import 'online_courses_screen.dart';
import 'members_screen.dart';
import 'plan_management_screen.dart';
import 'report_screen.dart';




class UserRoleScreen extends StatelessWidget {
  const UserRoleScreen({super.key});

  final Color primaryYellow = const Color(0xFFFAC00C);
  final Color creamBg = const Color(0xFFFCF9F1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AdminAppBar(title: "User & Role"),
      drawer: Drawer(
        child: AdminSidebar(
          selectedItem: "User & Role",
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
                  selectedItem: "User & Role",
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
                          const SizedBox(height: 40),
                          if (constraints.maxWidth > 900)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 3, child: _buildSecurityRoles()),
                                const SizedBox(width: 30),
                                Expanded(flex: 2, child: _buildProvisionUser()),
                              ],
                            )
                          else
                            Column(
                              children: [
                                _buildSecurityRoles(),
                                const SizedBox(height: 30),
                                _buildProvisionUser(),
                              ],
                            ),
                          const SizedBox(height: 30),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "User & Role",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFD4A017)),
              ),
              Text(
                "Configure system permissions and manage staff of your athletic community",
                style: TextStyle(color: const Color(0xFFD4A017).withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecurityRoles() {
    return _cardWrapper(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("SECURITY ROLES", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.1)),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 16, color: Colors.black),
                label: const Text("CREATE NEW", style: TextStyle(color: Colors.black, fontSize: 12)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF2C94C),
                  shape: const StadiumBorder(),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          _roleTile("Super Admin", "Full System Access", Icons.bolt_rounded),
          _roleTile("Branch Manager", "Location Control", Icons.apartment_rounded),
          _roleTile("Trainer", "Client Management", Icons.fitness_center_rounded),
          _roleTile("Nutritionist", "Dietary Planning", Icons.apple_rounded),
        ],
      ),
    );
  }

  Widget _roleTile(String title, String sub, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xFFF2E8CF)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFF9E7),
          child: Icon(icon, color: const Color(0xFFF2C94C), size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(sub, style: const TextStyle(fontSize: 12)),
      ),
    );
  }

  Widget _buildProvisionUser() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("PROVISION USER", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.1)),
          const SizedBox(height: 25),
          const Text("Email Address", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: "user@pulsekinetic.com",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFF2E8CF))),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Password", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "........",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFF2E8CF))),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF2C94C), shape: const StadiumBorder()),
              child: const Text("ACTIVATE USER", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUserDirectory() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("USER DIRECTORY", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.1)),
          const SizedBox(height: 20),
          Table(
            columnWidths: const {0: FlexColumnWidth(3), 1: FlexColumnWidth(2), 2: FlexColumnWidth(1)},
            children: [
              TableRow(
                decoration: const BoxDecoration(color: Color(0xFFFFF9E7)),
                children: [
                  _th("ENTITY"), _th("DESIGNATION"), _th("STATUS"),
                ],
              ),
              _tr("Alex Vivera", "alexvv@gmail.com", "Lead Trainer", true),
              _tr("Arun Dev", "arundp@gmail.com", "Branch Manager", false),
              _tr("Sooraj Menon", "sooraj@gmail.com", "Nutritionist", true),
              _tr("Amal Antony", "amalant@gmail.com", "Super Admin", false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _th(String text) => Padding(padding: const EdgeInsets.all(16), child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.brown)));

  TableRow _tr(String name, String email, String role, bool active) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(radius: 15, backgroundColor: Colors.grey[300]),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text(email, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: UnconstrainedBox(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: const Color(0xFFFFF9E7), borderRadius: BorderRadius.circular(20)),
              child: Text(role, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(radius: 4, backgroundColor: active ? Colors.green : Colors.grey),
              const SizedBox(width: 8),
              Text(active ? "Active Now" : "Offline", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cardWrapper({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFEFBF3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF2E8CF)),
      ),
      child: child,
    );
  }

  void _navigateTo(BuildContext context, String item) {
    if (item == "User & Role") return;

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
