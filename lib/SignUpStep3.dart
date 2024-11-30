import 'package:fit_track/StatsPlanningPage.dart';
import 'package:flutter/material.dart';

class SignUpStep3 extends StatelessWidget {
  final String selectedFitnessLevel; // Required fitness level
  final ValueNotifier<String?> selectedGoal = ValueNotifier<String?>(null);
  final ValueNotifier<int?> availableDays = ValueNotifier<int?>(null);

  SignUpStep3({super.key, required this.selectedFitnessLevel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                              : const Color(0xFFB3E5FC),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(goal),
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
                              : const Color(0xFFB3E5FC),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text('$days'),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (selectedGoal.value != null && availableDays.value != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatsPlanning(
                        goal: selectedGoal.value!,
                        days: availableDays.value!,
                        fitnessLevel: selectedFitnessLevel, // Pass fitness level
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
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
    );
  }
}
