class DefinitionProgram {

  final int sparedDays;

  final String fitnessLevel;

  DefinitionProgram({
    required this.sparedDays,
    required this.fitnessLevel,
  }
   );

  List<List<Map<String, String>>> getProgram() {
    if (fitnessLevel == "Beginner") {
      return _beginnerProgram(sparedDays);
    }
    else if (fitnessLevel == "Intermediate") {
      return _intermediateProgram(sparedDays);
    }
    else {
      return _expertProgram(sparedDays);
    }
  }

  // Beginner Programımız(we are gonna edit!)
  List<List<Map<String, String>>> _beginnerProgram(int days)
  {
    if (days == 2)
    {
      return [
        [
          {"name": "Push-ups Warm Up(2 x 10)", "details": "Do 2 sets of 10 push-ups to warm up chest and triceps."
              " You should consider your arms 45 degree from your body ","gif":"build/app/intermediates/assets/push-up (best).gif"},
          {"name": "Bodyweight Squats (3 x 15)", "details": "Perform 3 sets of 15 squats to strengthen your legs.","gif":"build/app/intermediates/assets/body_weight_squat.gif"},
          {"name": "Plank (3 x 30 sec)", "details": "Hold a plank for 30 seconds, 3 times to strengthen your core."},
        ],
        [
          {"name": "Burpees (3 x 10)", "details": "Do 3 sets of 10 burpees for full-body conditioning."},
          {"name": "Lunges (3 x 12 per leg)", "details": "Perform 3 sets of 12 lunges per leg to build leg strength."},
          {"name": "Mountain Climbers (3 x 20)", "details": "Do 3 sets of 20 mountain climbers to improve endurance."},
        ],
      ];
    }
    else if (days == 3)
    {
      return [
        [
          {"name": "Push-ups (3 x 12)", "details": "3 sets of 12 push-ups to build upper body strength."},
          {"name": "Plank (3 x 45 sec)", "details": "Hold for 45 seconds to strengthen your core."},
        ],
        [
          {"name": "Squats (3 x 15)", "details": "Perform 15 squats to strengthen your legs."},
          {"name": "Lunges (3 x 12 per leg)", "details": "Alternate lunges for leg fitness."},
        ],
        [
          {"name": "Burpees (3 x 10)", "details": "3 sets of 10 burpees for full-body conditioning."},
          {"name": "Mountain Climbers (3 x 20)", "details": "Improve endurance with 3 sets of 20 mountain climbers."},
        ],
      ];
    }
    else if (days == 4)
    {
      return [
        [
          {"name": "Push-ups (3 x 12)", "details": "Build upper body strength with 3 sets of 12 push-ups."},
          {"name": "Dumbbell Chest Press (3 x 10)", "details": "Perform 3 sets of 10 chest presses."},
        ],
        [
          {"name": "Pull-ups (3 x 8)", "details": "Strengthen your back with 3 sets of 8 pull-ups."},
          {"name": "Dumbbell Rows (3 x 12)", "details": "3 sets of 12 rows for back muscles."},
        ],
        [
          {"name": "Shoulder Press (3 x 10)", "details": "Develop your shoulders with 3 sets of 10 presses."},
          {"name": "Lateral Raises (3 x 12)", "details": "3 sets of 12 raises for shoulder definition."},
        ],
        [
          {"name": "Squats (3 x 15)", "details": "Strengthen legs with 3 sets of 15 squats."},
          {"name": "Lunges (3 x 12 per leg)", "details": "Alternate lunges for leg fitness."},
        ],
      ];
    }
    else
    {
      return [
        [
          {"name": "Chest Workout: Bench Press (4 x 10)", "details": "Build chest strength with 4 sets of 10 bench presses."},
          {"name": "Incline Push-ups (4 x 12)", "details": "Strengthen upper chest with 4 sets of 12 incline push-ups."},
        ],
        [
          {"name": "Back Workout: Pull-ups (4 x 8)", "details": "Develop back muscles with 4 sets of 8 pull-ups."},
          {"name": "Seated Cable Rows (4 x 12)", "details": "Strengthen back with 4 sets of 12 rows."},
        ],
        [
          {"name": "Shoulder Workout: Shoulder Press (4 x 10)", "details": "4 sets of 10 shoulder presses for strength."},
          {"name": "Front Raises (4 x 12)", "details": "Define shoulders with 4 sets of 12 front raises."},
        ],
        [
          {"name": "Leg Workout: Squats (4 x 12)", "details": "Develop leg muscles with 4 sets of 12 squats."},
          {"name": "Deadlifts (4 x 10)", "details": "Strengthen lower body with deadlifts."},
        ],
        [
          {"name": "Arm Workout: Bicep Curls (4 x 12)", "details": "Tone arms with 4 sets of 12 bicep curls."},
          {"name": "Tricep Dips (4 x 12)", "details": "Strengthen triceps with dips."},
        ],
      ];
    }
  }
  //intermediate (we are gonna edit!)
  List<List<Map<String, String>>> _intermediateProgram(int days) {
    if (days == 2)
    {
      return [
        [
          {"name": "Push-ups (3 x 10)", "details": "Do 3 sets of 10 push-ups to build upper body strength."},
          {"name": "Bodyweight Squats (3 x 15)", "details": "Perform 3 sets of 15 squats to strengthen your legs."},
          {"name": "Plank (3 x 30 sec)", "details": "Hold a plank for 30 seconds, 3 times to strengthen your core."},
        ],
        [
          {"name": "Burpees (3 x 10)", "details": "Do 3 sets of 10 burpees for full-body conditioning."},
          {"name": "Lunges (3 x 12 per leg)", "details": "Perform 3 sets of 12 lunges per leg to build leg strength."},
          {"name": "Mountain Climbers (3 x 20)", "details": "Do 3 sets of 20 mountain climbers to improve endurance."},
        ],
      ];
    }
    else if (days == 3)
    {
      return [
        [
          {"name": "Push-ups (3 x 12)", "details": "3 sets of 12 push-ups to build upper body strength."},
          {"name": "Plank (3 x 45 sec)", "details": "Hold for 45 seconds to strengthen your core."},
        ],
        [
          {"name": "Squats (3 x 15)", "details": "Perform 15 squats to strengthen your legs."},
          {"name": "Lunges (3 x 12 per leg)", "details": "Alternate lunges for leg fitness."},
        ],
        [
          {"name": "Burpees (3 x 10)", "details": "3 sets of 10 burpees for full-body conditioning."},
          {"name": "Mountain Climbers (3 x 20)", "details": "Improve endurance with 3 sets of 20 mountain climbers."},
        ],
      ];
    }
    else if (days == 4)
    {
      return [
        [
          {"name": "Push-ups (3 x 12)", "details": "Build upper body strength with 3 sets of 12 push-ups."},
          {"name": "Dumbbell Chest Press (3 x 10)", "details": "Perform 3 sets of 10 chest presses."},
        ],
        [
          {"name": "Pull-ups (3 x 8)", "details": "Strengthen your back with 3 sets of 8 pull-ups."},
          {"name": "Dumbbell Rows (3 x 12)", "details": "3 sets of 12 rows for back muscles."},
        ],
        [
          {"name": "Shoulder Press (3 x 10)", "details": "Develop your shoulders with 3 sets of 10 presses."},
          {"name": "Lateral Raises (3 x 12)", "details": "3 sets of 12 raises for shoulder definition."},
        ],
        [
          {"name": "Squats (3 x 15)", "details": "Strengthen legs with 3 sets of 15 squats."},
          {"name": "Lunges (3 x 12 per leg)", "details": "Alternate lunges for leg fitness."},
        ],
      ];
    }
    else
    {
      return [
        [
          {"name": "Chest Workout: Bench Press (4 x 10)", "details": "Build chest strength with 4 sets of 10 bench presses."},
          {"name": "Incline Push-ups (4 x 12)", "details": "Strengthen upper chest with 4 sets of 12 incline push-ups."},
        ],
        [
          {"name": "Back Workout: Pull-ups (4 x 8)", "details": "Develop back muscles with 4 sets of 8 pull-ups."},
          {"name": "Seated Cable Rows (4 x 12)", "details": "Strengthen back with 4 sets of 12 rows."},
        ],
        [
          {"name": "Shoulder Workout: Shoulder Press (4 x 10)", "details": "4 sets of 10 shoulder presses for strength."},
          {"name": "Front Raises (4 x 12)", "details": "Define shoulders with 4 sets of 12 front raises."},
        ],
        [
          {"name": "Leg Workout: Squats (4 x 12)", "details": "Develop leg muscles with 4 sets of 12 squats."},
          {"name": "Deadlifts (4 x 10)", "details": "Strengthen lower body with deadlifts."},
        ],
        [
          {"name": "Arm Workout: Bicep Curls (4 x 12)", "details": "Tone arms with 4 sets of 12 bicep curls."},
          {"name": "Tricep Dips (4 x 12)", "details": "Strengthen triceps with dips."},
        ],
      ];
    }
  }
  //expert (we are gonna edit!)
  List<List<Map<String, String>>> _expertProgram(int days) {
    if (days == 2)
    {
      return [
        [
          {"name": "Push-ups (3 x 10)", "details": "Do 3 sets of 10 push-ups to build upper body strength."},
          {"name": "Bodyweight Squats (3 x 15)", "details": "Perform 3 sets of 15 squats to strengthen your legs."},
          {"name": "Plank (3 x 30 sec)", "details": "Hold a plank for 30 seconds, 3 times to strengthen your core."},
        ],
        [
          {"name": "Burpees (3 x 10)", "details": "Do 3 sets of 10 burpees for full-body conditioning."},
          {"name": "Lunges (3 x 12 per leg)", "details": "Perform 3 sets of 12 lunges per leg to build leg strength."},
          {"name": "Mountain Climbers (3 x 20)", "details": "Do 3 sets of 20 mountain climbers to improve endurance."},
        ],
      ];
    }
    else if (days == 3)
    {
      return [
        [
          {"name": "Push-ups (3 x 12)", "details": "3 sets of 12 push-ups to build upper body strength."},
          {"name": "Plank (3 x 45 sec)", "details": "Hold for 45 seconds to strengthen your core."},
        ],
        [
          {"name": "Squats (3 x 15)", "details": "Perform 15 squats to strengthen your legs."},
          {"name": "Lunges (3 x 12 per leg)", "details": "Alternate lunges for leg fitness."},
        ],
        [
          {"name": "Burpees (3 x 10)", "details": "3 sets of 10 burpees for full-body conditioning."},
          {"name": "Mountain Climbers (3 x 20)", "details": "Improve endurance with 3 sets of 20 mountain climbers."},
        ],
      ];
    }
    else if (days == 4)
    {
      return [
        [
          {"name": "Push-ups (3 x 12)", "details": "Build upper body strength with 3 sets of 12 push-ups."},
          {"name": "Dumbbell Chest Press (3 x 10)", "details": "Perform 3 sets of 10 chest presses."},
        ],
        [
          {"name": "Pull-ups (3 x 8)", "details": "Strengthen your back with 3 sets of 8 pull-ups."},
          {"name": "Dumbbell Rows (3 x 12)", "details": "3 sets of 12 rows for back muscles."},
        ],
        [
          {"name": "Shoulder Press (3 x 10)", "details": "Develop your shoulders with 3 sets of 10 presses."},
          {"name": "Lateral Raises (3 x 12)", "details": "3 sets of 12 raises for shoulder definition."},
        ],
        [
          {"name": "Squats (3 x 15)", "details": "Strengthen legs with 3 sets of 15 squats."},
          {"name": "Lunges (3 x 12 per leg)", "details": "Alternate lunges for leg fitness."},
        ],
      ];
    }
    else
    {
      return [
        [
          {"name": "Chest Workout: Bench Press (4 x 10)", "details": "Build chest strength with 4 sets of 10 bench presses."},
          {"name": "Incline Push-ups (4 x 12)", "details": "Strengthen upper chest with 4 sets of 12 incline push-ups."},
        ],
        [
          {"name": "Back Workout: Pull-ups (4 x 8)", "details": "Develop back muscles with 4 sets of 8 pull-ups."},
          {"name": "Seated Cable Rows (4 x 12)", "details": "Strengthen back with 4 sets of 12 rows."},
        ],
        [
          {"name": "Shoulder Workout: Shoulder Press (4 x 10)", "details": "4 sets of 10 shoulder presses for strength."},
          {"name": "Front Raises (4 x 12)", "details": "Define shoulders with 4 sets of 12 front raises."},
        ],
        [
          {"name": "Leg Workout: Squats (4 x 12)", "details": "Develop leg muscles with 4 sets of 12 squats."},
          {"name": "Deadlifts (4 x 10)", "details": "Strengthen lower body with deadlifts."},
        ],
        [
          {"name": "Arm Workout: Bicep Curls (4 x 12)", "details": "Tone arms with 4 sets of 12 bicep curls."},
          {"name": "Tricep Dips (4 x 12)", "details": "Strengthen triceps with dips."},
        ],
      ];
    }
  }


}
