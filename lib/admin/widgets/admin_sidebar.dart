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
                _navItem(Icons.grid_view_rounded, "Dashboard"),
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
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.add, color: Colors.white, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      "Quick Actions",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lexend',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _quickActionButton("Add New Branch", primaryYellow, Colors.black, onTap: () => onItemSelected("Branches")),
                const SizedBox(height: 12),
                _quickActionButton("Add New Trainer", Colors.transparent, primaryYellow, isOutline: true, onTap: () => onItemSelected("Trainers")),
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

  Widget _quickActionButton(String label, Color bgColor, Color textColor, {bool isOutline = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 36,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: isOutline ? Border.all(color: textColor, width: 1) : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontFamily: 'Poppins',
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}