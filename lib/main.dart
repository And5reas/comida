import 'package:flutter/material.dart';
import 'package:comida/screens/categories_screen.dart';
import 'package:comida/screens/categories_meals_screen.dart';
import 'package:comida/utils/app_routes.dart';

void main() {
  runApp(Comida());
}

class Comida extends StatelessWidget {
  const Comida({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.blue,
            onPrimary: Colors.white,
            secondary: Colors.cyanAccent,
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
        AppRoutes.home: (ctx) => CategoriesScreen(),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}
