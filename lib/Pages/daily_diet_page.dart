import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fit_track/Pages/recipe_recommendation.dart';

import 'StatsPlanningPage.dart';

class DailyDietPage extends StatefulWidget {


  const DailyDietPage({
    super.key,
  });

  @override
  createState() => _DailyDietPageState();
}

class _DailyDietPageState extends State<DailyDietPage> {

  String goal = "";
  double dailyCalories = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String userId;

  double consumedCalories = 0.0;
  double carbsConsumed = 0.0;
  double carbsGoal = 0.0;
  double proteinConsumed = 0.0;
  double proteinGoal = 0.0;
  double fatConsumed = 0.0;
  double fatGoal = 0.0;
  List<Map<String, dynamic>> foodItems = [];

  @override
  void initState() {
    super.initState();
    userId = _auth.currentUser!.uid;
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();

    if (userDoc.exists) {
      setState(() {
        consumedCalories = userDoc['consumedCalories'] ?? 0.0;
        proteinConsumed = userDoc['proteinConsumed']?? 0.0;
        carbsConsumed = userDoc['carbsConsumed'] ?? 0.0;
        fatConsumed = userDoc['fatConsumed'] ?? 0.0;
        foodItems = List<Map<String, dynamic>>.from(userDoc['foodItems'] ?? []);
        goal = userDoc['goal'] ?? "";
        dailyCalories = userDoc['daily_calories'].toDouble() ?? 0.0;
        proteinGoal = userDoc['proteinGoal'] ?? 0.0;
        fatGoal = userDoc['fatGoal'] ?? 0.0;
        carbsGoal =  userDoc['carbsGoal'] ?? 0.0;
      });

    }
  }

  Future<void> _updateUserData() async {
    await _firestore.collection('users').doc(userId).set({
      'consumedCalories': consumedCalories,
      'proteinConsumed': proteinConsumed,
      'carbsConsumed': carbsConsumed,
      'fatConsumed': fatConsumed,
      'foodItems': foodItems,
    }, SetOptions(merge: true));
  }

  void calculateMacronutrients(String goal, double dailyCalories) {
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
    proteinGoal = dailyCalories * proteinPercentage / 4;
    carbsGoal = dailyCalories * carbsPercentage / 4;
    fatGoal = dailyCalories * fatPercentage / 9;
  }

  void addFood(String foodName, double calories, double protein, double carbs, double fats) {
    setState(() {
      consumedCalories += calories;
      proteinConsumed += protein;
      carbsConsumed += carbs;
      fatConsumed += fats;
      foodItems.add({'name': foodName, 'calories': calories, 'protein': protein, 'carbs': carbs, 'fats': fats});
    });
    _updateUserData();
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
    _updateUserData();
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
        title: const Text("Daily Diet", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white,)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: bottom_nav_bar(current_index: 2),

      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black54,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Daily Diet Tracking",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildProgressCard(
                title: "Calories",
                consumed: consumedCalories,
                goal: dailyCalories,
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
                child: const Text("Add New Food",style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecipeRecommendation(minCalories: (dailyCalories.toDouble() / 7).toInt())),
                  );
                },
                child: const Text("Look for Recipes",style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Added Foods",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final item = foodItems[index];
                  return ListTile(
                    title: Text(item['name'],style: TextStyle(color: Colors.white70),),
                    subtitle: Text("Calories: ${item['calories']} kcal",style: TextStyle(color: Colors.white70),),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete,color: Colors.white60,),
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
      color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
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
                  style: const TextStyle(fontSize: 16,color: Colors.white),
                ),
                Text(
                  "${goal.toStringAsFixed(1)} $unit",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
