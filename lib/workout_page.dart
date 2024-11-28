import 'package:fit_track/StatsPlanningPage.dart';
import 'package:fit_track/BulkProgram.dart';
import 'package:flutter/material.dart';



class WorkoutPage extends StatelessWidget {

  const WorkoutPage({
    super.key,
    required this.sparedDays,
  });

  final int sparedDays;

  List<DayButton> dayButtonsBuilder(int sparedDays){
    List<DayButton> dayButtons = [];
    for(int i = 0; i<sparedDays; i++){
      dayButtons.add(DayButton(day: i+1, sparedDays: sparedDays,));
    }
    return dayButtons;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
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
            ...dayButtonsBuilder(sparedDays),
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
    required this.sparedDays,

  });

  final int day;
  final int sparedDays;

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
              builder: (context) => DayPlanningPage(day: day,sparedDays: sparedDays, program: Bulkprogram(sparedDays: sparedDays).getProgram()),
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
    required this.sparedDays,
    required this.program,
  });

  final int day;
  final int sparedDays;
  final List<List<String>> program;

  List<Widget> listDailyProgram(int day){
    return program[day-1].map((String s) => Text(s)).toList();
  }

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
                      builder: (context) => WorkoutPage(sparedDays: sparedDays),
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
            ...listDailyProgram(day),
          ],
        ),
      ),
    );
  }
}