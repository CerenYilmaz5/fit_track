import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile_page extends StatelessWidget {
  const profile_page({super.key});

  Future<List<Widget>> getStats() async {
    try {
      User? currentUser  = FirebaseAuth.instance.currentUser ;
      if (currentUser  != null) {
        DocumentSnapshot<Map<String, dynamic>> userInfo = await FirebaseFirestore.instance.collection("users").doc(currentUser .uid).get();
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
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${entry.keys.first}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      Text("${entry.values.first}", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            );
          }).toList();
        }
      } else {
        print("No user was signed in");
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
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('lib/assets/profile_pic.png'),
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "User  Profile",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Column(
                    children: snapshot.data!,
                  ),
                ],
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