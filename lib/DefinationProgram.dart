import 'package:flutter/material.dart';

void main() {
  runApp(WorkoutApp());
}

class WorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Program',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: const Text('Workout Program'),
        backgroundColor: Colors.blue,

      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(

              onPressed: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (context) => const WorkoutDayPage(day: 'Day-1', exercises: [

                      {'name': 'Push-Ups 3x15', 'details' :  'Do as much as you can'},
                      {'name': 'Bench-Press 4x15-12-10-8',  'details': 'You do not need to go failure. You just need to close 1-2 reps left','gif': 'build/app/intermediates/assets/male-barbell-bench-press-front.gif'},
                      {'name': 'Barbell Row  4x10-8-8-8', 'details': 'You do not need to go failure. You just need to close 1-2 reps left.Protect your waist. You can wear a belt.'},
                      {'name': 'Squats 4x15-12-10-8', 'details': 'You do not need to go failure. You just need to close 1-2 reps left'},
                      {'name': 'Shoulder Bar Press 4x15-12-10-8', 'details': 'You do not need to go failure. You just need to close 1-2 reps left'},
                      {'name': 'Cable Crunch 4x15', 'details': 'Don not move your hip. Only your waist moves. When you pull your elbow to the knees, hold for 60 seconds.'},
                    ]),

                  ),

                );
              },
              style: ElevatedButton.styleFrom(

                backgroundColor: Colors.blue,

                minimumSize: const Size(100, 100),
              ),

              child: const Text(

                'Day-1',

                style: TextStyle(color: Colors.white),
              ),


            ),
            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkoutDayPage(day: 'Day 2', exercises: [
                      {'name': 'Pull-Ups', 'details': 'Do 3 sets of 10 reps.', 'How to do the exercise':'lib/asset/gifs/male-barbell-bench-press-front.gif'},
                      {'name': 'Lunges', 'details': 'Do 3 sets of 15 reps each leg.'},
                      {'name': 'Sit-Ups', 'details': 'Do 3 sets of 25 reps.'},
                    ]),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(100, 100),
              ),
              child: const Text('Day-2', style:TextStyle(color: Colors.white)),

            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutDayPage extends StatelessWidget {
  final String day;
  final List<Map<String, String>> exercises;

  const WorkoutDayPage({super.key, required this.day, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(day),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(exercises[index]['name']!),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailPage(
                      exerciseName: exercises[index]['name']!,
                      exerciseDetails: exercises[index]['details']!,
                      exerciseGif: exercises[index]['gif'],
                      textStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
              child: const Text('Check out Details'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(150, 30),

              ),
            ),
          );
        },
      ),
    );
  }
}

class ExerciseDetailPage extends StatelessWidget {
  final String exerciseName;
  final String exerciseDetails;
  final String? exerciseGif;

  const ExerciseDetailPage({
    super.key,
    required this.exerciseName,
    required this.exerciseDetails,
    this.exerciseGif,
    required TextStyle textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exerciseName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
              const SizedBox(height: 16),
              Text(
                exerciseDetails,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
