import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String selectedGender = 'Male';
  bool isHeightInCm = true;
  bool isWeightInKg = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFAC00C)),
          onPressed: () => Navigator.pop(context),
        ),
        trailing: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'SAVE',
            style: TextStyle(
              color: Color(0xFFFAC00C),
              fontWeight: FontWeight.w900,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            // Profile Photo Section
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFFAC00C), width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=400&q=80',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFAC00C),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit, size: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'CHANGE PHOTO',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF8B735B),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Form Fields
            _buildInputField(
              label: 'Full Name',
              initialValue: 'Alan Geo Kurian',
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    label: 'Age',
                    initialValue: '31',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDropdownField(
                    label: 'Gender',
                    value: selectedGender,
                    items: ['Male', 'Female', 'Other'],
                    onChanged: (val) => setState(() => selectedGender = val!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: _buildUnitInputField(
                    label: 'Height',
                    value: '175',
                    unit: isHeightInCm ? 'cm' : 'ft',
                    units: const ['CM', 'FT'],
                    isFirstUnitSelected: isHeightInCm,
                    onToggle: (val) => setState(() => isHeightInCm = val),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildUnitInputField(
                    label: 'Weight',
                    value: '87',
                    unit: isWeightInKg ? 'kg' : 'lb',
                    units: const ['KG', 'LB'],
                    isFirstUnitSelected: isWeightInKg,
                    onToggle: (val) => setState(() => isWeightInKg = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // Deactivate Account Button
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEF9E7),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: const Color(0xFFFAC00C).withValues(alpha: 0.2)),
                  ),
                ),
                child: const Text(
                  'DEACTIVATE ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required String label, required String initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: initialValue,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF8B735B),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFDFDFD),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFFAC00C), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFFAC00C), width: 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color(0xFFFAC00C), width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF8B735B),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUnitInputField({
    required String label,
    required String value,
    required String unit,
    required List<String> units,
    required bool isFirstUnitSelected,
    required ValueChanged<bool> onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color(0xFFFAC00C), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: _buildToggleSwitch(units, isFirstUnitSelected, onToggle),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF8B735B),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    unit,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF8B735B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleSwitch(List<String> labels, bool isFirstSelected, ValueChanged<bool> onToggle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => onToggle(true),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isFirstSelected ? const Color(0xFFFAC00C) : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                labels[0],
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: isFirstSelected ? Colors.black : Colors.grey[600],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onToggle(false),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: !isFirstSelected ? const Color(0xFFFAC00C) : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                labels[1],
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: !isFirstSelected ? Colors.black : Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
