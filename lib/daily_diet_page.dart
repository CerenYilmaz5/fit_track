import 'package:flutter/material.dart';


class DailyDietPage extends StatefulWidget {
  final String goal;
  final double bmi;
  final double dailyCalories;

  const DailyDietPage({super.key, required this.goal, required this.bmi, required this.dailyCalories});

  @override
  _DailyDietPageState createState() => _DailyDietPageState();
}

class _DailyDietPageState extends State<DailyDietPage> {
  String selectedDiet = "";
  List<String> diets = ["Balanced Diet", "Keto Diet", "Vegan Diet", "Mediterranean Diet", "Bulk", "Definition", "Weight Loss"];

  double consumedCalories = 0.0;
  double calorieGoal = 0.0;

  double carbsConsumed = 0.0;
  double carbsGoal = 0.0;

  double proteinConsumed = 0.0;
  double proteinGoal = 0.0;

  double fatConsumed = 0.0;
  double fatGoal = 0.0;

  List<Map<String, dynamic>> foodItems = [];
  String selectedBodyType = "";

  @override
  void initState() {
    super.initState();
    updateCalories(selectedDiet);
  }

  void addFood(String foodName, double calories, double protein, double carbs, double fats) {
    setState(() {
      consumedCalories += calories;
      proteinConsumed += protein;
      carbsConsumed += carbs;
      fatConsumed += fats;
      foodItems.add({'name': foodName, 'calories': calories, 'protein': protein, 'carbs': carbs, 'fats': fats});
    });
  }

  void removeFood(int index) {
    setState(() {
      final foodItem = foodItems[index];
      consumedCalories -= foodItem['calories'];
      proteinConsumed -= foodItem['protein'];
      carbsConsumed -= foodItem['carbs'];
      fatConsumed -= foodItem['fats'];
      foodItems.removeAt(index);
    });
  }

  void updateCalories(String goal) {
    String bodyType = getBodyType(widget.bmi);

    double goalCalories = 0;

    if (goal == "Balanced Diet" || goal == "Keto Diet" || goal == "Vegan Diet" || goal == "Mediterranean Diet") {
      goalCalories = _getDietCalories(goal, bodyType);
    } else {
      goalCalories = _getBulkDefinitionWeightLossCalories(goal, bodyType);
    }

    setState(() {
      calorieGoal = goalCalories;
      updateMacronutrientGoals(goal, goalCalories); // Update macronutrient goals
    });
  }

  void updateMacronutrientGoals(String goal, double goalCalories) {

    double proteinPercentage = 0.0;
    double carbsPercentage = 0.0;
    double fatPercentage = 0.0;

    switch (goal) {
      case "Balanced Diet":
        proteinPercentage = 0.20;
        carbsPercentage = 0.50;
        fatPercentage = 0.30;
        break;
      case "Keto Diet":
        proteinPercentage = 0.20;
        carbsPercentage = 0.05;
        fatPercentage = 0.75;
        break;
      case "Vegan Diet":
        proteinPercentage = 0.15;
        carbsPercentage = 0.60;
        fatPercentage = 0.25;
        break;
      case "Mediterranean Diet":
        proteinPercentage = 0.20;
        carbsPercentage = 0.55;
        fatPercentage = 0.25;
        break;
      case "Bulk":
        proteinPercentage = 0.25;
        carbsPercentage = 0.55;
        fatPercentage = 0.20;
        break;
      case "Definition":
        proteinPercentage = 0.35;
        carbsPercentage = 0.45;
        fatPercentage = 0.20;
        break;
      case "Weight Loss":
        proteinPercentage = 0.30;
        carbsPercentage = 0.40;
        fatPercentage = 0.30;
        break;
      default:
        proteinPercentage = 0.20;
        carbsPercentage = 0.50;
        fatPercentage = 0.30;
    }

    // Hedef kaloriler üzerinden oranları hesaplıyoruz
    setState(() {
      proteinGoal = goalCalories * proteinPercentage / 4;
      carbsGoal = goalCalories * carbsPercentage / 4;
      fatGoal = goalCalories * fatPercentage / 9;
    });
  }

