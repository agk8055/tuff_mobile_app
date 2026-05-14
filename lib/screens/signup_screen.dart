import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalSteps = 8;

  // Form Data
  String _name = '';
  String _email = '';
  String _password = '';
  String _gender = '';
  String _birthday = '';
  double _height = 178;
  double _weight = 75;
  bool _isCm = true;
  bool _isKg = true;
  DateTime? _selectedDate;
  String _experience = '';
  bool? _hasInjury;
  final List<String> _selectedInjuries = [];

  void _nextPage() {
    if (_currentPage < _totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Show Success Screen
      setState(() {
        _currentPage = 8; 
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPage == 8) {
      return _buildSuccessScreen();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: SafeArea(
            child: Column(
              children: [
                _buildTopHeader(),
                Expanded(child: _buildPageView()),
                _buildBottomButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFFFAC00C)),
            onPressed: _previousPage,
          ),
          Text(
            'STEP ${_currentPage + 1} OF $_totalSteps',
            style: GoogleFonts.lexend(
              color: const Color(0xFFFAC00C),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      children: [
        _buildAccountStep(), 
        _buildNameStep(),
        _buildGenderStep(), 
        _buildBirthdayStep(), 
        _buildHeightStep(), 
        _buildWeightStep(), 
        _buildExperienceStep(), 
        _buildInjuryStep(), 
      ],
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _nextPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFAC00C),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: Text(
            'NEXT',
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildStepTitle("Create your ", "account"),
          _buildStepDescription("We need your email and password to secure your fitness data."),
          const Spacer(),
          Text(
            'EMAIL ADDRESS',
            style: GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3D0).withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (val) => _email = val,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFFFAC00C)),
                hintText: 'example@gmail.com',
                hintStyle: GoogleFonts.lexend(color: Colors.black26),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'PASSWORD',
            style: GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3D0).withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              obscureText: true,
              onChanged: (val) => _password = val,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFFAC00C)),
                hintText: '••••••••',
                hintStyle: GoogleFonts.lexend(color: Colors.black26),
                suffixIcon: const Icon(Icons.visibility_outlined, color: Colors.black45),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildStepTitle(String text, String yellowText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: text),
              TextSpan(
                text: yellowText,
                style: const TextStyle(color: Color(0xFFFAC00C)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildStepDescription(String desc) {
    return Text(
      desc,
      style: GoogleFonts.lexend(
        fontSize: 14,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildNameStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildStepTitle("What's your ", "name ?"),
          _buildStepDescription("We will use this to personalize your training experience."),
          const Spacer(),
          Center(
            child: Text(
              'Full Name',
              style: GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.5)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (val) => _name = val,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline, color: Color(0xFFFAC00C)),
                hintText: 'John mathew',
                hintStyle: GoogleFonts.lexend(color: Colors.black26),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildGenderStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildStepTitle("Select your ", "gender"),
          _buildStepDescription("To give you a better experience we need to know your gender."),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _genderIcon(Icons.male, 'Male'),
              _genderIcon(Icons.female, 'Female'),
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _genderIcon(IconData icon, String label) {
    bool isSelected = _gender == label;
    return GestureDetector(
      onTap: () => setState(() => _gender = label),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFFAC00C) : const Color(0xFFFEF3D0),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 50, color: isSelected ? Colors.white : const Color(0xFFFAC00C)),
          ),
          const SizedBox(height: 10),
          Text(label, style: GoogleFonts.lexend(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBirthdayStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildStepTitle("When's your ", "Birthday ?"),
          _buildStepDescription("We use this to calculate your age and provide more accurate health insights."),
          const Spacer(),
          Center(
            child: Column(
              children: [
                const Icon(Icons.cake, size: 60, color: Color(0xFFFAC00C)),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() {
                        _selectedDate = date;
                        _birthday = "${date.day}/${date.month}/${date.year}";
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _dateBox(_selectedDate?.day.toString().padLeft(2, '0') ?? 'DD'),
                      const SizedBox(width: 15),
                      _dateBox(_selectedDate?.month.toString().padLeft(2, '0') ?? 'MM'),
                      const SizedBox(width: 15),
                      _dateBox(_selectedDate?.year.toString() ?? 'YYYY'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _dateBox(String label) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3D0),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildHeightStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildStepTitle("How ", "Tall are you ?"),
          _buildStepDescription("Your height helps us personalize your calorie burn and stride length calculations."),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF3D0),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${_height.toInt()} ',
                              style: GoogleFonts.lexend(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFAC00C),
                              ),
                            ),
                            TextSpan(
                              text: _isCm ? 'cm' : 'ft',
                              style: GoogleFonts.lexend(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _toggleButton(
                        'CM', 'FT', _isCm, (val) => setState(() => _isCm = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Slider(
                  value: _height,
                  min: 100,
                  max: 250,
                  activeColor: const Color(0xFFFAC00C),
                  inactiveColor: const Color(0xFFFEF3D0),
                  onChanged: (val) => setState(() => _height = val),
                ),
                const SizedBox(height: 10),
                Text(
                  "DRAG TO ADJUST HEIGHT",
                  style: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black26),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildWeightStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildStepTitle("How much do you ", "Weight ?"),
          _buildStepDescription("We use this to calculate your daily calorie burn and personalized workout intensity."),
          const Spacer(),
          Center(
            child: Column(
              children: [
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF3D0),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${_weight.toInt()} ',
                              style: GoogleFonts.lexend(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFAC00C),
                              ),
                            ),
                            TextSpan(
                              text: _isKg ? 'kg' : 'lb',
                              style: GoogleFonts.lexend(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _toggleButton(
                        'KG', 'LB', _isKg, (val) => setState(() => _isKg = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Slider(
                  value: _weight,
                  min: 30,
                  max: 200,
                  activeColor: const Color(0xFFFAC00C),
                  inactiveColor: const Color(0xFFFEF3D0),
                  onChanged: (val) => setState(() => _weight = val),
                ),
                const SizedBox(height: 10),
                Text(
                  "DRAG TO ADJUST WEIGHT",
                  style: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black26),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _toggleButton(String left, String right, bool isLeft, Function(bool) onChanged) {
    return Container(
      width: 100,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: Container(
                decoration: BoxDecoration(
                  color: isLeft ? const Color(0xFFFAC00C) : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(child: Text(left, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: Container(
                decoration: BoxDecoration(
                  color: !isLeft ? const Color(0xFFFAC00C) : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(child: Text(right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildStepTitle("What's your training ", "Experience?"),
          _buildStepDescription("This helps us tailor your workout intensity."),
          const SizedBox(height: 40),
          _experienceCard("Beginner", "New to training.", Icons.rocket_launch_outlined),
          const SizedBox(height: 15),
          _experienceCard("Intermediate", "1-2 year experience.", Icons.fitness_center),
          const SizedBox(height: 15),
          _experienceCard("Advanced", "3+ year experience.", Icons.bolt),
        ],
      ),
    );
  }

  Widget _experienceCard(String title, String subtitle, IconData icon) {
    bool isSelected = _experience == title;
    return GestureDetector(
      onTap: () => setState(() => _experience = title),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFEF3D0) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFFFAC00C) : const Color(0xFFFAC00C).withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFFAC00C) : const Color(0xFFFEF3D0),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: isSelected ? Colors.white : const Color(0xFFFAC00C), size: 30),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(subtitle, style: GoogleFonts.lexend(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInjuryStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildStepTitle("Do you have any current ", "Injuries "),
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              children: const [
                TextSpan(text: "or medical conditions ?"),
              ],
            ),
          ),
          _buildStepDescription("We need to know your current physical limitations."),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _injuryOption("YES", Icons.check_circle, true),
              const SizedBox(width: 20),
              _injuryOption("NO", Icons.cancel, false),
            ],
          ),
          const SizedBox(height: 30),
          Center(child: Text("MEDICAL HISTORY", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFFFAC00C)))),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2.2,
              children: [
                _injuryTag("Back pain", Icons.person_outline),
                _injuryTag("Knee injury", Icons.accessibility_new),
                _injuryTag("Shoulder pain", Icons.accessibility),
                _injuryTag("Cardiovascular", Icons.favorite_border),
                _injuryTag("Hip pain", Icons.directions_run),
                _injuryTag("Ankle sprain", Icons.directions_walk),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _injuryOption(String label, IconData icon, bool isYes) {
    bool isSelected = _hasInjury == isYes;
    return GestureDetector(
      onTap: () => setState(() => _hasInjury = isYes),
      child: Container(
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFAC00C) : const Color(0xFFFEF3D0),
          borderRadius: BorderRadius.circular(15),
          border: isSelected ? Border.all(color: Colors.black12, width: 2) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : const Color(0xFFFAC00C), size: 40),
            const SizedBox(height: 5),
            Text(
              label,
              style: GoogleFonts.lexend(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _injuryTag(String label, IconData icon) {
    bool isSelected = _selectedInjuries.contains(label);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedInjuries.remove(label);
          } else {
            _selectedInjuries.add(label);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFAC00C) : Colors.white,
          border: Border.all(color: const Color(0xFFFAC00C).withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : const Color(0xFFFAC00C), size: 20),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.lexend(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessScreen() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(Icons.check, color: Color(0xFFFAC00C), size: 80),
              ),
              const SizedBox(height: 40),
              Text(
                'SUCCESS !',
                style: GoogleFonts.poppins(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFFFAC00C),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your journey to peak performance starts now.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFAC00C),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'GO TO HOME',
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
