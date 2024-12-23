import 'package:flutter/material.dart';
import 'SignUpStep2.dart';

class SignUpStep1 extends StatelessWidget {
  SignUpStep1({super.key});

  var emailController = TextEditingController();
  var  passwordController = TextEditingController();
  var  confirmPasswordController = TextEditingController();


  void getSignUpStep1Info(){
    print(emailController.text.trim());
    print(passwordController.text.trim());
    print(confirmPasswordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sign Up"),
      ),
      body: Center(  // Centering the content on the screen
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),  // Same padding as LoginPage
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Centering children vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Ensuring all children align to the center
              children: [
                // TextField for Email (Centered and styled like in LoginPage)
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'E-Mail', // Matching LoginPage label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // TextField for Password (Centered and styled like in LoginPage)
                TextField(
                  controller:passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password', // Matching LoginPage label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  obscureText: true,  // Secure password input like in LoginPage
                ),
                const SizedBox(height: 20),

                // TextField for Confirm Password (Centered and styled like in LoginPage)
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password', // New field for confirmation
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  obscureText: true,  // Secure password input
                ),
                const SizedBox(height: 20),

                // "Next" Button (Centered and styled like in LoginPage)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      getSignUpStep1Info();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpStep2(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Next', style: TextStyle(fontSize: 18)),
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
