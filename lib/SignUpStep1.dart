import 'package:flutter/material.dart';

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