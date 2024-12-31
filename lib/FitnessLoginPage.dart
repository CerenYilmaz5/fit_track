import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/StatsPlanningPage.dart';
import 'package:flutter/material.dart';
import 'ForgotPasswordPage.dart';
import 'SignUpStep1.dart';

class FitnessLoginPage extends StatelessWidget {
  final String title;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  FitnessLoginPage({super.key, required this.title});

  Future<void> login(BuildContext context, String email, String password) async {
    try {
      // Sign in the user
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        // Get the currently signed-in user
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          // Fetch the user's goal from Firestore
          DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
          // Navigate to StatsPlanning
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StatsPlanning(
                goal: userDoc['goal'],
                days: userDoc['available_days'], // Pass available days
                fitnessLevel: userDoc['fitness_level'], // Pass fitness level
              ),
            ),
          );
          print("User signed in and navigated to StatsPlanning");
        }
      } else {
        print("No user is signed in");
      }
    } catch (e) {
      print("Error logging in: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black38, Colors.white,Colors.black54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(child:
                  Image.asset("lib/assets/logo.jpg"),
                  width: 300,
                  height: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to Fit Track!',
                  style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Stay healthy, stay strong. Let's achieve your goals together!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: passwordController,
                  obscureText: true, // Secure text for passwords
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: GradientButton(
                    title: "Log In",
                    icon: Icons.login,
                    gradientColors: [Colors.red,Colors.black54,Colors.red],
                    onTap: () {
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      if (email.isNotEmpty && password.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Welcome: $email')),
                        );
                        login(context, email, password); // Pass the BuildContext
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill all fields!')),
                        );
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  SignUpStep1(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
