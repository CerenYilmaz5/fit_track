class WeightLossProgram {
  const WeightLossProgram({
    required this.sparedDays,
    required this.fitnessLevel,
  });

  final int sparedDays; // Number of days the user can work out
  final String fitnessLevel; // "Beginner", "Intermediate", "Advanced"


  // BEGINNER PROGRAMS (weight loss focus)
  static List<List<String>> BeginnerTwoDay = [
    ["Brisk Walking: 30 mins", "Bodyweight Squats: 3x12"],
    ["Modified Push-Ups: 3x10", "Plank: 3x20 sec hold"]
  ];

  static List<List<String>> BeginnerThreeDay = [
    ["Brisk Walking: 30 mins", "Bodyweight Squats: 3x12"],
    ["Modified Push-Ups: 3x10", "Plank: 3x20 sec hold"],
    ["Chair-Assisted Lunges: 3x12", "Seated Russian Twists: 3x10"]
  ];

  static List<List<String>> BeginnerFourDay = [
    ["Brisk Walking: 30 mins", "Bodyweight Squats: 3x12"],
    ["Modified Push-Ups: 3x10", "Plank: 3x20 sec hold"],
    ["Chair-Assisted Lunges: 3x12", "Seated Russian Twists: 3x10"],
    ["Resistance Band Rows: 3x12", "Glute Bridges: 3x15"]
  ];

  static List<List<String>> BeginnerFiveDay = [
    ["Brisk Walking: 30 mins", "Bodyweight Squats: 3x12"],
    ["Modified Push-Ups: 3x10", "Plank: 3x20 sec hold"],
    ["Chair-Assisted Lunges: 3x12", "Seated Russian Twists: 3x10"],
    ["Resistance Band Rows: 3x12", "Glute Bridges: 3x15"],
    ["Cycling or Stationary Bike: 20 mins", "Step-Ups: 3x15 each leg"]
  ];

  // INTERMEDIATE PROGRAMS (weight loss focus)
  static List<List<String>> IntermediateTwoDay = [
    ["HIIT Cardio: 20 mins", "Bodyweight Squats: 3x15"],
    ["Push-Ups: 3x12", "Plank: 3x30 sec hold"]
  ];

  static List<List<String>> IntermediateThreeDay = [
    ["HIIT Cardio: 20 mins", "Bodyweight Squats: 3x15"],
    ["Push-Ups: 3x12", "Plank: 3x30 sec hold"],
    ["Walking Lunges: 3x12 each leg", "Seated Russian Twists: 3x12"]
  ];

  static List<List<String>> IntermediateFourDay = [
    ["HIIT Cardio: 20 mins", "Bodyweight Squats: 3x15"],
    ["Push-Ups: 3x12", "Plank: 3x30 sec hold"],
    ["Walking Lunges: 3x12 each leg", "Seated Russian Twists: 3x12"],
    ["Cycling/Rowing: 20 mins", "Burpees: 3x10"]
  ];

  static List<List<String>> IntermediateFiveDay = [
    ["HIIT Cardio: 20 mins", "Bodyweight Squats: 3x15"],
    ["Push-Ups: 3x12", "Plank: 3x30 sec hold"],
    ["Walking Lunges: 3x12 each leg", "Seated Russian Twists: 3x12"],
    ["Cycling/Rowing: 20 mins", "Burpees: 3x10"],
    ["Strength Circuit: Squats 3x15, Push-Ups 3x12, Plank 3x30 sec hold"]
  ];

  // ADVANCED PROGRAMS (weight loss focus)
  static List<List<String>> AdvancedTwoDay = [
    ["HIIT Cardio: 30 mins", "Weighted Squats: 3x15"],
    ["Push-Ups: 3x15", "Plank: 3x45 sec hold"]
  ];

  static List<List<String>> AdvancedThreeDay = [
    ["HIIT Cardio: 30 mins", "Weighted Squats: 3x15"],
    ["Push-Ups: 3x15", "Plank: 3x45 sec hold"],
    ["Walking Lunges with Dumbbells: 3x15", "Side Plank: 3x30 sec hold"]
  ];

  static List<List<String>> AdvancedFourDay = [
    ["HIIT Cardio: 30 mins", "Weighted Squats: 3x15"],
    ["Push-Ups: 3x15", "Plank: 3x45 sec hold"],
    ["Walking Lunges with Dumbbells: 3x15", "Side Plank: 3x30 sec hold"],
    ["Cycling/Rowing: 30 mins", "Burpees: 3x15"]
  ];

  static List<List<String>> AdvancedFiveDay = [
    ["HIIT Cardio: 30 mins", "Weighted Squats: 3x15"],
    ["Push-Ups: 3x15", "Plank: 3x45 sec hold"],
    ["Walking Lunges with Dumbbells: 3x15", "Side Plank: 3x30 sec hold"],
    ["Cycling/Rowing: 30 mins", "Burpees: 3x15"],
    ["Strength Circuit: Squats 3x15, Deadlifts 3x15, Push-Ups 3x15"]
  ];

  // Method to Get the Program Based on Fitness Level and Available Days
  List<List<String>> getProgram() {
    if (fitnessLevel == "Beginner") {
      switch (sparedDays) {
        case 2:
          return BeginnerTwoDay;
        case 3:
          return BeginnerThreeDay;
        case 4:
          return BeginnerFourDay;
        case 5:
          return BeginnerFiveDay;
        default:
          return [[]];
      }
    } else if (fitnessLevel == "Intermediate") {
      switch (sparedDays) {
        case 2:
          return IntermediateTwoDay;
        case 3:
          return IntermediateThreeDay;
        case 4:
          return IntermediateFourDay;
        case 5:
          return IntermediateFiveDay;
        default:
          return [[]];
      }
    } else if (fitnessLevel == "Advanced") {
      switch (sparedDays) {
        case 2:
          return AdvancedTwoDay;
        case 3:
          return AdvancedThreeDay;
        case 4:
          return AdvancedFourDay;
        case 5:
          return AdvancedFiveDay;
        default:
          return [[]];
      }
    } else {
      return [[]]; // Invalid fitness level
    }
  }
}
