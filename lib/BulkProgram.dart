class Bulkprogram {
  const Bulkprogram({
    required this.sparedDays,
    required this.fitnessLevel,
  });

  final int sparedDays; // Number of workout days
  final String fitnessLevel; // "Beginner", "Intermediate", "Advanced"

  // BEGINNER PROGRAMS
  static List<List<String>> BeginnerTwoDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Lat Pulldown (Wide Grip) 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15", "Hamstring Curl 3x15", "Calf Pushdowns 3x15"]
  ];

  static List<List<String>> BeginnerThreeDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Cable Flies 3x15"],
    ["Lat Pulldown (Wide Grip) 3x10", "Machine Rows 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15", "Hamstring Curl 3x15", "Calf Pushdowns 3x15"]
  ];

  static List<List<String>> BeginnerFourDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Cable Flies 3x15"],
    ["Lat Pulldown (Wide Grip) 3x10", "Machine Rows 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15", "Hamstring Curl 3x15", "Calf Pushdowns 3x15"],
    ["Bicep Curls 3x10", "Cable Pushdowns 3x12"]
  ];

  static List<List<String>> BeginnerFiveDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Cable Flies 3x15"],
    ["Lat Pulldown (Wide Grip) 3x10", "Machine Rows 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15"],
    ["Bicep Curls 3x10", "Cable Pushdowns 3x12"],
    ["Hamstring Curl 3x15", "Calf Pushdowns 3x15"]
  ];

  // INTERMEDIATE PROGRAMS
  static List<List<String>> IntermediateTwoDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Lat Pulldown (Wide Grip) 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15", "Hamstring Curl 3x15", "Calf Pushdowns 3x15"]
  ];

  static List<List<String>> IntermediateThreeDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Cable Flies 3x15"],
    ["Lat Pulldown (Wide Grip) 3x10", "Machine Rows 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15", "Hamstring Curl 3x15", "Calf Pushdowns 3x15"]
  ];

  static List<List<String>> IntermediateFourDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Cable Flies 3x15"],
    ["Lat Pulldown (Wide Grip) 3x10", "Machine Rows 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15", "Hamstring Curl 3x15", "Calf Pushdowns 3x15"],
    ["Bicep Curls 3x10", "Cable Pushdowns 3x12"]
  ];

  static List<List<String>> IntermediateFiveDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Cable Flies 3x15"],
    ["Lat Pulldown (Wide Grip) 3x10", "Machine Rows 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15"],
    ["Bicep Curls 3x10", "Cable Pushdowns 3x12"],
    ["Hamstring Curl 3x15", "Calf Pushdowns 3x15"]
  ];

  // ADVANCED PROGRAMS
  static List<List<String>> AdvancedTwoDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Lat Pulldown (Wide Grip) 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15", "Hamstring Curl 3x15", "Calf Pushdowns 3x15"]
  ];

  static List<List<String>> AdvancedThreeDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Cable Flies 3x15"],
    ["Lat Pulldown (Wide Grip) 3x10", "Machine Rows 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15", "Hamstring Curl 3x15", "Calf Pushdowns 3x15"]
  ];

  static List<List<String>> AdvancedFourDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Cable Flies 3x15"],
    ["Lat Pulldown (Wide Grip) 3x10", "Machine Rows 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15", "Hamstring Curl 3x15", "Calf Pushdowns 3x15"],
    ["Bicep Curls 3x10", "Cable Pushdowns 3x12"]
  ];

  static List<List<String>> AdvancedFiveDayProgram = [
    ["Bench Press 3x10", "Dumbbell Press 3x12", "Cable Flies 3x15"],
    ["Lat Pulldown (Wide Grip) 3x10", "Machine Rows 3x10", "Two-Handed Cable Row 3x12"],
    ["Squat 5x12", "Leg Extensions 4x15"],
    ["Bicep Curls 3x10", "Cable Pushdowns 3x12"],
    ["Hamstring Curl 3x15", "Calf Pushdowns 3x15"]
  ];

  // Method to get the program based on fitness level and available days
  List<List<String>> getProgram() {
    if (fitnessLevel == "Beginner") {
      switch (sparedDays) {
        case 2:
          return BeginnerTwoDayProgram;
        case 3:
          return BeginnerThreeDayProgram;
        case 4:
          return BeginnerFourDayProgram;
        case 5:
          return BeginnerFiveDayProgram;
        default:
          return [[]];
      }
    } else if (fitnessLevel == "Intermediate") {
      switch (sparedDays) {
        case 2:
          return IntermediateTwoDayProgram;
        case 3:
          return IntermediateThreeDayProgram;
        case 4:
          return IntermediateFourDayProgram;
        case 5:
          return IntermediateFiveDayProgram;
        default:
          return [[]];
      }
    } else if (fitnessLevel == "Advanced") {
      switch (sparedDays) {
        case 2:
          return AdvancedTwoDayProgram;
        case 3:
          return AdvancedThreeDayProgram;
        case 4:
          return AdvancedFourDayProgram;
        case 5:
          return AdvancedFiveDayProgram;
        default:
          return [[]];
      }
    } else {
      return [[]]; // Invalid fitness level
    }
  }
}
