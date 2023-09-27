import 'dart:async';

import 'package:ecommerce/Screens/Login_onborading/SIgnIn_Email.dart';
import 'package:ecommerce/Screens/homepage/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 3),
        () => _auth.currentUser != null
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()))
            : Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInEmail())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9747FF),
      body: Center(
        child: Image.asset('images/Clot.png'),
      ),
    );
  }
}
