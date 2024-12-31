class BulkProgram {
  final int sparedDays;
  final String fitnessLevel;

  BulkProgram({
    required this.sparedDays,
    required this.fitnessLevel,
  });

  List<List<Map<String, String>>> getProgram() {
    if (fitnessLevel == "Beginner") {
      return _beginnerProgram(sparedDays);
    } else if (fitnessLevel == "Intermediate") {
      return _intermediateProgram(sparedDays);
    } else {
      return _expertProgram(sparedDays);
    }
  }

  List<List<Map<String, String>>> _beginnerProgram(int days) {
    if (days == 2) {
      return [
        [
          {"name": "Bench Press (3 x 10)", "details": "Perform 3 sets of 10 bench presses to build chest strength.", "gif": ""},
          {"name": "Lat Pulldown (3 x 12)", "details": "Use a lat pulldown machine for 3 sets of 12 to target back muscles.", "gif": ""},
          {"name": "Leg Press (3 x 12)", "details": "Strengthen legs with 3 sets of 12 on the leg press machine.", "gif": ""},
        ],
        [
          {"name": "Incline Dumbbell Press (3 x 10)", "details": "Build upper chest with 3 sets of 10 incline presses.", "gif": ""},
          {"name": "Seated Row (3 x 12)", "details": "Perform 3 sets of 12 seated rows for back strength.", "gif": ""},
          {"name": "Weighted Squats (3 x 12)", "details": "Perform 3 sets of 12 weighted squats for leg development.", "gif": ""},
        ],
      ];
    } else if (days == 3) {
      return [
        [
          {"name": "Flat Bench Press (4 x 8)", "details": "Build chest strength with 4 sets of 8 reps.", "gif": ""},
          {"name": "Pull-ups (3 x 10)", "details": "Perform pull-ups for upper back development.", "gif": ""},
        ],
        [
          {"name": "Overhead Press (3 x 12)", "details": "Strengthen shoulders with 3 sets of 12.", "gif": ""},
          {"name": "Deadlift (4 x 8)", "details": "Engage the entire posterior chain with 4 sets of deadlifts.", "gif": ""},
        ],
        [
          {"name": "Dumbbell Flyes (3 x 12)", "details": "Isolate the chest muscles with 3 sets of dumbbell flyes.", "gif": ""},
          {"name": "Leg Curls (3 x 15)", "details": "Focus on hamstrings with 3 sets of leg curls.", "gif": ""},
        ],
      ];
    } else if (days == 4) {
      return [
        [
          {"name": "Incline Bench Press (3 x 10)", "details": "Target upper chest with 3 sets of incline presses.", "gif": ""},
          {"name": "Lat Pulldown (3 x 12)", "details": "Perform 3 sets of lat pulldowns for back strength.", "gif": ""},
        ],
        [
          {"name": "Seated Dumbbell Shoulder Press (3 x 12)", "details": "Build shoulder muscles with 3 sets of presses.", "gif": ""},
          {"name": "Barbell Squats (4 x 8)", "details": "Develop leg power with 4 sets of barbell squats.", "gif": ""},
        ],
        [
          {"name": "Chest Dips (3 x 10)", "details": "Focus on lower chest with 3 sets of dips.", "gif": ""},
          {"name": "Bent-over Rows (4 x 10)", "details": "Strengthen the back with 4 sets of bent-over rows.", "gif": ""},
        ],
        [
          {"name": "Leg Press (3 x 12)", "details": "Perform leg presses to target quadriceps.", "gif": ""},
          {"name": "Romanian Deadlifts (3 x 12)", "details": "Focus on hamstrings with Romanian deadlifts.", "gif": ""},
        ],
      ];
    }else {
      return [];
    }
  }

  List<List<Map<String, String>>> _intermediateProgram(int days) {
    if (days == 2) {
      return [
        [
          {"name": "Barbell Bench Press (4 x 8)", "details": "Increase chest strength with 4 sets of bench presses.", "gif": ""},
          {"name": "Pull-ups (4 x 8)", "details": "Perform pull-ups for upper back development.", "gif": ""},
          {"name": "Barbell Squats (4 x 10)", "details": "Strengthen legs with 4 sets of barbell squats.", "gif": ""},
        ],
        [
          {"name": "Incline Dumbbell Press (3 x 10)", "details": "Focus on upper chest with 3 sets of incline presses.", "gif": ""},
          {"name": "Seated Cable Row (3 x 12)", "details": "Develop back muscles with 3 sets of rows.", "gif": ""},
          {"name": "Leg Extension (3 x 15)", "details": "Target quadriceps with 3 sets of leg extensions.", "gif": ""},
        ],
      ];
    } else if (days == 3) {
      return [
        [
          {"name": "Flat Dumbbell Bench Press (4 x 8)", "details": "Perform flat presses for chest strength.", "gif": ""},
          {"name": "Bent-over Rows (3 x 10)", "details": "Build back muscles with bent-over rows.", "gif": ""},
        ],
        [
          {"name": "Military Press (3 x 10)", "details": "Focus on shoulder strength with military presses.", "gif": ""},
          {"name": "Deadlift (4 x 8)", "details": "Engage full body with deadlifts.", "gif": ""},
        ],
        [
          {"name": "Incline Flyes (3 x 12)", "details": "Isolate the chest with incline flyes.", "gif": ""},
          {"name": "Leg Curls (3 x 15)", "details": "Strengthen hamstrings with leg curls.", "gif": ""},
        ],
      ];
    } else if (days == 4) {
      return [
        [
          {"name": "Incline Bench Press (4 x 10)", "details": "Develop upper chest strength.", "gif": ""},
          {"name": "Pull-ups (3 x 10)", "details": "Strengthen upper back with pull-ups.", "gif": ""},
        ],
        [
          {"name": "Overhead Dumbbell Press (3 x 12)", "details": "Focus on shoulder muscles.", "gif": ""},
          {"name": "Weighted Squats (4 x 10)", "details": "Enhance leg power with squats.", "gif": ""},
        ],
        [
          {"name": "Chest Dips (3 x 10)", "details": "Work on chest definition.", "gif": ""},
          {"name": "T-bar Rows (3 x 12)", "details": "Build back muscles with T-bar rows.", "gif": ""},
        ],
        [
          {"name": "Leg Press (3 x 12)", "details": "Strengthen legs using the leg press machine.", "gif": ""},
          {"name": "Stiff-leg Deadlifts (3 x 12)", "details": "Focus on hamstrings.", "gif": ""},
        ],
      ];
    }else {
      return [];
    }
  }

  List<List<Map<String, String>>> _expertProgram(int days) {
    if (days == 2) {
      return [
        [
          {"name": "Flat Bench Press (4 x 8)", "details": "Build chest strength with 4 sets of 8 bench presses.", "gif": ""},
          {"name": "Barbell Deadlift (4 x 6)", "details": "Improve lower back and hamstring strength with 4 sets of 6 deadlifts.", "gif": ""},
          {"name": "Overhead Press (4 x 8)", "details": "Develop shoulder and triceps with 4 sets of 8 presses.", "gif": ""},
        ],
        [
          {"name": "Pull-ups (4 x 8)", "details": "Focus on back and biceps with 4 sets of 8 pull-ups.", "gif": ""},
          {"name": "Weighted Squats (4 x 8)", "details": "Build leg strength with 4 sets of 8 weighted squats.", "gif": ""},
          {"name": "Barbell Curls (4 x 10)", "details": "Develop biceps with 4 sets of 10 barbell curls.", "gif": ""},
        ],
      ];
    } else if (days == 3) {
      return [
        [
          {"name": "Incline Bench Press (4 x 10)", "details": "Target upper chest with 4 sets of 10 presses.", "gif": ""},
          {"name": "Barbell Rows (4 x 10)", "details": "Strengthen upper back with 4 sets of 10 rows.", "gif": ""},
          {"name": "Lateral Raises (4 x 12)", "details": "Isolate shoulder muscles with 4 sets of 12 raises.", "gif": ""},
        ],
        [
          {"name": "Front Squats (4 x 8)", "details": "Focus on quads with 4 sets of 8 front squats.", "gif": ""},
          {"name": "Romanian Deadlift (4 x 8)", "details": "Target hamstrings with 4 sets of 8 Romanian deadlifts.", "gif": ""},
          {"name": "Hanging Leg Raises (4 x 12)", "details": "Strengthen core with 4 sets of 12 leg raises.", "gif": ""},
        ],
        [
          {"name": "Chest Dips (4 x 12)", "details": "Work chest and triceps with 4 sets of 12 dips.", "gif": ""},
          {"name": "Lat Pulldown (4 x 10)", "details": "Develop back with 4 sets of 10 pulldowns.", "gif": ""},
          {"name": "Face Pulls (4 x 12)", "details": "Enhance rear delts and traps with 4 sets of 12 pulls.", "gif": ""},
        ],
      ];

    } else if (days == 4) {
      return [
        [
          {"name": "Flat Bench Press (4 x 8)", "details": "Build chest strength with 4 sets of 8 bench presses.", "gif": ""},
          {"name": "Incline Dumbbell Press (4 x 10)", "details": "Target upper chest with 4 sets of 10 presses.", "gif": ""},
        ],
        [{"name": "Weighted Pull-ups (4 x 8)", "details": "Increase back and biceps strength with 4 sets of 8 weighted pull-ups.", "gif": ""},
          {"name": "One-Arm Dumbbell Row (4 x 10 per arm)", "details": "Focus on lats with 4 sets of 10 rows per arm.", "gif": ""},
        ],
        [
          {"name": "Overhead Barbell Press (4 x 8)", "details": "Build shoulder and triceps strength with 4 sets of 8 presses.", "gif": ""},
          {"name": "Upright Rows (4 x 10)", "details": "Work traps and shoulders with 4 sets of 10 rows.", "gif": ""},
        ],
        [
          {"name": "Back Squats (4 x 8)", "details": "Develop lower body strength with 4 sets of 8 squats.", "gif": ""},
          {"name": "Walking Lunges (4 x 10 per leg)", "details": "Improve leg endurance and balance with 4 sets of 10 lunges per leg.", "gif": ""},
        ],
      ];
    } else {
      return [];
    }
  }
}
