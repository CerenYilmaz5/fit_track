import 'package:fit_track/StatsPlanningPage.dart';
import 'package:fit_track/daily_diet_page.dart';
import 'package:fit_track/workout_page.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FitnessLoginPage(title: 'Fit Track Login'),
    );
  }
}
