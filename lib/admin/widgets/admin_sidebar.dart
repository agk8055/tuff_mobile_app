import 'package:flutter/material.dart';

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
                _navItem(Icons.insert_drive_file_outlined, "Report"),
                _navItem(Icons.admin_panel_settings_outlined, "User & Role"),
                _navItem(Icons.play_circle_outline_rounded, "Online Courses"),
                _navItem(Icons.settings_outlined, "Settings"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Teamuniversal",
          style: TextStyle(
            color: primaryYellow,
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          "FITNESS FUSION",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _navItem(IconData icon, String label) {
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
}