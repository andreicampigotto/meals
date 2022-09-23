import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChange;
  final Settings settings;

  const SettingsScreen(this.settings, this.onSettingsChange, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var settings = Settings();
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraçōes'),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            'Configurações',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _createSwitch(
              'Sem Glúten',
              'Só exibe refeiçōes sem glúten',
              settings.isGlutenFree,
              (value) => setState(() => settings.isGlutenFree = value),
            ),
            _createSwitch(
              'Sem Lactose',
              'Só exibe refeiçōes sem lactose',
              settings.isLacFree,
              (value) => setState(() => settings.isLacFree = value),
            ),
            _createSwitch(
              'Refeiçōes veganas',
              'Só exibe refeiçōes veganas',
              settings.isVegan,
              (value) => setState(() => settings.isVegan = value),
            ),
            _createSwitch(
              'Refeiçōes vegetarianas',
              'Só exibe refeiçōes vegetarianas',
              settings.isVegetarian,
              (value) => setState(() => settings.isVegetarian = value),
            ),
          ],
        ))
      ]),
    );
  }
}
