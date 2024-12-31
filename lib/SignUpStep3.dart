import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/SignUpStep2.dart';
import 'package:fit_track/StatsPlanningPage.dart';
import 'package:flutter/material.dart';

class SignUpStep3 extends StatelessWidget {
  final ValueNotifier<String?> selectedGoal = ValueNotifier<String?>(null);
  final ValueNotifier<int?> availableDays = ValueNotifier<int?>(null);
  final SignUpStep2 signUpStep2;

  SignUpStep3({super.key, required this.signUpStep2});

  int calculateBFP() {
    double neck = double.tryParse(signUpStep2.neckCircumferenceController.text.trim()) ?? 0;
    double waist = double.tryParse(signUpStep2.waistCircumferenceController.text.trim()) ?? 0;
    double height = double.tryParse(signUpStep2.heightController.text.trim()) ?? 0;

    String? gender = signUpStep2.gender.value!;

    if (gender == 'female') {
      double hip = double.tryParse(signUpStep2.hipCircumferenceController.text.trim()) ?? 0;
      return (495 / (1.29579 - 0.35004 * log(waist + hip - neck) / ln10 + 0.221 * log(height) / ln10) - 450).round();
    } else {
      return (495 / (1.0324 - 0.19077 * log(waist - neck) / ln10 + 0.15456 * log(height) / ln10) - 450).round();
    }
  }

  int calculateBMI() {
    double weight = double.tryParse(signUpStep2.weightController.text.trim()) ?? 0;
    double height = double.tryParse(signUpStep2.heightController.text.trim()) ?? 0;

    if (height == 0) {
      return 0; // Avoid division by zero
    }

    return (weight / pow(height / 100, 2)).round();
  }


  int calculateCalories() {
    // Retrieve user details
    double weight = double.tryParse(signUpStep2.weightController.text.trim()) ?? 0;
    double height = double.tryParse(signUpStep2.heightController.text.trim()) ?? 0;
    int age = int.tryParse(signUpStep2.ageController.text.trim()) ?? 0;
    String? gender = signUpStep2.gender.value;
    String? goal = selectedGoal.value;
    int? days = availableDays.value;

    double bmr;
    if (gender == 'male') {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5; // Male BMR
    } else {
      bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161; // Female BMR
    }

    double activityFactor;
    if (days == 2) {
      activityFactor = 1.375;
    } else if (days == 3) {
      activityFactor = 1.55;
    } else if (days == 4) {
      activityFactor = 1.725;
    } else if (days == 5) {
      activityFactor = 1.9;
    } else {
      activityFactor = 1.2; // Default for less than 2 days
    }

    double tdee = bmr * activityFactor;

    double calorieAdjustment = 0;
    if (goal == 'Lose Weight') {
      calorieAdjustment = -500;
    } else if (goal == 'Gain Muscle') {
      calorieAdjustment = 500;
    } else if (goal == 'Definition') {
      calorieAdjustment = 0;
    }

    return (tdee + calorieAdjustment).round();
  }

  Future<void> addUserDetails() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        int dailyCalories = calculateCalories();
        int bmi = calculateBMI();
        int bfp = calculateBFP();

        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'age': signUpStep2.ageController.text.trim(),
          'weight': signUpStep2.weightController.text.trim(),
          'height': signUpStep2.heightController.text.trim(),
          'neck_circumference': signUpStep2.neckCircumferenceController.text.trim(),
          'waist_circumference': signUpStep2.waistCircumferenceController.text.trim(),
          'hip_circumference': signUpStep2.hipCircumferenceController.text.trim(),
          'goal': selectedGoal.value!,
          'available_days': availableDays.value!,
          'fitness_level': signUpStep2.fitnessLevel.value!,
          'gender': signUpStep2.gender.value!,
          'daily_calories': dailyCalories,
          'bmi': bmi,
          'bfp':bfp,
        });

        print("User details and daily calories added to Firestore");
      } else {
        print("No user is signed in");
      }
    } catch (e) {
      print("Error adding user details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.grey,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/deneme_resim.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'What is your goal?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder<String?>(
                      valueListenable: selectedGoal,
                      builder: (context, value, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var goal in ['Lose Weight', 'Gain Muscle', 'Definition'])
                              ElevatedButton(
                                onPressed: () {
                                  selectedGoal.value = goal;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: value == goal
                                      ? Colors.blue
                                      : const Color(0x0000000F),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  goal,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'How many days are you available for workouts?',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder<int?>(
                      valueListenable: availableDays,
                      builder: (context, value, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int days = 2; days <= 5; days++)
                              ElevatedButton(
                                onPressed: () {
                                  availableDays.value = days;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: value == days
                                      ? Colors.blue
                                      : const Color(0x0000000F),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  '$days',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedGoal.value != null &&
                              availableDays.value != null) {
                            addUserDetails();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StatsPlanning(
                                  goal: selectedGoal.value!,
                                  days: availableDays.value!,
                                  fitnessLevel: signUpStep2.fitnessLevel.value!,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
