import 'package:fit_track/StatsPlanningPage.dart';
import 'package:flutter/material.dart';

class SignUpStep3 extends StatelessWidget {
  const SignUpStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text('What is your gaol',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height:30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Loose Weight')),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Gain Muscle')),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Definition')),

              ],

            ),
            const SizedBox(height:20),
            const Text('How many times do you have availability for workout?',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height:20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('2')),

                ElevatedButton(
                    onPressed: () {},
                    child: const Text('3')),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('4')),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('5')),
              ],
            ),


            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StatsPlanning(),
                  ),
                );
              },
              child: const Text("İleri"),
            )
          ],
        ),),


    );
  }


}