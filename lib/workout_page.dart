import 'package:fit_track/StatsPlanningPage.dart';
import 'package:flutter/material.dart';



class WorkoutPage extends StatelessWidget {

  const WorkoutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding:EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: SizedBox(
                height: 50,
                width: 350,
                child: Card(
                      child:Padding(
                        padding: EdgeInsets.fromLTRB(85, 5, 0, 0),
                        child: Text(
                          "Workout Planning",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                  ),
                ),
              ),
            const DayButton(day: 1),
            const DayButton(day: 2),
            const DayButton(day: 3),
            const DayButton(day: 4),
            const DayButton(day: 5),
            const DayButton(day: 6),
            const DayButton(day: 7),
            const SizedBox(height: 60),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: ElevatedButton.icon(
                  label: const Text("Back"),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StatsPlanning(),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back),
                  ),
                ),
              ]
            ),

          ],
        ),
      ),
    );
  }
}

class DayButton extends StatelessWidget {

  const DayButton({
    super.key,
    required this.day,
  });

  final int day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 75,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(35, 20, 20, 0),
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DayPlanningPage(day: day),
            ),
          ),
          child: Text(
            "Day $day",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class DayPlanningPage extends StatelessWidget {

  const DayPlanningPage({
    super.key,
    required this.day,
  });

  final int day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton.icon(
                  label: const Text("Back"),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WorkoutPage(),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text("DAY $day Workout planning"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}