  double _getDietCalories(String goal, String bodyType) {
    switch (goal) {
      case "Balanced Diet":
        return _getBalancedDietCalories(bodyType);
      case "Keto Diet":
        return _getKetoDietCalories(bodyType);
      case "Vegan Diet":
        return _getVeganDietCalories(bodyType);
      case "Mediterranean Diet":
        return _getMediterraneanDietCalories(bodyType);
      default:
        return 2000; // Default fallback
    }
  }

  double _getBulkDefinitionWeightLossCalories(String goal, String bodyType) {
    double goalCalories = 0;
    switch (goal) {
      case "Bulk":
        goalCalories = _getBulkCalories(bodyType);
        break;
      case "Definition":
        goalCalories = _getDefinitionCalories(bodyType);
        break;
      case "Weight Loss":
        goalCalories = _getWeightLossCalories(bodyType);
        break;
    }
    return goalCalories;
  }

  double _getBulkCalories(String bodyType) {
    switch (bodyType) {
      case "Very Slim":
        return 3000;
      case "Slim":
        return 2800;
      case "Normal":
        return 2500;
      case "Overweight":
        return 2300;
      case "Obese":
        return 2200;
      case "Obese Plus":
        return 2100;
      default:
        return 2500;
    }
  }

  double _getDefinitionCalories(String bodyType) {
    switch (bodyType) {
      case "Very Slim":
        return 2500;
      case "Slim":
        return 2400;
      case "Normal":
        return 2200;
      case "Overweight":
        return 2000;
      case "Obese":
        return 1800;
      case "Obese Plus":
        return 1700;
      default:
        return 2200;
    }
  }

  double _getWeightLossCalories(String bodyType) {
    switch (bodyType) {
      case "Very Slim":
        return 2000;
      case "Slim":
        return 1900;
      case "Normal":
        return 1800;
      case "Overweight":
        return 1600;
      case "Obese":
        return 1500;
      case "Obese Plus":
        return 1400;
      default:
        return 1800;
    }
  }

  double _getBalancedDietCalories(String bodyType) {
    switch (bodyType) {
      case "Very Slim":
        return 2300;
      case "Slim":
        return 2200;
      case "Normal":
        return 2000;
      case "Overweight":
        return 1800;
      case "Obese":
        return 1600;
      case "Obese Plus":
        return 1500;
      default:
        return 2000;
    }
  }

  double _getKetoDietCalories(String bodyType) {
    switch (bodyType) {
      case "Very Slim":
        return 2100;
      case "Slim":
        return 2000;
      case "Normal":
        return 1800;
      case "Overweight":
        return 1700;
      case "Obese":
        return 1500;
      case "Obese Plus":
        return 1400;
      default:
        return 1800;
    }
  }

  double _getVeganDietCalories(String bodyType) {
    switch (bodyType) {
      case "Very Slim":
        return 2200;
      case "Slim":
        return 2100;
      case "Normal":
        return 1900;
      case "Overweight":
        return 1700;
      case "Obese":
        return 1600;
      case "Obese Plus":
        return 1500;
      default:
        return 1900;
    }
  }

  double _getMediterraneanDietCalories(String bodyType) {
    switch (bodyType) {
      case "Very Slim":
        return 2400;
      case "Slim":
        return 2300;
      case "Normal":
        return 2100;
      case "Overweight":
        return 1900;
      case "Obese":
        return 1700;
      case "Obese Plus":
        return 1600;
      default:
        return 2100;
    }
  }

  String getBodyType(double bmi) {
    if (bmi < 16.0) {
      return "Extremely Slim";
    } else if (bmi >= 16.0 && bmi < 17.0) {
      return "Very Slim";
    } else if (bmi >= 17.0 && bmi < 18.5) {
      return "Slim";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obese Plus";
    }
  }

