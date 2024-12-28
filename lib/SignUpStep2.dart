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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.black,
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
                              style:
                              ElevatedButton.styleFrom(
                                backgroundColor: value == level ? Colors.blue
                                // const Color(0xFFB3E5FC),
                                    : const Color(0x0000000F),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),

                              child: Text(level, style: const TextStyle(color: Colors.white,),),
                            ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  UserTextField(text: 'Age', controller: ageController,),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpStep3(
                              signUpStep2: this,
                            ),
                          ),
                        );
                      } else {

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
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Next', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 23)),
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