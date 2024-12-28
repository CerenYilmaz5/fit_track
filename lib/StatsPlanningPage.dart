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
                    buttonName: "Body Count Index",
                    icon: Icons.monitor_heart,
                    gradientColors: [Colors.teal, Colors.greenAccent],
                  ),
                  MyStatsTextBox(
                    buttonName: "Body Fat Rate",
                    icon: Icons.water_drop,
                    gradientColors: [Colors.pinkAccent, Colors.redAccent],
                  ),
                  MyStatsTextBox(
                    buttonName: "Daily Calorie Intake",
                    icon: Icons.local_fire_department,
                    gradientColors: [Colors.orange, Colors.deepOrange],
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
                      builder: (context) => DailyDietPage(goal: goal),
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

  const MyStatsTextBox({
    super.key,
    required this.buttonName,
    required this.icon,
    required this.gradientColors,
  });

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

