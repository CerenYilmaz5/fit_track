import 'package:cloud_firestore/cloud_firestore.dart';
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
    var collection = FirebaseFirestore.instance.collection("users");
    collection.add({
      //"email":emailController.text.trim(),
      //"password":passwordController.text.trim(),
      "age":"",
      "height":"",
    });


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
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    labelText: 'Weight (kg)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    labelText: 'Height (cm)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: neckCircumferenceController,
                  decoration: InputDecoration(
                    labelText: 'Neck Circumference (cm)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: waistCircumferenceController,
                  decoration: InputDecoration(
                    labelText: 'Waist Circumference (cm)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: hipCircumferenceController,
                  decoration: InputDecoration(
                    labelText: 'Hip Circumference (cm)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
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
