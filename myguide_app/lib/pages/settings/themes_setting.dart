import 'package:flutter/material.dart';
import '../../main.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Barra
        appBar: AppBar(
          primary: true,
          title: const Text(
            'Themes',
            style: TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.left
          ),
          backgroundColor: const Color(0xFF293E56),
        ),

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
