import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos cozinhar?',
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 20),
          _createItem(Icons.restaurant, 'Pratos'),
          _createItem(Icons.settings, 'Configurações'),
        ],
      ),
    );
  }
}
