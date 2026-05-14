import 'package:flutter/material.dart';
import '../widgets/admin_sidebar.dart';
import '../widgets/admin_app_bar.dart';

class BranchManagementScreen extends StatelessWidget {
  const BranchManagementScreen({super.key});

  final Color primaryYellow = const Color(0xFFFAC00C);
  final Color creamBg = const Color(0xFFFFFDF5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AdminAppBar(title: "Branch Management"),
      drawer: Drawer(
        child: AdminSidebar(
          selectedItem: "Branches",
          onItemSelected: (item) {
            Navigator.pop(context); // Close drawer
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 1100;
          int crossAxisCount = constraints.maxWidth > 1300 ? 3 : (constraints.maxWidth > 800 ? 2 : 1);

          return Row(
            children: [
              if (isDesktop)
                AdminSidebar(
                  selectedItem: "Branches",
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
                          _buildTopBar(isDesktop),
                          const SizedBox(height: 32),
                          _buildHeaderActions(isDesktop),
                          const SizedBox(height: 32),
                          _buildBranchGrid(crossAxisCount),
                          const SizedBox(height: 24),
                          _buildPagination(),
                          const SizedBox(height: 40),
                          _buildPerformanceMatrix(),
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

  Widget _buildTopBar(bool isDesktop) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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

  Widget _buildHeaderActions(bool isDesktop) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: creamBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: primaryYellow.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("ACTIVE USERS", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text("12.8 k", style: TextStyle(fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.bold, color: primaryYellow)),
                  const SizedBox(width: 8),
                  Icon(Icons.trending_up, color: Colors.green.shade700, size: 18),
                ],
              )
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.black, size: 20),
          label: const Text("Add New Branch", style: TextStyle(fontFamily: 'Lexend', color: Colors.black, fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryYellow,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            shape: StadiumBorder(),
          ),
        )
      ],
    );
  }

  Widget _buildBranchGrid(int crossAxisCount) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: 0.75, // Adjust based on your exact layout needs
      children: [
        _branchCard("UNIT 45 FITNESS", "2,450", "742 Neon Plaza, Sector 4", "Marcus Vane", "ACTIVE", true),
        _branchCard("OZONE GYM", "1892", "12 Summit Blvd, Heights", "Rahul K T", "MAINTENANCE", false),
        _branchCard("STARK FITNESS", "1892", "55 Foundry st, Industry", "Aditya M", "ACTIVE", true),
      ],
    );
  }

  Widget _branchCard(String title, String members, String address, String manager, String status, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryYellow.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          // Image Header
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    color: Colors.grey.shade300, // Placeholder for branch images
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(fontFamily: 'Lexend', color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Content
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 16)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(members, style: TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, color: primaryYellow, fontSize: 16)),
                          const Text("MEMBERS", style: TextStyle(fontFamily: 'Lexend', fontSize: 8, color: Colors.grey, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 14, color: primaryYellow),
                      const SizedBox(width: 4),
                      Text(address, style: const TextStyle(fontFamily: 'Lexend', fontSize: 11, color: Colors.black87)),
                    ],
                  ),
                  const Spacer(),
                  // Hub Lead Section
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: creamBg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: primaryYellow.withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 18, backgroundColor: Colors.grey),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("HUB LEAD", style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                            Text(manager, style: const TextStyle(fontFamily: 'Lexend', fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Actions Row 1
                  Row(
                    children: [
                      Expanded(child: _actionButton("DETAILS", Icons.visibility_outlined)),
                      const SizedBox(width: 12),
                      Expanded(child: _actionButton("EDIT", Icons.edit_outlined)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Actions Row 2
                  SizedBox(
                    width: double.infinity,
                    child: _actionButton("OPERATIONAL CONTROL", Icons.settings_outlined),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _actionButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 14, color: primaryYellow),
      label: Text(label, style: const TextStyle(fontFamily: 'Lexend', color: Colors.black87, fontSize: 10, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Showing 1 to 3 of 12 branches", style: TextStyle(fontFamily: 'Lexend', color: Colors.grey, fontSize: 12)),
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

  Widget _buildPerformanceMatrix() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryYellow.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Branch Performance Matrix", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 18)),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(Icons.filter_list, color: Colors.black87, size: 16), 
                    label: const Text("FILTER", style: TextStyle(fontFamily: 'Lexend', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12))
                  ),
                  const SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () {}, 
                    icon: Icon(Icons.download_rounded, color: Colors.black87, size: 16), 
                    label: const Text("EXPORT", style: TextStyle(fontFamily: 'Lexend', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12))
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(const Color(0xFFFDF2F0)),
              dataRowMinHeight: 70,
              dataRowMaxHeight: 70,
              columns: const [
                DataColumn(label: Text("BRANCH NAME", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.brown))),
                DataColumn(label: Text("LOCATION", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.brown))),
                DataColumn(label: Text("MANAGER", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.brown))),
                DataColumn(label: Text("MEMBERS", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.brown))),
                DataColumn(label: Text("STATUS", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.brown))),
                DataColumn(label: Text("ACTIONS", style: TextStyle(fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.brown))),
              ],
              rows: [
                _matrixRow("Unit 45 Fitness", "Metro central hub", "Sarah Connor", "1,402"),
                _matrixRow("Uptown Kinetic", "High-rise District", "James Miller", "3,120"),
                _matrixRow("Westside Pulse", "Coastal Terrace", "Linda Wu", "945"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _matrixRow(String name, String loc, String manager, String members) {
    return DataRow(cells: [
      DataCell(Row(
        children: [
          CircleAvatar(
            backgroundColor: primaryYellow.withOpacity(0.2),
            child: Icon(Icons.apartment_rounded, color: primaryYellow, size: 18),
          ),
          const SizedBox(width: 12),
          Text(name, style: const TextStyle(fontFamily: 'Lexend', fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      )),
      DataCell(Text(loc, style: const TextStyle(fontFamily: 'Lexend', fontSize: 13))),
      DataCell(Text(manager, style: const TextStyle(fontFamily: 'Lexend', fontSize: 13, fontWeight: FontWeight.w600))),
      DataCell(Text(members, style: TextStyle(fontFamily: 'Lexend', fontSize: 13, fontWeight: FontWeight.bold, color: primaryYellow))),
      DataCell(Row(
        children: [
          const CircleAvatar(radius: 4, backgroundColor: Colors.green),
          const SizedBox(width: 8),
          const Text("Active", style: TextStyle(fontFamily: 'Lexend', fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      )),
      DataCell(Row(
        children: [
          Icon(Icons.edit_outlined, size: 16, color: Colors.grey.shade600),
          const SizedBox(width: 16),
          Icon(Icons.visibility_outlined, size: 16, color: Colors.grey.shade600),
          const SizedBox(width: 16),
          Icon(Icons.more_vert, size: 16, color: Colors.grey.shade600),
        ],
      )),
    ]);
  }
}