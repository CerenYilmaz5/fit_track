import 'package:fit_track/StatsPlanningPage.dart';
import 'package:flutter/material.dart';
import 'SignUpStep3.dart';

class SignUpStep2 extends StatelessWidget {
  SignUpStep2({super.key});

  final ValueNotifier<String?> fitnessLevel = ValueNotifier<String?>(null);
  var ageController = TextEditingController();
  var weightController = TextEditingController();
  var heightController = TextEditingController();
  var neckCircumferenceController = TextEditingController();
  var waistCircumferenceController = TextEditingController();
  var hipCircumferenceController = TextEditingController();

  void getSignUpStep2Info(){
    print(ageController.text.trim());
    print(weightController.text.trim());
    print(heightController.text.trim());
    print(neckCircumferenceController.text.trim());
    print(waistCircumferenceController.text.trim());
    print(hipCircumferenceController.text.trim());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select Your Fitness Level',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<String?>(
                  valueListenable: fitnessLevel,
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var level in ['Beginner', 'Intermediate', 'Expert'])
                          ElevatedButton(
                            onPressed: () {
                              fitnessLevel.value = level;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: value == level
                                  ? Colors.blue
                                  : const Color(0xFFB3E5FC),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(level),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                UserTextField(text: 'Age', controller: ageController),
                const SizedBox(height: 20),
                UserTextField(text: 'Weight (kg)', controller: weightController),
                const SizedBox(height: 20),
                UserTextField(text: 'Height (cm)', controller: heightController),
                const SizedBox(height: 20),
                UserTextField(text: 'Neck Circumference (cm)', controller: neckCircumferenceController),
                const SizedBox(height: 20),
                UserTextField(text: 'Waist Circumference (cm)', controller: waistCircumferenceController),
                const SizedBox(height: 20),
                UserTextField(text: 'Hip Circumference (cm)', controller: hipCircumferenceController),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (fitnessLevel.value != null) {
                      getSignUpStep2Info();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpStep3(
                            selectedFitnessLevel: fitnessLevel.value!,
                          ),
                        ),
                      );
                    } else {
                      // Display an alert if no fitness level is selected
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Please select your fitness level.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
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
        ),
      ),
    );
  }
}


class UserTextField extends StatelessWidget{
  const UserTextField({super.key,required this.text ,required this.controller});
  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}