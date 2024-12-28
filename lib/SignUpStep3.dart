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

  Future<void> addUserDetails() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Create or update a Firestore document for the user
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'age': signUpStep2.ageController.text.trim(),
          'weight': signUpStep2.weightController.text.trim(),
          'height': signUpStep2.heightController.text.trim(),
          'neck_circumference': signUpStep2.neckCircumferenceController.text.trim(),
          'waist_circumference': signUpStep2.waistCircumferenceController.text.trim(),
          'hip_circumference': signUpStep2.hipCircumferenceController.text.trim(),
          'goal':selectedGoal.value!,
          'available_days':availableDays.value!,
          'fitness_level':signUpStep2.fitnessLevel.value!,
        });
        print("User details added to Firestore");
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
          decoration:  BoxDecoration(
            //color: Colors.black.withOpacity(0.3),
            image: DecorationImage(image: AssetImage("lib/assets/deneme_resim.jpeg"),
              fit: BoxFit.cover,
            ),),),

        Center(
        child: SingleChildScrollView(
        child:Container(
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
                        child: Text(goal,style: const TextStyle(color: Colors.white,),),
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
                        child: Text('$days',style: const TextStyle(color: Colors.white,),),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (selectedGoal.value != null && availableDays.value != null) {
                  addUserDetails();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatsPlanning(
                        goal: selectedGoal.value!,
                        days: availableDays.value!,
                        fitnessLevel: signUpStep2.fitnessLevel.value!, // Pass fitness level
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
