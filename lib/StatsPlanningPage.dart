
import 'package:fit_track/workout_page.dart';
import 'package:flutter/material.dart';
import 'package:fit_track/daily_diet_page.dart';


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
        title: const Text("Stats Planning"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyStatsTextBox(buttonName: "Vücut Kitle Endeksi:"),
                MyStatsTextBox(buttonName: "Vücut Yağ Oranı:"),
                MyStatsTextBox(buttonName: "Günlük Kalori Miktarı:"),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 300,
              height: 100,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkoutPage(
                        goal: goal,
                        days: days,
                        fitnessLevel:fitnessLevel,

                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                icon: const Icon(Icons.fitness_center, size: 40),
                label: const Text(
                  "Workout Plan",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 300,
              height: 100,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyDietPage(goal: goal),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                icon: const Icon(Icons.fastfood, size: 40),
                label: const Text(
                  "Daily Diet",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatsTextBox extends StatelessWidget {
  const MyStatsTextBox({
    super.key,
    required this.buttonName,
  });

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    List<Widget> words = buttonName.split(" ").map((word) {
      return Text(
        word,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      );
    }).toList();
    return SizedBox(
      height: 200,
      width: 125,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: words,
            ),
          ),
        ),
      ),
    );
  }
}
