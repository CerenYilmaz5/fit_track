import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: SignUpStep1(),
    );
  }
}

class SignUpStep1 extends StatelessWidget {
  const SignUpStep1({super.key});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),

      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email'),
            ),
            SizedBox(height:20),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Username'),
            ),
            SizedBox(height:20),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height:20),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}



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
              ],
            ),),
        ),
      ),
    );
  }
}






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



          ],
        ),),


    );
  }


}







