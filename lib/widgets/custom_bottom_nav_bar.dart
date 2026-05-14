import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF1E1E1E),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFFAC00C),
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home_icon.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 0 ? const Color(0xFFFAC00C) : Colors.white,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/report_icon.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 1 ? const Color(0xFFFAC00C) : Colors.white,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
              label: 'REPORT',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/course_icon.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 2 ? const Color(0xFFFAC00C) : Colors.white,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
              label: 'COURSES',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile_icon.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 3 ? const Color(0xFFFAC00C) : Colors.white,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
              label: 'PROFILE',
            ),
          ],
        ),
      ),
    );
  }
}
