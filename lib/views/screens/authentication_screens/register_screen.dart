import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header text
              Center(
                child: Text(
                  "Create Your Account",
                  style: GoogleFonts.lato(
                    color: const Color(0xFF0d120E),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                    fontSize: 23,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Display an image (e.g., a logo or illustration)
              Center(
                child: Image.asset(
                  'assets/images/mvec.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),

              // Full Name input field
              _buildInputField(
                label: 'Full Name',
                hintText: 'Enter your full name',
                iconPath: 'assets/icons/user.png',
              ),
              const SizedBox(height: 20),

              // Email input field
              _buildInputField(
                label: 'Email',
                hintText: 'Enter your email',
                iconPath: 'assets/icons/email.png',
              ),
              const SizedBox(height: 20),

              // Password input field
              _buildInputField(
                label: 'Password',
                hintText: 'Enter your password',
                iconPath: 'assets/icons/password.png',
                isPassword: true,
              ),
              const SizedBox(height: 20),

              // Confirm Password input field
              _buildInputField(
                label: 'Confirm Password',
                hintText: 'Confirm your password',
                iconPath: 'assets/icons/password.png',
                isPassword: true,
              ),
              const SizedBox(height: 30),

              // Sign Up button
              _buildSignUpButton(),
              const SizedBox(height: 20),

              // Login suggestion row
              _buildLoginRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    required String iconPath,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: isPassword,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.5),
              borderRadius: BorderRadius.circular(9),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(9),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.nunitoSans(
              fontSize: 14,
              color: Colors.grey[700],
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                iconPath,
                width: 20,
                height: 20,
              ),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF102DE1),
            Color(0xCC0D6EFF),
          ],
        ),
      ),
      child: TextButton(
        onPressed: () {
          // Add your sign-up logic here
        },
        child: Text(
          'Sign Up',
          style: GoogleFonts.lato(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an Account? ',
          style: GoogleFonts.nunitoSans(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate back to the login screen
            Navigator.pop(context);
          },
          child: Text(
            'Login',
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF102DE1),
            ),
          ),
        ),
      ],
    );
  }
}
