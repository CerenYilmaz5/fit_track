import 'package:fit_track/DefinationProgram.dart';
import 'package:flutter/material.dart';
import 'package:fit_track/BulkProgram.dart';
import 'package:fit_track/WeightLoss.dart';

class WorkoutPage extends StatelessWidget {
  final String goal;
  final int days;
  final String fitnessLevel;


  const WorkoutPage({
    super.key,
    required this.goal,
    required this.days,
    required this.fitnessLevel,
  });
  // Definiton is open now. But whole programme should editted. Lose weight and BLuking as well.
  @override
  Widget build(BuildContext context) {
    dynamic program;
    if (goal == "Lose Weight")
    {
      program = WeightLossProgram(sparedDays: days, fitnessLevel: fitnessLevel);
    }
    else if (goal == "Gain Muscle")
    {
      program = BulkProgram(sparedDays: days, fitnessLevel: fitnessLevel);
    }
    else if (goal == "Definition")
    {
      program = DefinitionProgram(sparedDays: days, fitnessLevel: fitnessLevel);
    }

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
              //Button adding
              child: ElevatedButton.icon(
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
            ),
            ],
         ),
      ),

    );
   }
}

class DayButton extends StatelessWidget {
  final int day;
  final dynamic program;

  const DayButton({
    super.key,
    required this.day,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {

    //definasyon wokroutu maple burdan aldım
    List<Map<String, String>> exercises = program.getProgram()[day - 1];

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
  final List<Map<String, String>> exercises;

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
              exercises[index]['name']!,

              style: TextStyle(fontSize: 16, color: Colors.blue[900]),
            ),


            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,

              ),

              onPressed: () {
                Navigator.of(context).push(

                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailsPage(

                      exerciseName: exercises[index]['name']!,
                      exerciseDetails: exercises[index]['details']!,
                      exerciseGif: exercises[index]['gif'],

                    ),
                  ),
                 );
              },
              child: const Text("Details"),
            ),
          );
        },
      ),

    );
    }
}

class ExerciseDetailsPage extends StatelessWidget {
  final String exerciseName;
  final String exerciseDetails;
  final String? exerciseGif;

  const ExerciseDetailsPage({
    super.key,
    required this.exerciseName,
    required this.exerciseDetails,
    this.exerciseGif,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("$exerciseName Details"),

        backgroundColor: Colors.blue[700],
      ),

      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            if (exerciseGif != null)
              Center(
                child: Image.asset(
                  exerciseGif!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),

            Text(
          exerciseDetails,
          style: TextStyle(fontSize: 18, color: Colors.blue[900]),
        ),
        ],
        ),
        ),
    );

  }
}


