import 'package:comida/screens/categories_screen.dart';
import 'package:comida/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Vamos Cozinhar?',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavoriteScreen()],
        ),
      ),
    );
  }
}
