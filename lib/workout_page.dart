import 'package:flutter/material.dart';
import 'package:fit_track/BulkProgram.dart';
import 'package:fit_track/WeightLoss.dart';

class WorkoutPage extends StatelessWidget {
  final String goal;
  final int days;
  final String fitnessLevel; // Added fitnessLevel

  const WorkoutPage({
    super.key,
    required this.goal,
    required this.days,
    required this.fitnessLevel,
  });

  @override
  Widget build(BuildContext context) {
    // Choose the workout program based on the goal and fitness level
    dynamic program; // Program can be of any type
    if (goal == "Lose Weight") {
      program = WeightLossProgram(
        sparedDays: days,
        fitnessLevel: fitnessLevel, // Fitness level is passed dynamically
      );
    }
    else if (goal == "Gain Muscle") {
      program = Bulkprogram(
        sparedDays: days,
        fitnessLevel: fitnessLevel, // Fitness level is passed dynamically
      );
    }
    /*
    else if (goal == "Definition") {
      program = DefinitionProgram(
        sparedDays: days,
        fitnessLevel: fitnessLevel, // Fitness level is passed dynamically
      );
    }*/

    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Planning"),
        backgroundColor: Colors.blue[700],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Goal: $goal",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: days,
                itemBuilder: (context, index) {
                  return DayButton(
                    day: index + 1,
                    program: program,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    label: const Text("Back"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DayButton extends StatelessWidget {
  final int day;
  final dynamic program; // This will be WeightLossProgram, BulkProgram, etc.

  const DayButton({
    super.key,
    required this.day,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    // Get the exercises for the specific day from the program
    List<String> exercises = program.getProgram()[day - 1];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WorkoutDayPage(day: day, exercises: exercises),
          ),
        ),
        child: Text(
          "Day $day",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class WorkoutDayPage extends StatelessWidget {
  final int day;
  final List<String> exercises;

  const WorkoutDayPage({
    super.key,
    required this.day,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day $day Workout Plan"),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.fitness_center, color: Colors.blueAccent),
            title: Text(
              exercises[index],
              style: TextStyle(fontSize: 16, color: Colors.blue[900]),
            ),
          );
        },
      ),
    );
  }
}
