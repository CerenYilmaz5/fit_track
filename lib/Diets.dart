import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  final String goal;
  final int week;
  final int day;

  const DietPage({
    super.key,
    required this.goal,
    required this.week,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, dynamic>> dietPlans = {
      'Lose Weight': {
        'diet': [
          // Week 1
          {
            'breakfast': 'Scrambled eggs with spinach and tomatoes',
            'lunch': 'Grilled chicken with quinoa and steamed broccoli',
            'dinner': 'Salmon with roasted sweet potatoes',
          },
          {
            'breakfast': 'Oatmeal with chia seeds and blueberries',
            'lunch': 'Tuna salad with mixed greens',
            'dinner': 'Grilled turkey with steamed asparagus',
          },
          {
            'breakfast': 'Smoothie with protein powder, spinach, and strawberries',
            'lunch': 'Grilled shrimp with avocado and quinoa',
            'dinner': 'Chicken stir-fry with vegetables',
          },
          {
            'breakfast': 'Greek yogurt with almonds and chia seeds',
            'lunch': 'Grilled chicken with cauliflower rice',
            'dinner': 'Grilled salmon with zucchini noodles',
          },
          {
            'breakfast': 'Avocado toast with poached egg',
            'lunch': 'Tuna salad with kale and olive oil dressing',
            'dinner': 'Roasted chicken breast with Brussels sprouts',
          },
          {
            'breakfast': 'Scrambled eggs with avocado',
            'lunch': 'Grilled fish with mixed veggies',
            'dinner': 'Baked turkey with roasted carrots',
          },
          {
            'breakfast': 'Chia pudding with almond milk and berries',
            'lunch': 'Grilled shrimp with quinoa and avocado',
            'dinner': 'Grilled chicken with roasted sweet potato',
          },
          // Week 2
          {
            'breakfast': 'Omelette with mushrooms and spinach',
            'lunch': 'Chicken breast with steamed broccoli and quinoa',
            'dinner': 'Baked cod with roasted sweet potato',
          },
          {
            'breakfast': 'Greek yogurt with mixed berries and almonds',
            'lunch': 'Tuna salad with cucumbers and tomatoes',
            'dinner': 'Grilled turkey with roasted asparagus',
          },
          {
            'breakfast': 'Chia pudding with coconut milk and strawberries',
            'lunch': 'Grilled shrimp with avocado and brown rice',
            'dinner': 'Chicken with roasted vegetables',
          },
          {
            'breakfast': 'Smoothie with protein powder, spinach, and chia seeds',
            'lunch': 'Grilled chicken with quinoa and spinach',
            'dinner': 'Salmon with mixed greens',
          },
          {
            'breakfast': 'Avocado toast with scrambled eggs',
            'lunch': 'Grilled shrimp with kale salad',
            'dinner': 'Roast chicken with Brussels sprouts',
          },
          {
            'breakfast': 'Greek yogurt with chia seeds and almonds',
            'lunch': 'Grilled turkey with quinoa',
            'dinner': 'Grilled salmon with sweet potatoes',
          },
          {
            'breakfast': 'Protein pancakes with almond butter',
            'lunch': 'Grilled chicken with roasted veggies',
            'dinner': 'Baked cod with quinoa and spinach',
          },
          // Week 3
          {
            'breakfast': 'Scrambled eggs with spinach and tomatoes',
            'lunch': 'Grilled chicken with sweet potatoes',
            'dinner': 'Grilled salmon with steamed asparagus',
          },
          {
            'breakfast': 'Oatmeal with almond milk and berries',
            'lunch': 'Tuna salad with olive oil dressing',
            'dinner': 'Grilled turkey with steamed broccoli',
          },
          {
            'breakfast': 'Smoothie with protein powder, spinach, and bananas',
            'lunch': 'Grilled shrimp with avocado',
            'dinner': 'Chicken stir-fry with zucchini',
          },
          {
            'breakfast': 'Greek yogurt with chia seeds and honey',
            'lunch': 'Grilled chicken with cauliflower rice',
            'dinner': 'Grilled salmon with roasted vegetables',
          },
          {
            'breakfast': 'Avocado toast with poached egg',
            'lunch': 'Grilled turkey with kale salad',
            'dinner': 'Roasted chicken with Brussels sprouts',
          },
          {
            'breakfast': 'Scrambled eggs with avocado and spinach',
            'lunch': 'Grilled fish with mixed greens',
            'dinner': 'Roasted turkey with sweet potatoes',
          },
          {
            'breakfast': 'Chia pudding with almond milk and berries',
            'lunch': 'Grilled shrimp with quinoa',
            'dinner': 'Grilled chicken with roasted vegetables',
          },
          // Week 4
          {
            'breakfast': 'Omelette with spinach and tomatoes',
            'lunch': 'Chicken breast with quinoa and roasted broccoli',
            'dinner': 'Salmon with roasted carrots',
          },
          {
            'breakfast': 'Greek yogurt with chia seeds and mixed berries',
            'lunch': 'Tuna salad with mixed greens',
            'dinner': 'Grilled turkey with steamed asparagus',
          },
          {
            'breakfast': 'Smoothie with protein powder, spinach, and strawberries',
            'lunch': 'Grilled shrimp with avocado and quinoa',
            'dinner': 'Chicken stir-fry with bell peppers',
          },
          {
            'breakfast': 'Greek yogurt with almonds and chia seeds',
            'lunch': 'Grilled chicken with cauliflower rice',
            'dinner': 'Grilled salmon with roasted zucchini',
          },
          {
            'breakfast': 'Avocado toast with scrambled eggs',
            'lunch': 'Grilled shrimp with kale salad',
            'dinner': 'Roast chicken with Brussels sprouts',
          },
          {
            'breakfast': 'Scrambled eggs with avocado',
            'lunch': 'Grilled fish with mixed veggies',
            'dinner': 'Baked turkey with roasted carrots',
          },
          {
            'breakfast': 'Chia pudding with almond milk and berries',
            'lunch': 'Grilled shrimp with quinoa and avocado',
            'dinner': 'Grilled chicken with roasted sweet potatoes',
          },
        ],
        'waterIntake': 2.5,
      },
      'Gain Muscle': {
        'diet': [
          // Week 1
          {
            'breakfast': 'Protein pancakes with almond butter and banana',
            'lunch': 'Chicken breast with brown rice and steamed broccoli',
            'dinner': 'Grilled salmon with quinoa',
          },
          {
            'breakfast': 'Scrambled eggs with avocado and whole wheat toast',
            'lunch': 'Grilled steak with sweet potato and green beans',
            'dinner': 'Turkey chili with brown rice',
          },
          {
            'breakfast': 'Oatmeal with protein powder, banana, and peanut butter',
            'lunch': 'Tuna salad with quinoa and avocado',
            'dinner': 'Grilled chicken with sweet potatoes and spinach',
          },
          {
            'breakfast': 'Whole grain toast with scrambled eggs and avocado',
            'lunch': 'Grilled shrimp with quinoa and roasted veggies',
            'dinner': 'Beef stir-fry with brown rice',
          },
          {
            'breakfast': 'Smoothie with protein powder, almond milk, and banana',
            'lunch': 'Grilled chicken with couscous and roasted Brussels sprouts',
            'dinner': 'Salmon with quinoa and steamed broccoli',
          },
          {
            'breakfast': 'Scrambled eggs with turkey bacon',
            'lunch': 'Grilled chicken with sweet potatoes and spinach',
            'dinner': 'Beef chili with brown rice',
          },
          {
            'breakfast': 'Oatmeal with protein powder and almond butter',
            'lunch': 'Grilled shrimp with quinoa and mixed greens',
            'dinner': 'Grilled steak with roasted vegetables',
          },
          // Week 2
          {
            'breakfast': 'Protein smoothie with spinach and banana',
            'lunch': 'Grilled chicken with quinoa and roasted carrots',
            'dinner': 'Grilled salmon with steamed broccoli',
          },
          {
            'breakfast': 'Scrambled eggs with turkey sausage and avocado',
            'lunch': 'Steak with sweet potatoes and green beans',
            'dinner': 'Turkey chili with brown rice',
          },
          {
            'breakfast': 'Oatmeal with protein powder and chia seeds',
            'lunch': 'Grilled chicken with quinoa and mixed vegetables',
            'dinner': 'Beef stir-fry with brown rice',
          },
          {
            'breakfast': 'Whole grain toast with eggs and avocado',
            'lunch': 'Grilled shrimp with couscous and roasted vegetables',
            'dinner': 'Salmon with steamed spinach',
          },
          {
            'breakfast': 'Smoothie with protein powder and almond milk',
            'lunch': 'Grilled chicken with quinoa and roasted Brussels sprouts',
            'dinner': 'Salmon with steamed broccoli',
          },
          {
            'breakfast': 'Scrambled eggs with avocado and whole grain toast',
            'lunch': 'Grilled turkey with sweet potatoes',
            'dinner': 'Beef chili with brown rice',
          },
          {
            'breakfast': 'Protein pancakes with almond butter and banana',
            'lunch': 'Grilled shrimp with quinoa and mixed greens',
            'dinner': 'Grilled chicken with roasted vegetables',
          },
          // Week 3
          {
            'breakfast': 'Protein pancakes with almond butter',
            'lunch': 'Grilled chicken with quinoa and roasted veggies',
            'dinner': 'Salmon with quinoa and steamed broccoli',
          },
          {
            'breakfast': 'Scrambled eggs with avocado and toast',
            'lunch': 'Grilled steak with roasted vegetables',
            'dinner': 'Turkey chili with brown rice',
          },
          {
            'breakfast': 'Oatmeal with banana and protein powder',
            'lunch': 'Grilled chicken with sweet potatoes',
            'dinner': 'Beef stir-fry with broccoli and brown rice',
          },
          {
            'breakfast': 'Whole grain toast with scrambled eggs',
            'lunch': 'Grilled shrimp with quinoa and mixed greens',
            'dinner': 'Grilled salmon with steamed spinach',
          },
          {
            'breakfast': 'Smoothie with protein powder and almond milk',
            'lunch': 'Grilled chicken with couscous',
            'dinner': 'Grilled turkey with roasted vegetables',
          },
          {
            'breakfast': 'Scrambled eggs with avocado and spinach',
            'lunch': 'Grilled steak with sweet potatoes',
            'dinner': 'Beef stir-fry with brown rice',
          },
          {
            'breakfast': 'Protein pancakes with almond butter and banana',
            'lunch': 'Grilled shrimp with quinoa',
            'dinner': 'Grilled chicken with roasted vegetables',
          },
          // Week 4
          {
            'breakfast': 'Protein pancakes with almond butter and banana',
            'lunch': 'Chicken breast with brown rice',
            'dinner': 'Grilled salmon with roasted vegetables',
          },
          {
            'breakfast': 'Scrambled eggs with avocado and toast',
            'lunch': 'Grilled steak with quinoa',
            'dinner': 'Turkey chili with brown rice',
          },
          {
            'breakfast': 'Oatmeal with protein powder, banana, and peanut butter',
            'lunch': 'Tuna salad with quinoa',
            'dinner': 'Grilled chicken with roasted sweet potatoes',
          },
          {
            'breakfast': 'Whole grain toast with scrambled eggs',
            'lunch': 'Grilled shrimp with quinoa',
            'dinner': 'Beef stir-fry with brown rice',
          },
          {
            'breakfast': 'Smoothie with protein powder and almond milk',
            'lunch': 'Grilled chicken with couscous',
            'dinner': 'Salmon with quinoa and steamed broccoli',
          },
          {
            'breakfast': 'Scrambled eggs with turkey bacon',
            'lunch': 'Grilled fish with roasted vegetables',
            'dinner': 'Grilled chicken with sweet potatoes',
          },
          {
            'breakfast': 'Protein pancakes with almond butter and banana',
            'lunch': 'Grilled shrimp with quinoa',
            'dinner': 'Grilled chicken with roasted vegetables',
          },
        ],
        'waterIntake': 3.0,
      },
      'Definition': {
        'diet': [
          // Week 1
          {
            'breakfast': 'Scrambled eggs with spinach and whole-grain toast',
            'lunch': 'Grilled chicken with couscous and mixed greens',
            'dinner': 'Grilled salmon with roasted vegetables',
          },
          {
            'breakfast': 'Greek yogurt with honey and granola',
            'lunch': 'Turkey sandwich with avocado and leafy greens',
            'dinner': 'Grilled chicken with quinoa and roasted Brussels sprouts',
          },
          {
            'breakfast': 'Smoothie with almond milk, protein powder, and berries',
            'lunch': 'Grilled turkey with couscous and spinach',
            'dinner': 'Grilled fish with roasted sweet potatoes',
          },
          {
            'breakfast': 'Oatmeal with chia seeds and berries',
            'lunch': 'Chicken salad with mixed greens and avocado',
            'dinner': 'Beef stir-fry with broccoli and brown rice',
          },
          {
            'breakfast': 'Whole grain toast with scrambled eggs and avocado',
            'lunch': 'Grilled chicken with quinoa and roasted carrots',
            'dinner': 'Grilled shrimp with mixed greens',
          },
          {
            'breakfast': 'Greek yogurt with granola and strawberries',
            'lunch': 'Grilled fish with couscous and asparagus',
            'dinner': 'Baked chicken with sweet potatoes and green beans',
          },
          {
            'breakfast': 'Chia pudding with almond milk and berries',
            'lunch': 'Grilled turkey with quinoa and roasted vegetables',
            'dinner': 'Grilled salmon with mixed greens',
          },
          // Week 2
          {
            'breakfast': 'Scrambled eggs with spinach and mushrooms',
            'lunch': 'Grilled chicken with couscous and mixed veggies',
            'dinner': 'Grilled salmon with sweet potatoes',
          },
          {
            'breakfast': 'Smoothie with protein powder and berries',
            'lunch': 'Grilled fish with quinoa and steamed broccoli',
            'dinner': 'Grilled chicken with roasted Brussels sprouts',
          },
          {
            'breakfast': 'Oatmeal with almond butter and strawberries',
            'lunch': 'Chicken stir-fry with mixed vegetables',
            'dinner': 'Grilled shrimp with couscous',
          },
          {
            'breakfast': 'Greek yogurt with honey and granola',
            'lunch': 'Grilled turkey with quinoa and roasted veggies',
            'dinner': 'Beef stir-fry with brown rice',
          },
          {
            'breakfast': 'Whole grain toast with scrambled eggs and avocado',
            'lunch': 'Grilled chicken with couscous and mixed greens',
            'dinner': 'Grilled salmon with roasted vegetables',
          },
          {
            'breakfast': 'Chia pudding with berries',
            'lunch': 'Grilled chicken with quinoa and steamed broccoli',
            'dinner': 'Grilled shrimp with mixed veggies',
          },
          {
            'breakfast': 'Scrambled eggs with spinach and tomatoes',
            'lunch': 'Grilled turkey with couscous and roasted Brussels sprouts',
            'dinner': 'Grilled salmon with sweet potatoes',
          },
          // Week 3
          {
            'breakfast': 'Scrambled eggs with spinach and avocado',
            'lunch': 'Grilled chicken with quinoa and roasted vegetables',
            'dinner': 'Grilled shrimp with mixed greens',
          },
          {
            'breakfast': 'Oatmeal with chia seeds and berries',
            'lunch': 'Grilled chicken with couscous and roasted carrots',
            'dinner': 'Grilled fish with steamed broccoli',
          },
          {
            'breakfast': 'Greek yogurt with honey and granola',
            'lunch': 'Grilled turkey with quinoa and spinach',
            'dinner': 'Baked chicken with sweet potatoes',
          },
          {
            'breakfast': 'Smoothie with almond milk and berries',
            'lunch': 'Grilled chicken with couscous and roasted vegetables',
            'dinner': 'Beef stir-fry with brown rice',
          },
          {
            'breakfast': 'Scrambled eggs with avocado',
            'lunch': 'Grilled shrimp with quinoa and vegetables',
            'dinner': 'Grilled salmon with roasted sweet potatoes',
          },
          {
            'breakfast': 'Chia pudding with almond milk and berries',
            'lunch': 'Grilled chicken with couscous and green beans',
            'dinner': 'Grilled turkey with roasted Brussels sprouts',
          },
          {
            'breakfast': 'Protein smoothie with almond milk',
            'lunch': 'Grilled salmon with quinoa and roasted veggies',
            'dinner': 'Grilled chicken with mixed greens',
          },
          // Week 4
          {
            'breakfast': 'Scrambled eggs with avocado',
            'lunch': 'Grilled turkey with couscous and roasted veggies',
            'dinner': 'Grilled shrimp with roasted sweet potatoes',
          },
          {
            'breakfast': 'Oatmeal with chia seeds and berries',
            'lunch': 'Grilled chicken with quinoa and mixed greens',
            'dinner': 'Grilled salmon with roasted vegetables',
          },
          {
            'breakfast': 'Greek yogurt with honey and granola',
            'lunch': 'Grilled chicken with quinoa and roasted sweet potatoes',
            'dinner': 'Beef stir-fry with brown rice',
          },
          {
            'breakfast': 'Smoothie with protein powder, almond milk, and berries',
            'lunch': 'Grilled chicken with couscous and steamed veggies',
            'dinner': 'Grilled shrimp with roasted carrots',
          },
          {
            'breakfast': 'Scrambled eggs with spinach and mushrooms',
            'lunch': 'Grilled turkey with couscous and mixed vegetables',
            'dinner': 'Grilled salmon with mixed greens',
          },
          {
            'breakfast': 'Chia pudding with almond milk and berries',
            'lunch': 'Grilled chicken with couscous and green beans',
            'dinner': 'Grilled turkey with roasted Brussels sprouts',
          },
          {
            'breakfast': 'Protein smoothie with almond milk',
            'lunch': 'Grilled chicken with quinoa and steamed broccoli',
            'dinner': 'Grilled salmon with roasted vegetables',
          },
        ],
        'waterIntake': 2.5,
      },

    };

    var selectedPlan = dietPlans[goal];
    double waterIntakeInLiters = selectedPlan!['waterIntake'];
    int waterIntakeInCups = (waterIntakeInLiters * 4).toInt();

    var dietForDay = selectedPlan['diet']![((week - 1) * 7) + (day - 1)]; // Adjust the indexing for week and day

    return Scaffold(
      appBar: AppBar(
        title: Text("Diet Plan for $goal"),
        backgroundColor: Colors.blue[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Week: $week, Day: $day',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Breakfast: ${dietForDay['breakfast']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Lunch: ${dietForDay['lunch']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Dinner: ${dietForDay['dinner']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20), // Space after the diet description
                ],
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
