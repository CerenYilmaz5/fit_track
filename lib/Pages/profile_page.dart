import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignUpStep2.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<List<Widget>> getStats() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        DocumentSnapshot<Map<String, dynamic>> userInfo = await FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get();
        var userData = userInfo.data();

        if (userData != null) {
          List<Map<String, dynamic>> sortedData = [
            {'Username': userData['username']},
            {'Age': userData['age']},
            {'Weight': userData['weight']},
            {'Height': userData['height']},
            {'Neck Circumference': userData['neck_circumference']},
            {'Waist Circumference': userData['waist_circumference']},
            {'Hip Circumference': userData['hip_circumference']},
            {'Goal': userData['goal']},
            {'Available Days': userData['available_days']},
            {'Fitness Level': userData['fitness_level']},
            {'Gender': userData['gender']},
          ];

          return sortedData.map((entry) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Text("${entry.keys.first}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
                    Expanded(flex: 2, child: Text("${entry.values.first}", style: TextStyle(fontSize: 18))),
                  ],
                ),
              ),
            );
          }).toList();
        }
      }
    } catch (e) {
      print("Something went wrong");
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Information",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<List<Widget>>(
        future: getStats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('lib/assets/profile_pic.png'),
                            backgroundColor: Colors.white,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "User Profile",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "",
                            style: TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    ...snapshot.data!,
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpStep2()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