  void showAddFoodDialog() {
    TextEditingController foodController = TextEditingController();
    TextEditingController caloriesController = TextEditingController();
    TextEditingController proteinController = TextEditingController();
    TextEditingController carbsController = TextEditingController();
    TextEditingController fatsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Food"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: foodController,
                  decoration: const InputDecoration(labelText: "Food Name"),
                ),
                TextField(
                  controller: caloriesController,
                  decoration: const InputDecoration(labelText: "Calories"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: proteinController,
                  decoration: const InputDecoration(labelText: "Protein (g)"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: carbsController,
                  decoration: const InputDecoration(labelText: "Carbs (g)"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: fatsController,
                  decoration: const InputDecoration(labelText: "Fats (g)"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String foodName = foodController.text;
                double calories = double.tryParse(caloriesController.text) ?? 0.0;
                double protein = double.tryParse(proteinController.text) ?? 0.0;
                double carbs = double.tryParse(carbsController.text) ?? 0.0;
                double fats = double.tryParse(fatsController.text) ?? 0.0;

                if (foodName.isNotEmpty) {
                  addFood(foodName, calories, protein, carbs, fats);
                }
                Navigator.pop(context);
              },
              child: const Text("Add Food"),
            ),
          ],
        );
      },
    );
  }
  void showAddDietDialog() {
    TextEditingController dietController = TextEditingController();
    TextEditingController caloriesController = TextEditingController();
    TextEditingController proteinController = TextEditingController();
    TextEditingController carbsController = TextEditingController();
    TextEditingController fatsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Diet"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: dietController,
                  decoration: const InputDecoration(labelText: "Diet Name"),
                ),
                TextField(
                  controller: caloriesController,
                  decoration: const InputDecoration(labelText: "Total Calories"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: proteinController,
                  decoration: const InputDecoration(labelText: "Protein (g)"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: carbsController,
                  decoration: const InputDecoration(labelText: "Carbs (g)"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: fatsController,
                  decoration: const InputDecoration(labelText: "Fats (g)"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                String dietName = dietController.text;
                double calories = double.tryParse(caloriesController.text) ?? 0.0;
                double protein = double.tryParse(proteinController.text) ?? 0.0;
                double carbs = double.tryParse(carbsController.text) ?? 0.0;
                double fats = double.tryParse(fatsController.text) ?? 0.0;

                if (dietName.isNotEmpty) {
                  addDiet(dietName, calories, protein, carbs, fats);
                }
                Navigator.pop(context);
              },
              child: const Text("Add Diet"),
            ),
          ],
        );
      },
    );
  }

  void addDiet(String dietName, double calories, double protein, double carbs, double fats) {
    setState(() {
      diets.add(dietName);

    });
  }
  @override
  Widget build(BuildContext context) {
    String bodyType = getBodyType(widget.bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Diet"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Diet Selection",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedDiet.isEmpty ? null : selectedDiet,
                    hint: const Text("Please select diet"),
                    isExpanded: true,
                    items: diets
                        .map((diet) => DropdownMenuItem(
                      value: diet,
                      child: Text(diet),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedDiet = value!;
                        updateCalories(selectedDiet);
                      });
                    },
                  ),
                ),

              ],
            ),
            ElevatedButton(
              onPressed: showAddDietDialog,
              child: const Text("Add New Diet"),
            ),

            const SizedBox(height: 10),
            Text(
              "Body Type: $bodyType",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "Daily Diet Tracking",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildProgressCard(
              title: "Calories",
              consumed: consumedCalories,
              goal: calorieGoal,
              color: Colors.red,
              unit: "kcal",
            ),
            const SizedBox(height: 10),
            _buildProgressCard(
              title: "Carbohydrates",
              consumed: carbsConsumed,
              goal: carbsGoal,
              color: Colors.orange,
              unit: "g",
            ),
            const SizedBox(height: 10),
            _buildProgressCard(
              title: "Protein",
              consumed: proteinConsumed,
              goal: proteinGoal,
              color: Colors.blue,
              unit: "g",
            ),
            const SizedBox(height: 10),
            _buildProgressCard(
              title: "Fats",
              consumed: fatConsumed,
              goal: fatGoal,
              color: Colors.green,
              unit: "g",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: showAddFoodDialog,
              child: const Text("Add New Food"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Added Foods",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final item = foodItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text("Calories: ${item['calories']} kcal"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      removeFood(index);
                    },
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard({
    required String title,
    required double consumed,
    required double goal,
    required Color color,
    required String unit,
  }) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: goal > 0 ? consumed / goal : 0,
              backgroundColor: Colors.grey[200],
              color: color,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${consumed.toStringAsFixed(1)} $unit",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  "${goal.toStringAsFixed(1)} $unit",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
