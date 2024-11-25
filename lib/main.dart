import 'package:flutter/material.dart';
import 'ForgotPasswordPage.dart';
import 'SignUpStep1.dart';
import 'SignUpStep2.dart';
import 'SignUpStep3.dart';
import 'FitnessLoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FitnessLoginPage(title: 'Fit Track Login'),
      routes: {
        '/forgotPassword': (context) => const ForgotPasswordPage(),
        '/signUpStep1': (context) => const SignUpStep1(),
        '/signUpStep2': (context) => const SignUpStep2(),
        '/signUpStep3': (context) => const SignUpStep3(),
      },
    );
  }
}
