import 'package:comida/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          meal.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(meal.imageUrl, fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text('Ingredientes',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Container(
            width: 300,
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(meal.ingredients[index]),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
