import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import '../admin/screens/admin_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Text(
                'Welcome Back',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFAC00C),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'ACCESS YOUR HIGH-PERFORMANCE ENGINE',
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 80),
              
              // Email Field
              _buildLabel('EMAIL ADDRESS'),
              _buildTextField('alex@example.com', controller: _emailController),
              
              const SizedBox(height: 30),
              
              // Password Field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLabel('PASSWORD'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Forgot Password ?',
                      style: GoogleFonts.lexend(
                        color: const Color(0xFFFAC00C),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              _buildTextField(
                '••••••••', 
                controller: _passwordController,
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_outlined, color: Colors.black54),
              ),
              
              const SizedBox(height: 40),
              
              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_emailController.text == 'admin@gmail.com' && _passwordController.text == '123') {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const AdminDashboardScreen()),
                      );
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFAC00C),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Or Divider
              Row(
                children: [
                  Expanded(child: Container(height: 1, color: Colors.black12)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'or',
                      style: GoogleFonts.lexend(color: Colors.black45, fontSize: 12),
                    ),
                  ),
                  Expanded(child: Container(height: 1, color: Colors.black12)),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Login with Phone
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFFAC00C)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'LOGIN WITH PHONE',
                    style: GoogleFonts.lexend(
                      color: const Color(0xFF33201C),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 60),
              
              // Signup Link
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'if you don\'t have an account ? ',
                    style: GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: GoogleFonts.lexend(
                          color: const Color(0xFFFAC00C),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, bottom: 8),
        child: Text(
          label,
          style: GoogleFonts.lexend(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {required TextEditingController controller, bool obscureText = false, Widget? suffixIcon}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3D0).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.lexend(
            color: Colors.black54,
            fontSize: 14,
          ),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
