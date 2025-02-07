import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_vendor_ecommerce_app/views/screens/authentication_screens/login_screen.dart';
import 'package:multi_vendor_ecommerce_app/views/screens/main_screen.dart';
import 'package:multi_vendor_ecommerce_app/views/screens/nav_screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          name: "multi-vendor-app",
          options: const FirebaseOptions(
              apiKey: 'AIzaSyAkwdccw5e-YLGLgz14ussCHd7IyPhdZWw',
              appId: '1:960895219512:android:f412dcbbae2b37c62073cd',
              messagingSenderId: '960895219512',
              projectId: 'multi-vendor-app-438dd',
              storageBucket: 'gs://multi-vendor-app-438dd.firebasestorage.app'))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
