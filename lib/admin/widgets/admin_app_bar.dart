import 'package:flutter/material.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AdminAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    bool isDesktop = screenWidth >= 1100;

    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      automaticallyImplyLeading: !isDesktop,
      leading: isDesktop 
        ? null 
        : IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFFFAC00C)),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
      title: isMobile 
        ? Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )
        : null, // Title is handled by content in dashboard if not mobile
      centerTitle: true,
      actions: [
        _notificationBadge(),
        const SizedBox(width: 12),
        _adminProfile(context, isMobile),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _notificationBadge() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.notifications_none_rounded, color: Color(0xFFFAC00C), size: 20),
        ),
        Positioned(
          right: 0,
          top: 10,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(color: Colors.red, border: Border.all(color: Colors.black, width: 1.5), shape: BoxShape.circle),
            constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
            child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }

  Widget _adminProfile(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Placeholder for admin avatar
          ),
          if (!isMobile) ...[
            const SizedBox(width: 8),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Admin", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, fontFamily: 'Lexend')),
                Text("Super Admin", style: TextStyle(color: Colors.grey, fontSize: 8, fontFamily: 'Lexend')),
              ],
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 16),
          ],
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
