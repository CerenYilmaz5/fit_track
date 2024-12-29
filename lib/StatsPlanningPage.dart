import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/EventPage.dart';
import 'package:fit_track/daily_diet_page.dart';
import 'package:fit_track/workout_page.dart';
import 'package:flutter/material.dart';

class StatsPlanning extends StatelessWidget {
  final String goal;
  final int days;
  final String fitnessLevel;


  const StatsPlanning({
    super.key,
    required this.goal,
    required this.days,
    required this.fitnessLevel,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("", style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),

        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
       decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.grey,Colors.black38],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Your Fitness Stats",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyStatsTextBox(
                    buttonName: "Body Mass Index",
                    icon: Icons.monitor_heart,
                    gradientColors: [Colors.teal, Colors.greenAccent],
                    statKey: "bmi",
                  ),
                  MyStatsTextBox(
                    buttonName: "Body Fat Percentage",
                    icon: Icons.water_drop,
                    gradientColors: [Colors.pinkAccent, Colors.redAccent],
                    statKey: "bfp",
                  ),
                  MyStatsTextBox(
                    buttonName: "Daily Calorie Intake",
                    icon: Icons.local_fire_department,
                    gradientColors: [Colors.orange, Colors.deepOrange],
                    statKey: "daily_calories",
                  ),
                ],
              ),

              const Spacer(),
              GradientButton(
                title: "Monthly Events",
                icon: Icons.event_note_outlined,
                gradientColors:
                [Colors.black87, Colors.cyan,Colors.blueAccent,Colors.indigoAccent],
                onTap:() {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>EventsPage(
                      ),

                    ),
                   );
                 },

              ),

              const SizedBox(height: 20),
              GradientButton(
                title: "Workout Plan",
                icon: Icons.fitness_center,
                gradientColors: [Colors.black, Colors.blue],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutPage(
                        goal: goal,
                        days: days,
                        fitnessLevel: fitnessLevel,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              GradientButton(
                title: "Daily Diet",
                icon: Icons.fastfood_outlined,
                gradientColors: [Colors.black87,Colors.red,],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyDietPage(goal: goal,dailyCalories: 0,),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
          ),
        ),
      );
    }
  }

class MyStatsTextBox extends StatelessWidget {
  final String buttonName;
  final IconData icon;
  final List<Color> gradientColors;
  final String statKey;

  const MyStatsTextBox({
    super.key,
    required this.buttonName,
    required this.icon,
    required this.gradientColors,
    required this.statKey,
  });

  Future<String> getStats(String stat) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        return userDoc[stat]?.toString() ?? "N/A"; // Return stat value or "N/A" if missing
      } else {
        print("No user is signed in");
        return "N/A";
      }
    } catch (e) {
      print("Error fetching stat: $e");
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      width: 125,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: const Offset(2, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              FutureBuilder<String>(
                future: getStats(statKey),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(color: Colors.white);
                  } else if (snapshot.hasError) {
                    return const Text(
                      "Error",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  } else {
                    return Text(
                      snapshot.data ?? "N/A",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              Text(
                buttonName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class GradientButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  const GradientButton({
    super.key,
    required this.title,
    required this.icon,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white70, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

