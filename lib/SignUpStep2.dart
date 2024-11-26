import 'package:flutter/material.dart';

import 'SignUpStep3.dart';

class SignUpStep2 extends StatelessWidget {
  const SignUpStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Fitness Level', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('Beginner')),
                    ElevatedButton(onPressed: () {}, child: const Text('Intermediate')),
                    ElevatedButton(onPressed: () {}, child: const Text('Expert')),

                  ],
                ),
                const SizedBox(height:20),
                const TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),labelText: 'Age')),
                const SizedBox(height:20),
                const TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),labelText: 'Weight (kg)')),
                const SizedBox(height:20),
                const TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),labelText: 'Height (cm)')),
                const SizedBox(height:20),
                const TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),labelText: 'Neck Circumstances (cm)')),
                const SizedBox(height:20),
                const TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),labelText: 'Waist Circumstances (cm)')),
                const SizedBox(height:20),
                const TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Hip Circumstances (cm)')),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpStep3(),
                      ),
                    );
                  },
                  child: const Text("İleri"),
                ),
              ],
            ),),
        ),
      ),
    );
  }
}