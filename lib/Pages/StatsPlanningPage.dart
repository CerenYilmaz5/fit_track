import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/Pages/EventPage.dart';
import 'package:fit_track/Pages/daily_diet_page.dart';
import 'package:fit_track/Pages/workout_page.dart';
import 'package:flutter/material.dart';

class StatsPlanning extends StatefulWidget {



  const StatsPlanning({
    super.key,
  });

  @override
  State<StatsPlanning> createState() => _StatsPlanningState();
}

class _StatsPlanningState extends State<StatsPlanning> {

  int bmi = 0;
  int bfp = 0;
  int dailyCalories = 0;

  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();

    if (userDoc.exists) {
      setState(() {
        bmi = userDoc['bmi'];
        bfp = userDoc['bfp'];
        dailyCalories = userDoc['daily_calories'];
      });
    }
  }

  @override
  void initState(){
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Your Fitness Stats", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white,)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: bottom_nav_bar(current_index: 1,),
      body: Container(
       decoration: const BoxDecoration(
          color: Colors.black54
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyStatsTextBox(
                buttonName: "Body Mass Index",
                icon: Icons.monitor_heart,
                gradientColors: const [Colors.teal, Colors.greenAccent],
                value: bmi.toString(),
              ),
              const SizedBox(height: 1),
              MyStatsTextBox(
                buttonName: "Body Fat Percentage",
                icon: Icons.water_drop,
                gradientColors: const [Colors.pinkAccent, Colors.redAccent],
                value: bfp.toString(),
              ),
              const SizedBox(height: 1),
              MyStatsTextBox(
                buttonName: "Daily Calorie Intake",
                icon: Icons.local_fire_department,
                gradientColors: const [Colors.orange, Colors.deepOrange],
                value: dailyCalories.toString(),
              ),

              const SizedBox(height: 80),
              GradientButton(
                title: "Monthly Events",
                icon: Icons.event_note_outlined,
                gradientColors:
                [Colors.black87, Colors.cyan,Colors.blueAccent,Colors.indigoAccent],
                onTap:() {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>EventsPage(),
                    ),
                   );
                 },

              ),
              const SizedBox(height: 10),
              GradientButton(
                title: "Workout Plan",
                icon: Icons.fitness_center,
                gradientColors: [Colors.black, Colors.blue],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              GradientButton(
                title: "Daily Diet",
                icon: Icons.fastfood_outlined,
                gradientColors: [Colors.black87, Colors.red],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyDietPage(),
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
  final String value;

  const MyStatsTextBox({
    super.key,
    required this.buttonName,
    required this.icon,
    required this.gradientColors,
    required this.value,
  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                buttonName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
        width: 250,
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

class bottom_nav_bar extends StatelessWidget{
  final int current_index;
  const bottom_nav_bar({super.key,required this.current_index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: current_index,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.query_stats_sharp),label: "Stats",backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood),label: "Daily Diet",backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center_sharp),label: "Workout Planning",backgroundColor: Colors.red),
        ],
        onTap: (index){
          switch (index){
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => StatsPlanning()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => DailyDietPage()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutPage()));
              break;
          }
        },
    );
  }
}