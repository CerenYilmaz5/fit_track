import 'package:fit_track/daily_diet_page.dart';
import 'package:fit_track/workout_page.dart';
import 'package:flutter/material.dart';

class StatsPlanning extends StatefulWidget {
  const StatsPlanning({super.key});

  @override
  State<StatsPlanning> createState() => _StatsPlanningState();
}

class _StatsPlanningState extends State<StatsPlanning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 15),
            const Row(
              children: [
                SizedBox(width: 5,),
                MyStatsTextBox(buttonName: "Vücut Kitle Endeksi:"),
                SizedBox(width: 10,),
                MyStatsTextBox(buttonName: "Vücut Yağ Oranı:"),
                SizedBox(width: 10,),
                MyStatsTextBox(buttonName: "Günlük Kalori Miktarı:"),
                SizedBox(width: 5,),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 300,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WorkoutPage(),
                    ),
                  ),
                  label: const Text(
                    "Workout Plan",
                    style: TextStyle(fontSize: 30),
                  ),
                  icon: const Icon(Icons.fitness_center),
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 300,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DailyDietPage(),
                    ),
                  ),
                  label: const Text(
                    "Daily Diet",
                    style: TextStyle(fontSize: 30),
                  ),
                  icon: const Icon(Icons.fastfood),
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
        style: TextStyle(
          fontSize: 25,
          fontStyle: FontStyle.italic,
          color: Theme.of(context).colorScheme.surface,
        ),
      );
    }).toList();
    return SizedBox(
      height: 250,
      width: 125,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: words,
          ),
        ),
      ),
    );
  }
}






