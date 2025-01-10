import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignUpStep2.dart';

class profile_page extends StatelessWidget{
  const profile_page({super.key});

  Future<List<Widget>> getStats() async {
    try{
      User? currentUser = FirebaseAuth.instance.currentUser;
      if(currentUser != null){
        DocumentSnapshot<Map<String, dynamic>> userInfo = await FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get();
        return userInfo.data()!.entries.map((entry){
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              height: 35,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Expanded(flex:2, child: Text("${entry.key}",style: TextStyle(fontSize: 20))),
                      Expanded(flex:1,child: Text("${entry.value}",style: TextStyle(fontSize: 20))),
                    ],
                  )
              ),
            ),

          );
        }).toList();
      }else{
        print("No user was signed in");
      }
    }catch(e){
      print("Something went wrong");
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
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
            return Center(
              child: Text("Error: ${snapshot.error}", style: const TextStyle(fontSize: 18)),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                          child: Icon(
                              size: 50,
                              Icons.person,
                              color: Colors.grey.shade700,
                          )
                      ),
                      Text("User Info",style: TextStyle(fontSize: 30),),
                      const SizedBox(height: 20),
                      ...snapshot.data!,
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpStep2()));
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                          child: Text("Edit User Info",style: TextStyle(fontSize: 20,color: Colors.white),)
                      )
                    ],
                  )
                ]
              ),
            );
          } else {
            return const Center(
              child: Text("No data available", style: TextStyle(fontSize: 18)),
            );
          }
        },
      ),
    );
  }
}