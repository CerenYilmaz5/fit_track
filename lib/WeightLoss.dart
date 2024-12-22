class WeightLossProgram {
  final int sparedDays;
  final String fitnessLevel;

  WeightLossProgram({
    required this.sparedDays,
    required this.fitnessLevel,
  });

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

  static List<List<Map<String, String>>> _beginnerProgram(int days) {
    if (days == 2) {
      return [
        [
          {"name": "Brisk Walking (30 mins)", "details": "Burn calories with a low-impact 30-minute walk.", "gif": ""},
          {"name": "Bodyweight Squats (3 x 15)", "details": "Strengthen legs and burn calories with 3 sets of 15 squats.", "gif": ""},
          {"name": "Plank (3 x 20 secs)", "details": "Engage your core with 3 sets of 20-second planks.", "gif": ""},
        ],
        [
          {"name": "Jumping Jacks (3 x 20)", "details": "Boost your heart rate with 3 sets of 20 jumping jacks.", "gif": ""},
          {"name": "Modified Push-ups (3 x 10)", "details": "Strengthen upper body with 3 sets of 10 modified push-ups.", "gif": ""},
          {"name": "Side Plank (3 x 15 secs per side)", "details": "Improve core stability with side planks.", "gif": ""},
        ],
      ];
    } else if (days == 3) {
      return [
        [
          {"name": "Jogging in Place (3 x 2 mins)", "details": "Elevate your heart rate with 3 sets of jogging in place.", "gif": ""},
          {"name": "Step-Ups (3 x 15)", "details": "Tone your legs with 3 sets of step-ups using a sturdy platform.", "gif": ""},
        ],
        [
          {"name": "High Knees (3 x 20 secs)", "details": "Get your heart pumping with high knees for 20 seconds.", "gif": ""},
          {"name": "Push-ups (3 x 10)", "details": "Build upper body strength with 3 sets of push-ups.", "gif": ""},
        ],
        [
          {"name": "Mountain Climbers (3 x 15 secs)", "details": "Burn calories with 3 sets of mountain climbers.", "gif": ""},
          {"name": "Bird Dog (3 x 10 per side)", "details": "Improve core and balance with 3 sets of bird dog.", "gif": ""},
        ],
      ];
    } else if (days == 4) {
      return [
        [
          {"name": "Jump Rope (3 x 1 min)", "details": "Burn calories with 3 sets of jump rope.", "gif": ""},
          {"name": "Bodyweight Squats (3 x 15)", "details": "Strengthen legs and burn calories with squats.", "gif": ""},
        ],
        [
          {"name": "Burpees (3 x 10)", "details": "Full-body exercise to burn calories and build endurance.", "gif": ""},
          {"name": "Plank (3 x 20 secs)", "details": "Core exercise to improve strength and stability.", "gif": ""},
        ],
        [
          {"name": "Step-Ups (3 x 15)", "details": "Strengthen legs and glutes with step-ups.", "gif": ""},
          {"name": "Side Lunges (3 x 10 per leg)", "details": "Work on lateral leg strength and balance.", "gif": ""},
        ],
        [
          {"name": "High Knees (3 x 20 secs)", "details": "Increase heart rate with high knees.", "gif": ""},
          {"name": "Modified Push-ups (3 x 10)", "details": "Strengthen upper body with modified push-ups.", "gif": ""},
        ],
      ];
    } else {
      return [
        [
          {"name": "Brisk Walking (30 mins)", "details": "Burn calories with a low-impact walk.", "gif": ""},
          {"name": "Bodyweight Squats (3 x 15)", "details": "Strengthen your legs with squats.", "gif": ""},
        ],
        [
          {"name": "Plank (3 x 20 secs)", "details": "Core strengthening exercise.", "gif": ""},
          {"name": "Modified Push-ups (3 x 10)", "details": "Strengthen your upper body.", "gif": ""},
        ],
        [
          {"name": "Side Lunges (3 x 10 per side)", "details": "Work on lateral leg strength.", "gif": ""},
          {"name": "Jumping Jacks (3 x 20)", "details": "Increase heart rate.", "gif": ""},
        ],
        [
          {"name": "Step-Ups (3 x 15)", "details": "Tone your legs.", "gif": ""},
          {"name": "High Knees (3 x 20 secs)", "details": "Boost your metabolism.", "gif": ""},
        ],
        [
          {"name": "Jogging in Place (3 x 2 mins)", "details": "Improve endurance.", "gif": ""},
          {"name": "Bird Dog (3 x 10 per side)", "details": "Enhance core stability.", "gif": ""},
        ],
      ];
    }
  }

  static List<List<Map<String, String>>> _intermediateProgram(int days) {
    if (days == 2) {
      return [
        [
          {"name": "Running (30 mins)", "details": "Burn calories with a steady 30-minute run.", "gif": ""},
          {"name": "Jump Squats (3 x 12)", "details": "Build power and burn calories with jump squats.", "gif": ""},
          {"name": "Push-ups (3 x 12)", "details": "Improve upper body strength with push-ups.", "gif": ""},
        ],
        [
          {"name": "Burpees (3 x 15)", "details": "Burn fat with full-body burpees.", "gif": ""},
          {"name": "Plank with Shoulder Taps (3 x 20 taps)", "details": "Strengthen core and shoulders with plank taps.", "gif": ""},
          {"name": "Lunges (3 x 12 per leg)", "details": "Work your legs and glutes with lunges.", "gif": ""},
        ],
      ];
    } else if (days == 3) {
      return [
        [
          {"name": "Jump Rope (3 x 2 mins)", "details": "Burn calories with jump rope intervals.", "gif": ""},
          {"name": "Mountain Climbers (3 x 30 secs)", "details": "Elevate heart rate and burn calories.", "gif": ""},
        ],
        [
          {"name": "Push-ups (3 x 15)", "details": "Strengthen chest and arms with push-ups.", "gif": ""},
          {"name": "Step-Ups (3 x 15)", "details": "Tone legs and glutes with step-ups.", "gif": ""},
        ],
        [
          {"name": "Burpees (3 x 12)", "details": "Full-body workout to burn calories.", "gif": ""},
          {"name": "Side Plank (3 x 15 secs per side)", "details": "Improve core strength with side planks.", "gif": ""},
        ],
      ];
    } else if (days == 4) {
      return [
        [
          {"name": "Running (30 mins)", "details": "Burn calories and improve cardiovascular endurance.", "gif": ""},
          {"name": "Bodyweight Squats (3 x 15)", "details": "Strengthen lower body and burn calories.", "gif": ""},
        ],
        [
          {"name": "Jumping Jacks (3 x 20)", "details": "Boost metabolism with jumping jacks.", "gif": ""},
          {"name": "Push-ups (3 x 12)", "details": "Build upper body strength with push-ups.", "gif": ""},
        ],
        [
          {"name": "Mountain Climbers (3 x 20 secs)", "details": "Intense core and cardio exercise.", "gif": ""},
          {"name": "Plank (3 x 20 secs)", "details": "Strengthen your core and stability.", "gif": ""},
        ],
        [
          {"name": "Burpees (3 x 10)", "details": "Full-body workout to burn fat.", "gif": ""},
          {"name": "Lunges (3 x 12 per leg)", "details": "Tone your legs and glutes with lunges.", "gif": ""},
        ],
      ];
    } else {
      return [
        [
          {"name": "Running (30 mins)", "details": "Burn calories with a steady run.", "gif": ""},
          {"name": "Push-ups (3 x 12)", "details": "Strengthen upper body.", "gif": ""},
        ],
        [
          {"name": "Burpees (3 x 15)", "details": "Full-body workout.", "gif": ""},
          {"name": "Lunges (3 x 12 per leg)", "details": "Tone your legs.", "gif": ""},
        ],
        [
          {"name": "Mountain Climbers (3 x 30 secs)", "details": "Boost heart rate.", "gif": ""},
          {"name": "Step-Ups (3 x 15)", "details": "Work your lower body.", "gif": ""},
        ],
        [
          {"name": "Side Plank with Hip Dips (3 x 15 per side)", "details": "Core stabilization.", "gif": ""},
          {"name": "Jump Rope (3 x 2 mins)", "details": "High-intensity cardio.", "gif": ""},
        ],
        [
          {"name": "Burpees (3 x 12)", "details": "Full-body fat-burning exercise.", "gif": ""},
          {"name": "Push-ups (3 x 15)", "details": "Strengthen upper body muscles.", "gif": ""},
        ],
      ];
    }
  }

  static List<List<Map<String, String>>> _expertProgram(int days) {
    if (days == 2) {
      return [
        [
          {"name": "Running (40 mins)", "details": "Burn calories with an extended run.", "gif": ""},
          {"name": "Jump Squats (4 x 15)", "details": "Increase power and burn calories with jump squats.", "gif": ""},
          {"name": "Push-ups (4 x 15)", "details": "Build upper body strength with push-ups.", "gif": ""},
        ],
        [
          {"name": "Burpees (4 x 15)", "details": "Full-body calorie-burning workout.", "gif": ""},
          {"name": "Plank with Arm Lifts (4 x 20 secs)", "details": "Strengthen core and shoulders.", "gif": ""},
          {"name": "Walking Lunges (4 x 12 per leg)", "details": "Tone your legs and improve balance.", "gif": ""},
        ],
      ];
    } else if (days == 3) {
      return [
        [
          {"name": "Jump Rope (4 x 2 mins)", "details": "Burn calories with jump rope intervals.", "gif": ""},
          {"name": "Mountain Climbers (4 x 30 secs)", "details": "Elevate heart rate and burn fat.", "gif": ""},
        ],
        [
          {"name": "Push-ups (4 x 15)", "details": "Improve upper body strength.", "gif": ""},
          {"name": "Step-Ups (4 x 15)", "details": "Tone legs and glutes.", "gif": ""},
        ],
        [
          {"name": "Burpees (4 x 12)", "details": "Full-body fat-burning exercise.", "gif": ""},
          {"name": "Side Plank with Hip Dips (4 x 15 per side)", "details": "Enhance core strength and stability.", "gif": ""},
        ],
      ];
    } else if (days == 4) {
      return [
        [
          {"name": "Running (40 mins)", "details": "Improve endurance and burn calories.", "gif": ""},
          {"name": "Bodyweight Squats (4 x 15)", "details": "Strengthen lower body and burn calories.", "gif": ""},
        ],
        [
          {"name": "Jumping Jacks (4 x 20)", "details": "Boost your heart rate and metabolism.", "gif": ""},
          {"name": "Push-ups (4 x 12)", "details": "Build upper body strength.", "gif": ""},
        ],
        [
          {"name": "Mountain Climbers (4 x 20 secs)", "details": "Core and cardio workout.", "gif": ""},
          {"name": "Plank (4 x 20 secs)", "details": "Improve core strength and stability.", "gif": ""},
        ],
        [
          {"name": "Burpees (4 x 12)", "details": "Burn fat and improve endurance.", "gif": ""},
          {"name": "Lunges (4 x 12 per leg)", "details": "Tone legs and glutes.", "gif": ""},
        ],
      ];
    } else {
      return [
        [
          {"name": "Running (40 mins)", "details": "Burn calories with an extended run.", "gif": ""},
          {"name": "Push-ups (4 x 15)", "details": "Enhance upper body strength.", "gif": ""},
        ],
        [
          {"name": "Jump Squats (4 x 15)", "details": "Power and cardio.", "gif": ""},
          {"name": "Lunges (4 x 12 per leg)", "details": "Tone lower body.", "gif": ""},
        ],
        [
          {"name": "Mountain Climbers (4 x 30 secs)", "details": "Core and cardio exercise.", "gif": ""},
          {"name": "Burpees (4 x 12)", "details": "High-intensity full-body workout.", "gif": ""},
        ],
        [
          {"name": "Step-Ups (4 x 15)", "details": "Build leg strength.", "gif": ""},
          {"name": "Plank with Arm Lifts (4 x 20 secs)", "details": "Enhance core stability.", "gif": ""},
        ],
        [
          {"name": "Jump Rope (4 x 2 mins)", "details": "Burn calories.", "gif": ""},
          {"name": "Side Plank with Hip Dips (4 x 15 per side)", "details": "Improve core stability.", "gif": ""},
        ],
      ];;
    }
  }
}
