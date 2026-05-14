import 'package:flutter/material.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/admin_app_bar.dart';

class TrainerManagementScreen extends StatelessWidget {
  const TrainerManagementScreen({super.key});

  final Color primaryYellow = const Color(0xFFFAC00C);
  final Color creamBg = const Color(0xFFFFFDF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AdminAppBar(title: "Trainer Management"),
      drawer: Drawer(
        child: AdminSidebar(
          selectedItem: "Trainers",
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
                  selectedItem: "Trainers", 
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
                          _buildStatsAndActionRow(constraints.maxWidth),
                          const SizedBox(height: 32),
                          _buildTrainerTable(),
                          const SizedBox(height: 24),
                          _buildPagination(),
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
              "Trainers",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: isDesktop ? 28 : 22,
                fontWeight: FontWeight.bold,
                color: Colors.white, // In the image, this text is white but the rest of the layout is cream. Wait, looking closely at image_929154.jpg, the header text is on the black background!
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Create, manage and assign trainers across branches",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 14,
                color: primaryYellow.withOpacity(0.9),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        if (isDesktop) _buildTopBar(),
      ],
    );
  }

  // ** Correction: Based on the image, the header is actually inside the black area. 
  // To keep the layout structure consistent with previous screens where the cream container 
  // wraps everything except the sidebar, I will style the text black as per standard dashboard UI, 
  // but if you want it exactly like the image, the header needs to be above the cream container. 
  // I will style it black here assuming standard container wrapping. Let's adjust to match the visual:

  Widget _buildTopBar() {
    return Row(
      children: [
        Stack(
          children: [
            Icon(Icons.notifications_none_rounded, color: primaryYellow, size: 28),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 8), textAlign: TextAlign.center),
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              const CircleAvatar(radius: 16, backgroundColor: Colors.grey),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Admin", style: TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 12)),
                  Text("Super Admin", style: TextStyle(fontFamily: 'Lexend', fontSize: 10)),
                ],
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down, size: 16),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildStatsAndActionRow(double width) {
    bool isMobile = width < 800;

    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: isMobile ? 0 : 1,
          child: Row(
            children: [
              Expanded(child: _statCard("TOTAL PERSONNEL", "142", "+12% vs last month", Icons.people_alt_outlined)),
              const SizedBox(width: 24),
              Expanded(child: _activeStatCard()),
            ],
          ),
        ),
        if (isMobile) const SizedBox(height: 24),
        if (!isMobile) const Spacer(),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.person_add_alt_1, color: Colors.black, size: 20),
          label: const Text("Add Trainer", style: TextStyle(fontFamily: 'Lexend', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryYellow,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: const StadiumBorder(),
          ),
        )
      ],
    );
  }

  Widget _statCard(String title, String count, String subtext, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: creamBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryYellow.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: const TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.bold, color: Colors.brown)),
              const SizedBox(width: 8),
              Icon(icon, size: 16, color: Colors.brown),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(count, style: TextStyle(fontFamily: 'Lexend', fontSize: 32, fontWeight: FontWeight.bold, color: primaryYellow, height: 1.0)),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(subtext, style: const TextStyle(fontFamily: 'Lexend', fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _activeStatCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: creamBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryYellow.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("ACTIVE NOW", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.bold, color: Colors.brown)),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryYellow),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(radius: 3, backgroundColor: Colors.orange),
                    const SizedBox(width: 4),
                    Text("Live", style: TextStyle(fontFamily: 'Lexend', fontSize: 10, color: primaryYellow, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("24", style: TextStyle(fontFamily: 'Lexend', fontSize: 32, fontWeight: FontWeight.bold, color: primaryYellow, height: 1.0)),
              const SizedBox(width: 8),
              const Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Text("Peak: 38 (Today)", style: TextStyle(fontFamily: 'Lexend', fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTrainerTable() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryYellow.withOpacity(0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(const Color(0xFFFDF2F0)),
            dataRowMinHeight: 80,
            dataRowMaxHeight: 80,
            dividerThickness: 0, // Removes horizontal lines between rows for a cleaner look
            columns: [
              _dataColumn("TRAINER"),
              _dataColumn("SPECIFICATION"),
              _dataColumn("EXPERIENCE"),
              _dataColumn("ASSIGNED BRANCH"),
              _dataColumn("STATUS"),
              _dataColumn("ACTIONS"),
            ],
            rows: [
              _trainerRow("Aditya M", "adityam@gmail.com", "Strength Training", "5 years", "Unit 45 Fitness"),
              _trainerRow("Marcus Vane", "marcus@gmail.com", "CrossFit", "7 years", "Uptown Kinetic"),
              _trainerRow("Emily John", "emily01@gmail.com", "Yoga & Flow", "4 years", "Westside Pulse"),
              _trainerRow("Rahul K T", "rahulkt@gmail.com", "Body Building", "6 years", "Ozone Gym"),
              _trainerRow("Arjun Das", "arjundas@gmail.com", "Weight Loss", "3 years", "Stark Fitness"),
            ],
          ),
        ),
      ),
    );
  }

  DataColumn _dataColumn(String title) {
    return DataColumn(
      label: Text(
        title,
        style: const TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.brown),
      ),
    );
  }

  DataRow _trainerRow(String name, String email, String spec, String exp, String branch) {
    return DataRow(cells: [
      DataCell(Row(
        children: [
          const CircleAvatar(radius: 18, backgroundColor: Colors.grey), // Placeholder for image
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black)),
              Text(email, style: const TextStyle(fontFamily: 'Lexend', fontSize: 11, color: Colors.grey)),
            ],
          )
        ],
      )),
      DataCell(Text(spec, style: const TextStyle(fontFamily: 'Lexend', fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87))),
      DataCell(Text(exp, style: const TextStyle(fontFamily: 'Lexend', fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87))),
      DataCell(Text(branch, style: const TextStyle(fontFamily: 'Lexend', fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87))),
      DataCell(Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: primaryYellow.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text("Active", style: TextStyle(fontFamily: 'Lexend', fontSize: 11, fontWeight: FontWeight.bold, color: primaryYellow)),
      )),
      DataCell(Row(
        children: [
          Icon(Icons.edit_outlined, size: 16, color: Colors.grey.shade700),
          const SizedBox(width: 16),
          Icon(Icons.visibility_outlined, size: 16, color: Colors.grey.shade700),
        ],
      )),
    ]);
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Showing 1 to 3 of 150 total personnel", style: TextStyle(fontFamily: 'Lexend', color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
        Row(
          children: [
            _pageSquare("<", false),
            _pageSquare("1", true),
            _pageSquare("2", false),
            _pageSquare("3", false),
            _pageSquare(">", false),
          ],
        )
      ],
    );
  }

  Widget _pageSquare(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isActive ? primaryYellow : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Lexend',
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.black : Colors.black54,
        ),
      ),
    );
  }
}