import 'package:flutter/material.dart';


class DailyDietPage extends StatefulWidget {
  final String goal;
  final double dailyCalories;

  const DailyDietPage({
    super.key,
    required this.goal,
    required this.dailyCalories,
  });

  @override
  createState() => _DailyDietPageState();
}

class _DailyDietPageState extends State<DailyDietPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateMacronutrients(widget.goal, widget.dailyCalories);
  }


  double consumedCalories = 0.0;

  double carbsConsumed = 0.0;
  double carbsGoal = 0.0;

  double proteinConsumed = 0.0;
  double proteinGoal = 0.0;

  double fatConsumed = 0.0;
  double fatGoal = 0.0;



  List<Map<String, dynamic>> foodItems = [];




  void calculateMacronutrients(String goal, double daily_calories) {
    double proteinPercentage = 0.0;
    double carbsPercentage = 0.0;
    double fatPercentage = 0.0;

    switch (goal) {
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
    proteinGoal = daily_calories * proteinPercentage / 4;
    carbsGoal = daily_calories * carbsPercentage / 4;
    fatGoal = daily_calories * fatPercentage / 9;

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

  @override
  Widget build(BuildContext context) {

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
            const SizedBox(height: 20),
            const Text(
              "Daily Diet Tracking",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildProgressCard(
              title: "Calories",
              consumed: consumedCalories,
              goal: widget.dailyCalories,
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