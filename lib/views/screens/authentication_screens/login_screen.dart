import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_vendor_ecommerce_app/views/screens/authentication_screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  "Login Your Account",
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
              const SizedBox(height: 30),

              // Sign In button
              _buildSignInButton(),
              const SizedBox(height: 20),

              // Sign-up suggestion row
              _buildSignUpRow(context),
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

  Widget _buildSignInButton() {
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
          // Add your sign-in logic here
        },
        child: Text(
          'Sign in',
          style: GoogleFonts.lato(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Need an Account? ',
          style: GoogleFonts.nunitoSans(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to the sign-up screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const RegisterScreen(); // Ensure RegisterScreen is defined
              }),
            );
          },
          child: Text(
            'Sign Up',
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
