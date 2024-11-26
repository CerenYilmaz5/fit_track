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
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 15),
            const Row(
              children: [
                const SizedBox(width: 5,),
                MyStatsTextBox(buttonName: "Vücut Kitle Endeksi:"),
                const SizedBox(width: 10,),
                MyStatsTextBox(buttonName: "Vücut Yağ Oranı:"),
                const SizedBox(width: 10,),
                MyStatsTextBox(buttonName: "Günlük Kalori Miktarı:"),
                const SizedBox(width: 5,),
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
                      builder: (context) => const PlaningPage(subject: "Workout"),
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
                      builder: (context) => const PlaningPage(subject: "Diet"),
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

class PlaningPage extends StatelessWidget {
  final String subject;

  const PlaningPage({
    required this.subject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
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
                SizedBox(
                  height: 50,
                  width: 280,
                  child: Card(
                    child: Text(
                      "$subject Plan",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            DayButton(day: 1, subject: subject),
            DayButton(day: 2, subject: subject),
            DayButton(day: 3, subject: subject),
            DayButton(day: 4, subject: subject),
            DayButton(day: 5, subject: subject),
            DayButton(day: 6, subject: subject),
            DayButton(day: 7, subject: subject),
          ],
        ),
      ),
    );
  }
}

class DayButton extends StatelessWidget {
  final String subject;

  const DayButton({
    super.key,
    required this.day,
    required this.subject,
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
              builder: (context) => DayPage(day: day, subject: subject),
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

class DayPage extends StatelessWidget {
  final String subject;

  const DayPage({
    super.key,
    required this.day,
    required this.subject,
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
                      builder: (context) => PlaningPage(subject: subject),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text("DAY $day $subject planning"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
