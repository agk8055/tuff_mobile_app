import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/login_screen.dart';

class UserSideBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const UserSideBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  final Color primaryYellow = const Color(0xFFFAC00C);
  final Color backgroundColor = const Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
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
                _navItem(0, "HOME", svgPath: "assets/icons/home_icon.svg"),
                _navItem(1, "REPORT", svgPath: "assets/icons/report_icon.svg"),
                _navItem(2, "COURSES", svgPath: "assets/icons/course_icon.svg"),
                _navItem(3, "PROFILE", svgPath: "assets/icons/profile_icon.svg"),
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
    return Text(
      'TUFF',
      style: TextStyle(
        color: primaryYellow,
        fontSize: 32,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
      ),
    );
  }

  Widget _navItem(int index, String label, {required String svgPath}) {
    final bool isSelected = currentIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () => onItemSelected(index),
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? primaryYellow : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                svgPath,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.black : Colors.white70,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
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
