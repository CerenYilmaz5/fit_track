import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  final String goal;

  const DietPage({
    super.key,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {

    Map<String, Map<String, dynamic>> dietPlans = {
      'Lose Weight': {
        'diet': [
          'Breakfast: Oatmeal with berries and chia seeds (High fiber, low sugar)',
          'Lunch: Grilled chicken breast with steamed broccoli and quinoa',
          'Dinner: Mixed green salad with lean protein (chicken, tofu) and olive oil dressing',
          'Snacks: Almonds or Greek yogurt with flaxseeds',
        ],
        'waterIntake': 2.5,
      },
      'Gain Muscle': {
        'diet': [
          'Breakfast: Scrambled eggs with avocado and spinach (healthy fats and protein)',
          'Lunch: Brown rice with grilled chicken breast and steamed asparagus',
          'Dinner: Salmon with quinoa and roasted sweet potatoes',
          'Snacks: Whey protein shake, cottage cheese with fruit',
        ],
        'waterIntake': 3.0,
      },
      'Definition': {
        'diet': [
          'Breakfast: Whole wheat toast with eggs and avocado (fiber + healthy fats)',
          'Lunch: Turkey wrap with veggies and hummus',
          'Dinner: Grilled fish (like cod or salmon) with steamed broccoli and a side of couscous',
          'Snacks: Protein bar with low sugar or a handful of mixed nuts',
        ],
        'waterIntake': 2.5,
      },
    };

    var selectedPlan = dietPlans[goal];
    double waterIntakeInLiters = selectedPlan!['waterIntake'];
    int waterIntakeInCups = (waterIntakeInLiters * 4).toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text("Diet Plan for $goal"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedPlan['diet']?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.fastfood),
                    title: Text(selectedPlan['diet'][index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: Text(
                'Recommended Water Intake: $waterIntakeInCups cups of water per day',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
