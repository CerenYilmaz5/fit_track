import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RecipeFinder {
  final String base_url = "https://api.spoonacular.com/recipes/complexSearch";
  final String api_key = "8ae76b027c564cf281173463ce365ad2";

  Future<List<dynamic>> fetchRecipes(int calories) async {
    final url = Uri.parse("$base_url?minCalories=$calories&number=20&addRecipeInformation=true&apiKey=$api_key");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['results']; // Returns a list of recipes
      } else {
        throw Exception("Failed to fetch recipes. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}

class RecipeRecommendation extends StatefulWidget {
  final int minCalories;

  const RecipeRecommendation({super.key, required this.minCalories});

  @override
  createState() => _RecipeRecommendationState();
}

class _RecipeRecommendationState extends State<RecipeRecommendation> {
  late Future<List<dynamic>> _recipes;

  @override
  void initState() {
    super.initState();
    _recipes = RecipeFinder().fetchRecipes(widget.minCalories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipes")),
      body: FutureBuilder<List<dynamic>>(
        future: _recipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No recipes found."));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (recipe['image'] != null)
                        Image.network(recipe['image']), // Display the image
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          recipe['title'],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeDetails(
                                  title: recipe['title'],
                                  summary: recipe['summary'],
                                ),
                              ),
                            );
                          },
                          child: Text("Details"),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class RecipeDetails extends StatelessWidget {
  final String title;
  final String summary;

  const RecipeDetails({super.key, required this.title, required this.summary});

  String _removeHtmlTags(String htmlText) {
    final RegExp exp = RegExp(r"<[^>]*>");
    return htmlText.replaceAll(exp, "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            _removeHtmlTags(summary),
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
