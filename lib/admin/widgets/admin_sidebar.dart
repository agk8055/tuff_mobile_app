import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../screens/login_screen.dart';

class AdminSidebar extends StatelessWidget {
  final String selectedItem;
  final Function(String) onItemSelected;

  const AdminSidebar({
    super.key,
    required this.selectedItem,
    required this.onItemSelected,
  });

  final Color primaryYellow = const Color(0xFFFAC00C);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildLogo(),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              children: [
                _navItem(null, "Dashboard", svgPath: "assets/icons/dashboard_icon.svg"),
                _navItem(Icons.location_on_outlined, "Branches"),
                _navItem(Icons.person_outline, "Trainers"),
                _navItem(Icons.people_alt_outlined, "Members"),
                _navItem(Icons.assignment_outlined, "Plans"),
                _navItem(null, "Report", svgPath: "assets/icons/report_icon.svg"),
                _navItem(Icons.admin_panel_settings_outlined, "User & Role"),
                _navItem(null, "Online Courses", svgPath: "assets/icons/course_icon.svg"),
                _navItem(Icons.settings_outlined, "Settings"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(color: Colors.white24, indent: 24, endIndent: 24),
                ),
                _navLogout(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/tuff_banner.jpg',
      fit: BoxFit.contain,
    );
  }

  Widget _navItem(IconData? icon, String label, {String? svgPath}) {
    final bool isSelected = selectedItem == label;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () => onItemSelected(label),
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? primaryYellow : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              if (svgPath != null)
                SvgPicture.asset(
                  svgPath,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    isSelected ? Colors.black : Colors.white70,
                    BlendMode.srcIn,
                  ),
                )
              else if (icon != null)
                Icon(
                  icon,
                  color: isSelected ? Colors.black : Colors.white70,
                  size: 20,
                ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Lexend',
                  color: isSelected ? Colors.black : Colors.white70,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navLogout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () {
          // Navigate to Login Screen and clear navigation stack
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          );
        },
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: const [
              Icon(
                Icons.logout_rounded,
                color: Colors.redAccent,
                size: 20,
              ),
              SizedBox(width: 16),
              Text(
                "Logout",
                style: TextStyle(
                  fontFamily: 'Lexend',
                  color: Colors.redAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}