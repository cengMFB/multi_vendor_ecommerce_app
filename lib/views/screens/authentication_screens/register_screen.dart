import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_vendor_ecommerce_app/controllers/auth_controller.dart';
import 'package:multi_vendor_ecommerce_app/views/screens/authentication_screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController = AuthController();

  bool _isLoading = false;

  late String email;

  late String fullName;

  late String password;

  bool _isObsecure = true;

  registerUser() async {
    BuildContext localContext = context;
    setState(() {
      _isLoading = true;
    });
    String result =
        await _authController.registerNewUser(email, fullName, password);
    if (result == 'success') {
      Future.delayed(Duration.zero, () {
        Navigator.push(localContext, MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Congrulation account have been created for you !')));
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      // Ensures the screen resizes when the keyboard opens
      resizeToAvoidBottomInset: true,

      // Adds vertical padding to prevent overflow
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Your Account",
                    style: GoogleFonts.getFont(
                      'Lato',
                      color: const Color(0xFF0d120E),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      fontSize: 23,
                    ),
                  ),
                  Image.asset(
                    'assets/images/mvec.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Full Name',
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      fullName = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Full Name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'Enter Your Full Name',
                        labelStyle: GoogleFonts.getFont(
                          'Nunito Sans',
                          fontSize: 14,
                          letterSpacing: 0.1,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/icons/user.jpeg',
                            width: 20,
                            height: 20,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
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
                  ),
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter your email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'Enter your email',
                        labelStyle: GoogleFonts.getFont(
                          'Nunito Sans',
                          fontSize: 14,
                          letterSpacing: 0.1,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/icons/email.png',
                            width: 20,
                            height: 20,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: _isObsecure,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      labelText: 'Enter your password',
                      labelStyle: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontSize: 14,
                        letterSpacing: 0.1,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/icons/password.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObsecure = !_isObsecure;
                          });
                        },
                        icon: Icon(
                          _isObsecure ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        registerUser();
                      }
                    },
                    child: Container(
                      width: 319,
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
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Sign up',
                                style: GoogleFonts.getFont(
                                  'Lato',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already an Account ? ',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }));
                        },
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 191, 22, 238),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
