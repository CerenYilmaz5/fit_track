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
          {"name": "Push-up 2x10 (Warm Up)", "details": "Start in a plank position with your hands shoulder-width apart. Lower your body until your chest is just above the floor, then push back up. Perform 2 sets of 10 reps.", "gif": ""},
          {"name": "Cable Bent Over Bar Pullover 2x10 (Warm Up)", "details": "Stand with feet shoulder-width apart. Bend slightly at the hips, keeping your back straight. Pull the bar down towards your thighs while keeping your arms straight. Perform 2 sets of 10 reps.", "gif": ""},
          {"name": "Dumbell Bench Press 3x12", "details": "Lie on a bench with a dumbbell in each hand. Press the dumbbells upwards until your arms are straight, then slowly lower them back. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Incline Bench Press 3x12", "details": "Set the bench at an incline. Press dumbbells upward and slightly inward, focusing on your upper chest. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Fly 3x12", "details": "Lie on a bench holding dumbbells with your palms facing each other. Lower the dumbbells out to the sides, then bring them back together over your chest. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Cable Pulldown 3x12", "details": "Sit at a cable machine with a wide bar attached. Pull the bar down to your chest, keeping your back straight. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Single Arm Dumbell Row 3x12", "details": "Place one knee and hand on a bench for support. Pull the dumbbell upwards towards your waist, keeping your back straight. Perform 3 sets of 12 reps per arm.", "gif": ""},
          {"name": "Machine Neutral Overhead Press 3x12", "details": "Sit at a shoulder press machine with your hands on the handles. Press upwards until your arms are fully extended, then return slowly. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Lateral Raise 3x12", "details": "Hold dumbbells by your sides with a slight bend in your elbows. Lift your arms out to the sides until they are shoulder height, then lower slowly. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Cable Pushdown 2x12", "details": "Stand at a cable machine with a straight bar. Push the bar downwards until your arms are fully extended, then return slowly. Perform 2 sets of 12 reps.", "gif": ""},
          {"name": "Cable Biceps Curl 2x12", "details": "Attach a straight bar to a low pulley. Curl the bar upwards towards your chest, squeezing your biceps. Perform 2 sets of 12 reps.", "gif": ""},
          {"name": "Leg Extension 3x12", "details": "Sit on a leg extension machine with your feet under the padded bar. Extend your legs fully, then lower slowly. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Leg Curl Machine 3x12", "details": "Lie face down on a leg curl machine. Curl the pad towards your glutes, then lower slowly. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Calf Raise 2x12", "details": "Stand on the edge of a platform with your heels hanging off. Raise your heels as high as possible, then lower slowly. Perform 2 sets of 12 reps.", "gif": ""},
        ],
        [
          {"name": "Push-up 2x10 (Warm Up)", "details": "Start in a plank position with your hands shoulder-width apart. Lower your body until your chest is just above the floor, then push back up. Perform 2 sets of 10 reps.", "gif": ""},
          {"name": "Cable Bent Over Bar Pullover 2x10 (Warm Up)", "details": "Stand with feet shoulder-width apart. Bend slightly at the hips, keeping your back straight. Pull the bar down towards your thighs while keeping your arms straight. Perform 2 sets of 10 reps.", "gif": ""},
          {"name": "Dumbell Bench Press 3x12", "details": "Lie on a bench with a dumbbell in each hand. Press the dumbbells upwards until your arms are straight, then slowly lower them back. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Incline Bench Press 3x12", "details": "Set the bench at an incline. Press dumbbells upward and slightly inward, focusing on your upper chest. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Fly 3x12", "details": "Lie on a bench holding dumbbells with your palms facing each other. Lower the dumbbells out to the sides, then bring them back together over your chest. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Cable Pulldown 3x12", "details": "Sit at a cable machine with a wide bar attached. Pull the bar down to your chest, keeping your back straight. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Single Arm Dumbell Row 3x12", "details": "Place one knee and hand on a bench for support. Pull the dumbbell upwards towards your waist, keeping your back straight. Perform 3 sets of 12 reps per arm.", "gif": ""},
          {"name": "Machine Neutral Overhead Press 3x12", "details": "Sit at a shoulder press machine with your hands on the handles. Press upwards until your arms are fully extended, then return slowly. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Lateral Raise 3x12", "details": "Hold dumbbells by your sides with a slight bend in your elbows. Lift your arms out to the sides until they are shoulder height, then lower slowly. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Cable Pushdown 2x12", "details": "Stand at a cable machine with a straight bar. Push the bar downwards until your arms are fully extended, then return slowly. Perform 2 sets of 12 reps.", "gif": ""},
          {"name": "Cable Biceps Curl 2x12", "details": "Attach a straight bar to a low pulley. Curl the bar upwards towards your chest, squeezing your biceps. Perform 2 sets of 12 reps.", "gif": ""},
          {"name": "Leg Extension 3x12", "details": "Sit on a leg extension machine with your feet under the padded bar. Extend your legs fully, then lower slowly. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Leg Curl Machine 3x12", "details": "Lie face down on a leg curl machine. Curl the pad towards your glutes, then lower slowly. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Calf Raise 2x12", "details": "Stand on the edge of a platform with your heels hanging off. Raise your heels as high as possible, then lower slowly. Perform 2 sets of 12 reps.", "gif": ""},
        ],
      ];
    }


    else if (days == 3)
    {
      return [
        [
          {"name": "DB Box Goblet Squat 3x10", "details": "Hold a dumbbell close to your chest and perform a squat onto a box. Lower yourself until seated, then stand up by driving through your heels. Perform 3 sets of 10 reps.", "gif": ""},
          {"name": "DB Standing Shoulder Press 3x8-12", "details": "Stand with dumbbells at shoulder height. Press them upwards until your arms are fully extended, then lower slowly. Perform 3 sets of 8-12 reps.", "gif": ""},
          {"name": "DB One Arm Row 3x8-12", "details": "Place one knee and hand on a bench for support. Row a dumbbell towards your waist with your other hand. Perform 3 sets of 8-12 reps per side.", "gif": ""},
          {"name": "Push-up 3x10-15", "details": "Start in a plank position with your hands shoulder-width apart. Lower your body until your chest is near the floor, then push back up. Perform 3 sets of 10-15 reps.", "gif": ""},
          {"name": "Dumbell Curl 3x10", "details": "Hold dumbbells with your palms facing forward. Curl the weights towards your shoulders, then lower them slowly. Perform 3 sets of 10 reps.", "gif": ""},
          {"name": "Machine Leg Curl 3x10-15", "details": "Sit on a leg curl machine and curl your legs back towards your glutes. Return slowly to the starting position. Perform 3 sets of 10-15 reps.", "gif": ""},
          {"name": "Banded Pallof Press 3x10-15", "details": "Attach a resistance band to a fixed point at chest height. Hold the band with both hands and press it straight out in front of you, resisting the band’s pull. Perform 3 sets of 10-15 reps.", "gif": ""},
        ],
        [
          {"name": "Dumbell Romanian Deadlift 3x8", "details": "Hold dumbbells in front of your thighs. Lower the dumbbells by hinging at your hips while keeping your back straight. Stand up by driving through your hips. Perform 3 sets of 8 reps.", "gif": ""},
          {"name": "Machine Seated Row 3x8-12", "details": "Sit at a rowing machine. Pull the handles towards your chest while keeping your back straight. Return slowly. Perform 3 sets of 8-12 reps.", "gif": ""},
          {"name": "Kettlebell Swing 3x15", "details": "Hold a kettlebell with both hands. Swing it between your legs and then forward to shoulder height by thrusting your hips forward. Perform 3 sets of 15 reps.", "gif": ""},
          {"name": "Barbell Woodchoppers 3x10-15", "details": "Hold a barbell with both hands. Rotate your torso to one side, then chop diagonally across your body. Perform 3 sets of 10-15 reps per side.", "gif": ""},
          {"name": "Plank 3x30 sec", "details": "Start in a plank position on your elbows and toes. Keep your body straight and hold for 30 seconds. Perform 3 sets.", "gif": ""},
        ],
        [
          {"name": "Single Leg Box Squat 3x8", "details": "Sit on a box with one leg extended forward and the other foot flat on the ground. Stand up using the supporting leg, then sit back down. Perform 3 sets of 8 reps per leg.", "gif": ""},
          {"name": "Dumbell Lunge 3x10", "details": "Hold dumbbells at your sides. Step forward into a lunge, keeping your torso upright. Return to the starting position. Perform 3 sets of 10 reps per leg.", "gif": ""},
          {"name": "Incline Pushup 3x10", "details": "Place your hands on an elevated surface and perform a push-up. Keep your body straight and lower yourself until your chest nearly touches the surface. Perform 3 sets of 10 reps.", "gif": ""},
          {"name": "Inverted Row 3x8-12", "details": "Set a bar at waist height. Hang under the bar with your body straight and pull your chest to the bar. Perform 3 sets of 8-12 reps.", "gif": ""},
          {"name": "Machine Tricep Pushdown 3x10", "details": "Stand at a cable machine with a straight bar. Push the bar downwards until your arms are fully extended, then return slowly. Perform 3 sets of 10 reps.", "gif": ""},
          {"name": "Barbell Half Kneeling Rotation 3x10-15", "details": "Hold a barbell with both hands while kneeling on one knee. Rotate the barbell across your body, then return to the starting position. Perform 3 sets of 10-15 reps.", "gif": ""},
          {"name": "Dumbell Single Arm Carry 3x10-15", "details": "Hold a dumbbell in one hand and walk a set distance while maintaining an upright posture. Switch hands and repeat. Perform 3 sets of 10-15 reps per arm.", "gif": ""},
        ],
      ];
    }

    else if (days == 4)
    {
      return [
        [
          {"name": "Dumbell Bench Press 4x12", "details": "Lie on a bench holding dumbbells at chest height. Press them upwards until your arms are fully extended, then lower slowly. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Incline Bench Press 4x12", "details": "Set the bench to an incline position. Press the dumbbells upwards until your arms are fully extended. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Cable Crossover 4x12", "details": "Stand between two cable pulleys. Pull the handles inwards and downwards in a sweeping motion until your hands meet in front of you. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Push-up 3x10-15", "details": "Start in a plank position with hands shoulder-width apart. Lower yourself until your chest nearly touches the floor, then push back up. Perform 3 sets of 10-15 reps.", "gif": ""},
          {"name": "Dumbell One Arm Row 3x8-10", "details": "Place one knee and hand on a bench for support. Row a dumbbell towards your waist with the other hand. Perform 3 sets of 8-10 reps per side.", "gif": ""},
          {"name": "Dumbell Shoulder Press 3x8-12", "details": "Hold dumbbells at shoulder height. Press them upwards until your arms are fully extended, then lower slowly. Perform 3 sets of 8-12 reps.", "gif": ""},
          {"name": "Machine Leg Curl 3x10-15", "details": "Sit on a leg curl machine and curl your legs back towards your glutes. Return slowly to the starting position. Perform 3 sets of 10-15 reps.", "gif": ""},
          {"name": "Cable Crunch 3x10-15", "details": "Kneel below a cable machine with a rope attachment. Pull the rope down while crunching your torso forward. Perform 3 sets of 10-15 reps.", "gif": ""},
        ],
        [
          {"name": "Machine Lat Pulldown 3x10-12", "details": "Sit at a lat pulldown machine. Pull the bar down to your chest while keeping your back straight. Perform 3 sets of 10-12 reps.", "gif": ""},
          {"name": "DB One Arm Row 3x8-12", "details": "Place one knee and hand on a bench for support. Row a dumbbell towards your waist with the other hand. Perform 3 sets of 8-12 reps per side.", "gif": ""},
          {"name": "Dumbell Romanian Deadlift 3x8", "details": "Hold dumbbells in front of your thighs. Lower them by hinging at your hips while keeping your back straight. Perform 3 sets of 8 reps.", "gif": ""},
          {"name": "Dumbell Bench Press 3x8-12", "details": "Lie on a bench holding dumbbells at chest height. Press them upwards until your arms are fully extended. Perform 3 sets of 8-12 reps.", "gif": ""},
          {"name": "Dumbell Pullover 3x8", "details": "Lie on a bench holding a dumbbell with both hands. Lower the dumbbell behind your head, then bring it back over your chest. Perform 3 sets of 8 reps.", "gif": ""},
          {"name": "Kettlebell Swing 3x15", "details": "Hold a kettlebell with both hands. Swing it between your legs and then forward to shoulder height using your hips. Perform 3 sets of 15 reps.", "gif": ""},
          {"name": "Plank 3x30 sec", "details": "Start in a plank position on your elbows and toes. Keep your body straight and hold for 30 seconds. Perform 3 sets.", "gif": ""},
        ],
        [
          {"name": "DB Standing Shoulder Press 3x8-12", "details": "Stand with dumbbells at shoulder height. Press them upwards until your arms are fully extended. Perform 3 sets of 8-12 reps.", "gif": ""},
          {"name": "Dumbell Lateral Raise 3x12", "details": "Hold dumbbells by your sides. Lift them out to shoulder height with a slight bend in your elbows. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Machine Neutral Overhead Press 3x12", "details": "Sit at a shoulder press machine. Press the handles upward until your arms are fully extended. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Face Pull 3x12", "details": "Attach a rope to a cable machine at face height. Pull the rope towards your face while keeping your elbows high. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Cable Bent Over Bar Pullover 3x10", "details": "Stand bent over with a bar attached to a cable machine. Pull the bar down towards your thighs while keeping your arms straight. Perform 3 sets of 10 reps.", "gif": ""},
        ],
        [
          {"name": "Cable Pushdown 3x12", "details": "Stand at a cable machine with a straight bar. Push the bar downwards until your arms are fully extended. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Cable Biceps Curl 3x12", "details": "Attach a bar to a low pulley. Curl the bar towards your chest while keeping your elbows close to your body. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Hammer Curl 3x10", "details": "Hold dumbbells with a neutral grip. Curl the weights towards your shoulders, then lower them slowly. Perform 3 sets of 10 reps.", "gif": ""},
          {"name": "Leg Extension 3x12", "details": "Sit at a leg extension machine. Extend your legs forward until they are straight, then lower them back. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Leg Curl Machine 3x12", "details": "Sit on a leg curl machine and curl your legs back towards your glutes. Return slowly. Perform 3 sets of 12 reps.", "gif": ""},
          {"name": "Calf Raise 2x12", "details": "Stand on a raised platform with your heels hanging off. Raise your heels as high as possible, then lower them back down. Perform 2 sets of 12 reps.", "gif": ""},
          {"name": "Machine 45 Degree Back Extension 2x10", "details": "Sit on a back extension machine. Lean forward at the hips, then extend your torso back to the starting position. Perform 2 sets of 10 reps.", "gif": ""},
        ],
      ];
    }

    else
    {
      return [
        [
          {"name": "Dumbell Bench Press 4x12", "details": "Lie on a bench holding dumbbells at chest height. Press them upwards until your arms are fully extended, then lower slowly. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Incline Bench Press 4x12", "details": "Set the bench to an incline position. Press the dumbbells upwards until your arms are fully extended. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Cable Crossover 4x12", "details": "Stand between two cable pulleys. Pull the handles inwards and downwards in a sweeping motion until your hands meet in front of you. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Push-up 4x10-15", "details": "Start in a plank position with hands shoulder-width apart. Lower yourself until your chest nearly touches the floor, then push back up. Perform 4 sets of 10-15 reps.", "gif": ""},
          {"name": "Pullover 4x10", "details": "Lie on a bench holding a dumbbell with both hands. Lower the dumbbell behind your head, then bring it back over your chest. Perform 4 sets of 10 reps.", "gif": ""},
          {"name": "Cable Crunch 3x10-15", "details": "Kneel below a cable machine with a rope attachment. Pull the rope down while crunching your torso forward. Perform 3 sets of 10-15 reps.", "gif": ""},
          {"name": "Hanging Knee Raises 3x10-15", "details": "Hang from a pull-up bar and lift your knees towards your chest. Lower slowly. Perform 3 sets of 10-15 reps.", "gif": ""},
        ],
        [
          {"name": "Machine Lat Pulldown 4x10-12", "details": "Sit at a lat pulldown machine. Pull the bar down to your chest while keeping your back straight. Perform 4 sets of 10-12 reps.", "gif": ""},
          {"name": "DB One Arm Row 4x8-12", "details": "Place one knee and hand on a bench for support. Row a dumbbell towards your waist with the other hand. Perform 4 sets of 8-12 reps per side.", "gif": ""},
          {"name": "Dumbell Romanian Deadlift 4x8", "details": "Hold dumbbells in front of your thighs. Lower them by hinging at your hips while keeping your back straight. Perform 4 sets of 8 reps.", "gif": ""},
          {"name": "Machine Reverse Grip Lat Pulldown 4x10-12", "details": "Use a lat pulldown machine with a reverse grip. Pull the bar down towards your chest. Perform 4 sets of 10-12 reps.", "gif": ""},
          {"name": "Cable Bent Over Bar Pullover 4x10", "details": "Stand bent over with a bar attached to a cable machine. Pull the bar down towards your thighs while keeping your arms straight. Perform 4 sets of 10 reps.", "gif": ""},
        ],
        [
          {"name": "Machine Neutral Overhead Press 4x12", "details": "Sit at a shoulder press machine. Press the handles upward until your arms are fully extended. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Lateral Raise 4x12", "details": "Hold dumbbells by your sides. Lift them out to shoulder height with a slight bend in your elbows. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Dumbbell Front Raise 4x12", "details": "Hold dumbbells in front of your thighs. Lift them forward to shoulder height. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Dumbbell Seated Rear Delt Fly 4x10", "details": "Sit on a bench holding dumbbells. Bend forward slightly and lift the dumbbells out to the sides. Perform 4 sets of 10 reps.", "gif": ""},
        ],
        [
          {"name": "Cable Bar Curl 4x12-10", "details": "Stand at a cable machine with a bar attachment. Curl the bar towards your chest. Perform 4 sets, reducing reps as needed (12-10).", "gif": ""},
          {"name": "Cable Hammer Curl 4x10", "details": "Attach a rope to a cable machine. Curl the rope upwards with a neutral grip. Perform 4 sets of 10 reps.", "gif": ""},
          {"name": "Cable Rope Pushdown 4x12-10", "details": "Stand at a cable machine with a rope attachment. Push the rope downwards until your arms are fully extended. Perform 4 sets, reducing reps as needed (12-10).", "gif": ""},
          {"name": "Dumbbell Skullcrusher 4x10-8", "details": "Lie on a bench holding dumbbells. Lower them towards your head, then press back up. Perform 4 sets, reducing reps as needed (10-8).", "gif": ""},
        ],
        [
          {"name": "Leg Extension 4x12", "details": "Sit at a leg extension machine. Extend your legs forward until they are straight, then lower them back. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Leg Curl Machine 4x12", "details": "Sit on a leg curl machine and curl your legs back towards your glutes. Return slowly. Perform 4 sets of 12 reps.", "gif": ""},
          {"name": "Dumbell Lunge 4x10", "details": "Hold dumbbells by your sides. Step forward into a lunge position, then push back up. Perform 4 sets of 10 reps per leg.", "gif": ""},
          {"name": "Calf Raise 4x12", "details": "Stand on a raised platform with your heels hanging off. Raise your heels as high as possible, then lower them back down. Perform 4 sets of 12 reps.", "gif": ""},
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
          {"name": "Barbell Bench Press 4x10", "details": "Lie on a bench, grip the barbell slightly wider than shoulder-width, and press it upwards. Perform 4 sets of 10 reps.", "gif": "lib/assets/male-barbell-bench-press-front.gif"},
          {"name": "Incline Dumbbell Press 3x10", "details": "Set the bench to an incline and press the dumbbells upward for 3 sets of 10 reps.", "gif": "lib/assets/male-barbell-bench-press-front.gif"},
          {"name": "Barbell Row 4x8-10", "details": "Hinge at your hips and pull the barbell towards your waist for 4 sets of 8-10 reps.", "gif": "lib/assets/barbellrow-1457038583.gif"},
          {"name": "Barbell Squat 4x12", "details": "Position the barbell across your shoulders, squat down, and return to standing. Perform 4 sets of 12 reps.", "gif": "lib/assets/squat.jpg"},
          {"name": "Romanian Deadlift 3x10", "details": "Hinge at your hips while holding a barbell to target hamstrings and glutes. Perform 3 sets of 10 reps.", "gif": "lib/assets/romdeadlift.jpg"},
        ],
        [
          {"name": "Deadlift 4x6", "details": "Stand with feet shoulder-width apart, grip the barbell, and lift it by extending your hips and knees. Perform 4 sets of 6 reps.", "gif": "lib/assets/deadlift.gif"},
          {"name": "Pull-Ups 4x10", "details": "Grip a pull-up bar and lift your body until your chin clears the bar. Perform 4 sets of 10 reps.", "gif": ""},
          {"name": "Barbell Overhead Press 3x8", "details": "Press a barbell overhead to target your shoulders. Perform 3 sets of 8 reps.", "gif": ""},
          {"name": "Walking Lunges 3x10 per leg", "details": "Hold dumbbells and perform lunges while walking forward. Perform 3 sets of 10 reps per leg.", "gif": ""},
          {"name": "Plank 3x60 sec", "details": "Hold a plank position for 60 seconds to strengthen your core. Perform 3 sets.", "gif": ""},
        ],
      ];
    }
    if (days == 3)
    {
      return [
        [
          {"name": "Barbell Bench Press 4x8", "details": "Lying on a bench, lower the bar towards your chest and raise it back up in a controlled manner. Work your chest and triceps muscles by doing 8 reps in each set.", "gif": ""},
          {"name": "Incline Barbell Press 4x10", "details": "Set the bench in an incline position (about 45 degrees) and press the bar up to target your upper pecs. Do 4 sets of 10 reps.", "gif": ""},
          {"name": "Barbell Row 4x8", "details": "Stand with your feet shoulder-width apart, bend your knees slightly, and pull the bar toward your waist. Do 4 sets of 8 reps, targeting your back muscles.", "gif": ""},
          {"name": "Barbell Squat 4x10", "details": "Place the bar on your trapezius muscles. Squat down completely by bending your knees and pushing your hips back, then stand up. Strengthen your leg and hip muscles by doing 4 sets of 10 reps.", "gif": ""},
        ],
        [
          {"name": "Deadlift 4x5", "details": "It is a movement that works your entire body muscles by lifting the bar off the ground. Keep your waist straight and complete the movement by bending your knees. Do 4 sets, 5 repetitions.", "gif": ""},
          {"name": "Chin-Ups 4x10", "details": "Grasp the bar with your hands shoulder-width apart and palms facing you. Pull your body up to chin level. Do 4 sets of 10 reps.", "gif": ""},
          {"name": "Barbell Overhead Press 3x8", "details": "Lift the bar over your head, starting at shoulder height. Do 3 sets of 8 reps, working your shoulder and triceps muscles.", "gif": ""},
          {"name": "Dumbbell Side Lateral Raises 3x12", "details": "Lift dumbbells to shoulder height to isolate your lateral deltoids. Perform 3 sets of 12 reps.", "gif": ""},
        ],
        [
          {"name": "Barbell Front Squat 4x10", "details": "Place the bar in front of your shoulders and squat down fully. This move targets your legs and glutes. Do 4 sets of 10 reps.", "gif": ""},
          {"name": "Romanian Deadlift 3x10", "details": "Target your hamstrings with this controlled movement. Perform 3 sets of 10 reps.", "gif": ""},
          {"name": "Walking Dumbbell Lunges 3x10 per leg", "details": "Strengthen your legs with 3 sets of 10 reps per leg.", "gif": ""},
          {"name": "Cable Crunches 3x15", "details": "Kneel and crunch down using a cable machine. Perform 3 sets of 15 reps.", "gif": ""},
        ],
      ];
    }

    else if (days == 4)
    {
      return [
        [
          {"name": "Barbell Bench Press (4 x 10)", "details": "Lie on the bench and place your back straight. Grab the bar with a shoulder-width grip. Lower the bar to the center of your chest in a controlled manner."
              " Your elbows should be slightly outward and push the bar back up to return to the starting position. Complete this move by doing 4 sets of 10 reps to strengthen your chest and triceps muscles.", "gif": ""},
          {"name": "Incline Barbell Bench Press (4 x 10)", "details": "Set the bench at a 45-degree incline. Grab the bar with a shoulder-width grip. Lower the bar to your upper chest and press it back up with control to target your upper pecs. "
              "Complete this move for 4 sets of 10 reps.", "gif": ""},
          {"name": "Cable Crossover (4 x 12)", "details": "At the cable station, grab the cable handles in each hand. Bring the cables in front of you in a crisscross pattern, bending your arms slightly. Squeeze your chest muscles at the end of the movement. Then return to the starting position in a controlled manner. "
              "Complete this exercise by doing 12 reps for 4 sets to tighten the middle of your chest.", "gif": ""},
          {"name": "Push-up (3 x 15)", "details": "Start in a plank position, with your hands shoulder-width apart and your body in a straight line. Bend your elbows to lower your chest toward the floor, then powerfully push yourself up. "
              "Complete 3 sets of 15 reps to target your chest, shoulders, and triceps.", "gif": ""},
          {"name": "Barbell Skullcrusher (4 x 10)", "details": "Lie on your back on a bench and grab the barbell with a narrow grip. Keeping your elbows steady, lower the barbell towards your forehead and press the barbell back up by engaging your triceps. "
              "Complete this exercise by doing 4 sets of 10 reps.", "gif": ""},
          {"name": "Hanging Leg Raise (3 x 12)", "details": "Grasp a chin-up bar with your palms facing forward. Use your abs to straighten your legs up and bring them to hip height. Slowly return to the starting position. Complete 3 sets of 12 reps to strengthen your lower abs.", "gif": ""}
        ],
        [
          {"name": "Deadlift (4 x 8)", "details": "Stand in front of the barbell with your feet hip-width apart. Bend your knees to grasp the barbell. Keeping your back straight and using your hips, lift the barbell off the floor. Pull your shoulders back at the top of the movement. Return to the starting position in a controlled manner. "
              "Work your entire body by doing 8 reps for 4 sets.", "gif": ""},
          {"name": "Lat Pulldown (4 x 12)", "details": "Sit on the lat pulldown machine and grasp the bar with a shoulder-width grip. Pull the bar toward your chest, squeezing your shoulder blades together to activate your back muscles. Slowly return to the starting position. Target your back muscles by doing 4 sets of 12 reps.", "gif": ""},
          {"name": "One-Arm Dumbbell Row (4 x 10 per arm)", "details": "Create a stable stance by placing one knee on the bench and the other foot on the floor. Hold a dumbbell in your other hand and keep your back straight. Pull the dumbbell toward your waist, squeezing your back muscles, then return to the starting position in a controlled manner. Strengthen your back by doing 4 sets of 10 reps for each arm.", "gif": ""},
          {"name": "T-Bar Row (4 x 10)", "details": "Grasp the handles of the T-Bar row machine with your feet planted. Pull the handles toward your abdomen, keeping your knees slightly bent and your back straight. Return to the starting position in a controlled manner. Increase the thickness of your back by doing 10 repetitions for 4 sets.", "gif": ""},
          {"name": "Face Pull (3 x 15)", "details": "At the cable station, grasp the rope handles at face height. Pull the rope toward your face, squeezing the posterior deltoids and upper back muscles. Return to the starting position with control. Work the posterior deltoids and back muscles", "gif": ""}
        ],
        [
          {"name": "Barbell Shoulder Press (4 x 10)", "details": "Lift the barbell overhead, starting at shoulder height. Press up without locking your elbows, then return to the starting position with control.", "gif": ""},
          {"name": "Dumbbell Lateral Raise (4 x 12)", "details": "Start by holding dumbbells at your sides with palms facing each other. Keeping your arms straight, raise the dumbbells to shoulder height, then slowly lower them.", "gif": ""},
          {"name": "Dumbbell Front Raise (4 x 12)", "details": "Start by holding the dumbbells in front of you with your palms facing down. Keeping your arms straight, raise the dumbbells to shoulder height, then lower them with control..", "gif": ""},
          {"name": "Arnold Press (3 x 12)", "details": "Start with the dumbbells at shoulder height with your palms facing you. As you lift the dumbbells up, rotate your palms outward and bring them together above your head. Return to the starting position with control.", "gif": ""}
        ],
        [
          {"name": "Barbell Squat (4 x 12)", "details": "Place the bar on your trapezius muscles and stand with your feet shoulder-width apart. Bend your knees and squat down. Slowly return to the starting position.", "gif": ""},
          {"name": "Leg Press (4 x 12)", "details": "On a leg press machine, place your feet on the platform, hip-width apart. Lower the platform toward you by bending your knees, then push back up to the starting position.", "gif": ""},
          {"name": "Romanian Deadlift (4 x 10)", "details": "Start at waist height, holding a barbell or dumbbell with your palms facing down. Lower the weight forward, keeping your knees slightly bent and your back straight. Return to the starting position by engaging your hamstrings.", "gif": ""},
          {"name": "Walking Lunges (3 x 12 per leg)", "details": "Holding dumbbells at your sides, step forward and bend your knees into a squat.", "gif": ""},
          {"name": "Standing Calf Raise (4 x 15)", "details": "Standing, lift your heels off the floor and squeeze your calf muscles. Return to the starting position in a controlled manner.", "gif": ""}
        ]
      ];
    }

    else
    {
      return [
        [
          {"name": "Barbell Bench Press (4 x 10)", "details": "Place your back flat on the bench. Grab the bar with a shoulder-width grip and raise it toward your chest.", "gif": ""},
          {"name": "Incline Dumbbell Press (4 x 10)", "details": "Set the bench to an incline. Hold the dumbbells with both hands at shoulder height and press them up. Lift and lower the dumbbells with control to target your upper pecs.", "gif": ""},
          {"name": "Cable Fly (4 x 12)", "details": "At a cable station, grab the cable handles in each hand. Bring the cables diagonally forward, keeping your arms slightly bent. Bring your arms back to the starting position to tighten the middle of your chest.", "gif": ""},
          {"name": "Push-up (3 x 15)", "details": "Start in a plank position, your hands shoulder-width apart and your body in a straight line. Bend your elbows to lower your chest toward the floor, then push yourself up.", "gif": ""},
          {"name": "Tricep Rope Pushdown (4 x 12)", "details": "At the cable station, hold the rope with both hands and pull down. Straighten your elbows completely to tighten your triceps.", "gif": ""}
        ],
        [
          {"name": "Deadlift (4 x 8)", "details": "Stand in front of the barbell with your feet hip-width apart. Bend your knees to grasp the barbell. Keeping your back straight and using your hips, lift the barbell off the floor. Pull your shoulders back to complete the movement.", "gif": ""},
          {"name": "Wide Grip Pull-up (4 x 10)", "details": "Grab the pull-up bar with your hands in a wide grip. Pull your body up to chin level and then lower it back down.", "gif": ""},
          {"name": "Seated Cable Row (4 x 12)", "details": "Sit on the cable station with your feet planted on the platform. Grasp the handles and pull the cable toward your abdomen. Complete the rowing motion to tighten your back muscles.", "gif": ""},
          {"name": "One-Arm Dumbbell Row (4 x 10 per arm)", "details": "Create a stable stance by placing one knee on the bench and the other foot on the floor. Hold a dumbbell in your other hand and keep your back straight. Pull the dumbbell towards your waist, squeezing your back muscles, then return to the starting position in a controlled manner.", "gif": ""},
          {"name": "Face Pull (3 x 15)", "details": "At the cable station, grasp the rope handles at face height. Pull the rope toward your face, squeezing the posterior deltoids and upper back muscles. Return to the starting position with control", "gif": ""}
        ],
        [
          {"name": "Barbell Shoulder Press (4 x 10)", "details": "Lift the barbell overhead, starting at shoulder height. Press up without locking your elbows, then return to the starting position.", "gif": ""},
          {"name": "Dumbbell Lateral Raise (4 x 12)", "details": "Start by holding dumbbells at your sides with palms facing each other. Keeping your arms straight, raise the dumbbells to shoulder height, then slowly lower them.", "gif": ""},
          {"name": "Dumbbell Front Raise (4 x 12)", "details": "Start by holding dumbbells in front of you with your palms facing down. Keeping your arms straight, raise the dumbbells to shoulder height, then lower them.", "gif": ""},
          {"name": "Arnold Press (3 x 12)", "details": "Start with the dumbbells at shoulder height with your palms facing you. As you lift the dumbbells up, rotate your palms outward and bring them together above your head. Return to the starting position with control.", "gif": ""}
        ],
        [
          {"name": "Barbell Squat (4 x 12)", "details": "Place the bar on your trapezius muscles and stand with your feet shoulder-width apart. Bend your knees and squat down. Slowly return to the starting position.", "gif": ""},
          {"name": "Leg Press (4 x 12)", "details": "On a leg press machine, place your feet on the platform, hip-width apart. Lower the platform toward you by bending your knees, then push back up to the starting position.", "gif": ""},
          {"name": "Walking Lunges (3 x 12 per leg)", "details": "Holding dumbbells at your sides, step forward and bend your knees into a squat. Complete the prescribed number of reps on each leg.", "gif": ""},
          {"name": "Romanian Deadlift (4 x 10)", "details": "Start at waist height, holding a barbell or dumbbell with your palms facing down. Lower the weight forward, keeping your knees slightly bent and your back straight. Return to the starting position by engaging your hamstrings.", "gif": ""},
          {"name": "Standing Calf Raise (4 x 15)", "details": "Standing, lift your heels off the floor and squeeze your calf muscles. Return to the starting position in a controlled manner.", "gif": ""}
        ],
        [
          {"name": "Barbell Curl (4 x 12)", "details": "Stand with the barbell, hands gripping it with a shoulder-width grip. Bend your arms to lift the barbell up, then lower it.", "gif": ""},
          {"name": "Dumbbell Hammer Curl (4 x 12)", "details": "Keeping the dumbbells in a neutral position, raise them up with your palms facing each other. Complete the movement to target your biceps and forearms.", "gif": ""},
          {"name": "Cable Rope Pushdown (4 x 12)", "details": "At the cable station, hold the rope with both hands and pull down. Straighten your elbows completely to tighten your triceps.", "gif": ""},
          {"name": "Overhead Dumbbell Tricep Extension (4 x 10)", "details": "Holding a dumbbell overhead, bend your elbows to lower the dumbbell behind your head and then raise it back up to engage your triceps muscles.", "gif": ""}
        ]
      ];
    }

  }
  //expert (we are gonna edit!)
  List<List<Map<String, String>>> _expertProgram(int days) {
    if (days == 2) {
      return [
        [
          {"name": "Barbell Bench Press (4 x 10)", "details": "Göğüs kaslarını hedefleyen klasik bir hareket.", "gif": ""},
          {"name": "Incline Dumbbell Press (4 x 10)", "details": "Üst göğüs için etkili bir hareket.", "gif": ""},
          {"name": "Pull-Ups (4 x 10)", "details": "Sırt kaslarını güçlendirmek için vücut ağırlığınızı kullanarak yapın.", "gif": ""},
          {"name": "Romanian Deadlift (4 x 10)", "details": "Hamstring ve kalça kaslarını hedefleyin.", "gif": ""},
          {"name": "Plank (3 x 60 sec)", "details": "Core bölgesini güçlendiren bir egzersiz.", "gif": ""}
        ],
        [
          {"name": "Barbell Squat (4 x 12)", "details": "Bacak kaslarınızı güçlendirmek için temel bir hareket.", "gif": ""},
          {"name": "Leg Press (4 x 12)", "details": "Bacak kaslarını hedefleyen bir makine hareketi.", "gif": ""},
          {"name": "Dumbbell Lunges (3 x 12 per leg)", "details": "Bacak ve kalça kaslarını izole ederek çalıştırın.", "gif": ""},
          {"name": "Dumbbell Shoulder Press (4 x 10)", "details": "Omuz kaslarını hedefleyen üst vücut egzersizi.", "gif": ""},
          {"name": "Cable Tricep Pushdown (4 x 12)", "details": "Triceps kaslarını çalıştıran etkili bir hareket.", "gif": ""}
        ]
      ];
    }
    if (days == 3) {
      return [
        [
          {"name": "Barbell Bench Press (4 x 10)", "details": "Göğüs kaslarını hedefleyen bir temel hareket.", "gif": ""},
          {"name": "Incline Barbell Press (4 x 10)", "details": "Üst göğüs kaslarını güçlendirmek için yapılır.", "gif": ""},
          {"name": "Chest Dips (3 x 10)", "details": "Daha derin bir göğüs kası için vücut ağırlığıyla yapılan bir hareket.", "gif": ""},
          {"name": "Barbell Row (4 x 10)", "details": "Sırt kaslarını güçlendiren temel bir egzersiz.", "gif": ""},
          {"name": "Face Pull (3 x 12)", "details": "Omuz ve sırt kaslarını dengeli bir şekilde çalıştırır.", "gif": ""}
        ],
        [
          {"name": "Squats (4 x 12)", "details": "Bacak ve kalça kaslarını hedefleyen ana hareket.", "gif": ""},
          {"name": "Walking Lunges (3 x 12 per leg)", "details": "Bacaklar için etkili bir izolasyon hareketi.", "gif": ""},
          {"name": "Romanian Deadlift (4 x 10)", "details": "Hamstring kaslarını hedefler.", "gif": ""},
          {"name": "Dumbbell Lateral Raise (4 x 12)", "details": "Omuzların yan kısmını çalıştıran bir hareket.", "gif": ""},
          {"name": "Plank (3 x 60 sec)", "details": "Core kaslarını hedefleyen statik egzersiz.", "gif": ""}
        ],
        [
          {"name": "Deadlift (4 x 6)", "details": "Tüm vücut kaslarını çalıştıran bir hareket.", "gif": ""},
          {"name": "Pull-Ups (4 x 10)", "details": "Sırt ve biceps kaslarını çalıştıran bir vücut ağırlığı egzersizi.", "gif": ""},
          {"name": "Barbell Overhead Press (4 x 10)", "details": "Omuz kaslarını hedefleyerek üst vücut gücünü artırır.", "gif": ""},
          {"name": "Cable Crunches (4 x 15)", "details": "Karın kaslarını çalıştıran bir makine hareketi.", "gif": ""},
          {"name": "Tricep Rope Pushdown (4 x 12)", "details": "Triceps kaslarını izole eden bir kablo hareketi.", "gif": ""}
        ]
      ];
    }

    if (days == 4) {
      return [
        [
          {"name": "Barbell Bench Press (4 x 10)", "details": "Göğüs kaslarını güçlendiren klasik bir egzersiz.", "gif": ""},
          {"name": "Incline Dumbbell Press (4 x 10)", "details": "Üst göğüs kaslarını hedefler.", "gif": ""},
          {"name": "Chest Dips (3 x 10)", "details": "Derin göğüs kaslarını hedefler.", "gif": ""},
          {"name": "Barbell Row (4 x 10)", "details": "Sırt kaslarını güçlendiren bir hareket.", "gif": ""},
          {"name": "Cable Tricep Pushdown (4 x 12)", "details": "Triceps kaslarını hedefleyen etkili bir hareket.", "gif": ""}
        ],
        [
          {"name": "Squats (4 x 12)", "details": "Bacak kaslarını hedefleyen ana hareket.", "gif": ""},
          {"name": "Leg Press (4 x 12)", "details": "Makinede bacak kaslarınızı çalıştırın.", "gif": ""},
          {"name": "Romanian Deadlift (4 x 10)", "details": "Hamstring kaslarını çalıştıran temel hareket.", "gif": ""},
          {"name": "Dumbbell Lateral Raise (4 x 12)", "details": "Omuz kaslarını güçlendirir.", "gif": ""},
          {"name": "Lying Leg Raise (3 x 12)", "details": "Alt karın kaslarını çalıştıran bir hareket.", "gif": ""}
        ],
        [
          {"name": "Deadlift (4 x 6)", "details": "Bütün vücut kaslarını hedef alır.", "gif": ""},
          {"name": "Pull-Ups (4 x 10)", "details": "Sırt kaslarını geliştiren klasik bir hareket.", "gif": ""},
          {"name": "Barbell Overhead Press (4 x 10)", "details": "Omuz kaslarını çalıştıran etkili bir hareket.", "gif": ""},
          {"name": "Cable Crunches (4 x 15)", "details": "Karın kaslarını hedefleyen kablo egzersizi.", "gif": ""},
          {"name": "Tricep Rope Pushdown (4 x 12)", "details": "Triceps kaslarını izole eden bir hareket.", "gif": ""}
        ],
        [
          {"name": "Barbell Squat (4 x 12)", "details": "Bacak kaslarını güçlendiren temel bir egzersiz.", "gif": ""},
          {"name": "Leg Press (4 x 12)", "details": "Bacak kaslarını hedefleyen bir makine hareketi.", "gif": ""},
          {"name": "Walking Lunges (3 x 12 per leg)", "details": "Bacak ve kalça kaslarını güçlendirir.", "gif": ""},
          {"name": "Romanian Deadlift (4 x 10)", "details": "Arka bacak kaslarını izole eder.", "gif": ""},
          {"name": "Standing Calf Raise (4 x 15)", "details": "Baldır kaslarını çalıştıran bir hareket.", "gif": ""}
        ]
      ];
    }


    else {

      return [
        [
          {"name": "Barbell Bench Press (4 x 10)", "details": "Göğüs kaslarını çalıştıran temel egzersiz.", "gif": ""},
          {"name": "Incline Dumbbell Press (4 x 10)", "details": "Üst göğüs kaslarını hedefler.", "gif": ""},
          {"name": "Chest Dips (3 x 10)", "details": "Vücut ağırlığıyla yapılan göğüs hareketi.", "gif": ""},
          {"name": "Barbell Row (4 x 10)", "details": "Sırt kaslarını çalıştıran temel hareket.", "gif": ""},
          {"name": "Cable Tricep Pushdown (4 x 12)", "details": "Triceps kaslarını hedefleyen etkili bir hareket.", "gif": ""}
        ],

        [
          {"name": "Squats (4 x 12)", "details": "Bacak kaslarını güçlendiren ana hareket.", "gif": ""},
          {"name": "Leg Press (4 x 12)", "details": "Makinede bacak kaslarını hedefler.", "gif": ""},
          {"name": "Romanian Deadlift (4 x 10)", "details": "Hamstring kaslarını çalıştıran temel bir hareket.", "gif": ""},
          {"name": "Dumbbell Lateral Raise (4 x 12)", "details": "Omuz kaslarını hedefler.", "gif": ""},
          {"name": "Plank (3 x 60 sec)", "details": "Core kaslarını güçlendiren statik egzersiz.", "gif": ""}
        ],

        [
          {"name": "Deadlift (4 x 6)", "details": "Tüm vücut kaslarını çalıştıran temel egzersiz.", "gif": ""},
          {"name": "Pull-Ups (4 x 10)", "details": "Sırt kaslarını güçlendiren klasik bir hareket.", "gif": ""},
          {"name": "Barbell Overhead Press (4 x 10)", "details": "Omuz kaslarını çalıştıran üst vücut hareketi.", "gif": ""},
          {"name": "Cable Crunches (4 x 15)", "details": "Karın kaslarını hedefleyen makine hareketi.", "gif": ""},
          {"name": "Tricep Rope Pushdown (4 x 12)", "details": "Triceps kaslarını izole eden kablo hareketi.", "gif": ""}
        ],

        [
          {"name": "Barbell Squat (4 x 12)", "details": "Bacak kaslarını güçlendiren temel hareket.", "gif": ""},
          {"name": "Leg Press (4 x 12)", "details": "Bacak kaslarını çalıştıran makine hareketi.", "gif": ""},
          {"name": "Romanian Deadlift (4 x 10)", "details": "Hamstring kaslarını hedefler.", "gif": ""},
          {"name": "Dumbbell Lunges (3 x 12 per leg)", "details": "Bacak ve kalça kaslarını izole eder.", "gif": ""},
          {"name": "Standing Calf Raise (4 x 15)", "details": "Baldır kaslarını çalıştıran etkili bir hareket.", "gif": ""
          }
        ],

        [
          {"name": "Dumbbell Bench Press (4 x 10)", "details": "Göğüs kaslarını çalıştıran etkili bir egzersiz.", "gif": ""},
          {"name": "Incline Dumbbell Press (4 x 10)", "details": "Üst göğüs kaslarını hedefler.", "gif": ""
          },
          {"name": "Barbell Rows (4 x 10)", "details": "Sırt kaslarını hedefleyen bir hareket.", "gif": ""},
          {"name": "Cable Tricep Pushdown (4 x 12)", "details": "Triceps kaslarını hedefleyen etkili bir egzersiz.", "gif": ""},
          {"name": "Plank (3 x 60 sec)", "details": "Core bölgesini güçlendiren bir egzersiz.", "gif": ""}

        ]
       ];
     }

   }
}
