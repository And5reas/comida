import 'package:comida/models/settings.dart';
import 'package:comida/screens/meal_detail_screen.dart';
import 'package:comida/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:comida/screens/categories_meals_screen.dart';
import 'package:comida/screens/tabs_screen.dart';
import 'package:comida/utils/app_routes.dart';
import 'package:comida/models/meal.dart';
import 'package:comida/data/dummy_data.dart';

void main() {
  runApp(Comida());
}

class Comida extends StatefulWidget {
  const Comida({super.key});

  @override
  State<Comida> createState() => _ComidaState();
}

class _ComidaState extends State<Comida> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.pink,
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white)),
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.pink,
            onPrimary: Colors.white,
            secondary: const Color.fromARGB(255, 255, 193, 24),
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.red.shade100,
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDatail: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (ctx) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
