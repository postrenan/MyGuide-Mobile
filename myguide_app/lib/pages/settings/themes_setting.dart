import 'package:flutter/material.dart';
import '../../misc/myguide_appbar.dart';
import '../../main.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Barra
        appBar: AppBarTitle.setTitle('Themes'),

        // Opciones
        body: Column(
          children: [
            // Tema del sistema
            ListTile(
              onTap: () {
                MyApp.of(context).changeTheme(ThemeMode.system);
              },
              title: const Text(
                "System's Theme",
                style: TextStyle(fontSize: 18)
              ),
            ),
            const Divider(),
            // Tema claro
            ListTile(
              onTap: () {
                MyApp.of(context).changeTheme(ThemeMode.light);
              },
              title: const Text(
                'Light Theme',
                style: TextStyle(fontSize: 18)
              ),
            ),
            const Divider(),
            // Tema oscuro
            ListTile(
              onTap: () {
                MyApp.of(context).changeTheme(ThemeMode.dark);
              },
              title: const Text(
                'Dark Theme',
                style: TextStyle(fontSize: 18
                )
              ),
            ),
            const Divider()
          ]
        )
    );
  }
}
