import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center widget eklendi
        child: Padding(
          // Kenarlardan boşluk için Padding eklendi
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Your Account",
                style: GoogleFonts.getFont(
                  'Lato',
                  color: const Color(0xFF0d120E),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  fontSize: 23,
                ),
              ),
              const SizedBox(height: 10), // Metinler arası boşluk
              Text(
                'To explore the world exclusives',
                style: GoogleFonts.getFont(
                  'Lato',
                  color: const Color(0xFF0d120E),
                  fontSize: 14,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 30), // Metin ve resim arası boşluk
              Image.asset(
                'assets/images/Illustration.png',
                width: 200,
                height: 200,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: GoogleFonts.getFont(
                    'Nunito Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
