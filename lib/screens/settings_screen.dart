import 'package:comida/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:comida/components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Configurações',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Filtros',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                      'Sem Glúten',
                      'Só exibe pratos sem glúten',
                      settings.isGlutenFree,
                      (value) => setState(() {
                            settings.isGlutenFree = value;
                          })),
                  _createSwitch(
                      'Sem Lactose',
                      'Só exibe pratos sem lactose',
                      settings.isLactoseFree,
                      (value) => setState(() {
                            settings.isLactoseFree = value;
                          })),
                  _createSwitch(
                      'Vegana',
                      'Só exibe pratos veganas',
                      settings.isVegan,
                      (value) => setState(() {
                            settings.isVegan = value;
                          })),
                  _createSwitch(
                      'Vegetariana',
                      'Só exibe pratos Vegetarianos',
                      settings.isVegetarian,
                      (value) => setState(() {
                            settings.isVegetarian = value;
                          })),
                ],
              ),
            )
          ],
        ));
  }
}
