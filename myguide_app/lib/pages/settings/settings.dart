import 'package:flutter/material.dart';

// settings
import 'themes_setting.dart';
import 'languages_setting.dart';


class SettingMain extends StatelessWidget {
  const SettingMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 20, color: Colors.white)
        ),
        backgroundColor: const Color(0xFF293E56),
      ),

      // Opciones
      body: Column(

        children: <Widget>[
          // Temas
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ThemeSetting()));
            },
            title: const Text(
              'Themes',
              style: TextStyle(fontSize: 18)
            )
            
          ),
          const Divider(),
          // Idiomas
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguageSetting()));
            },
            title: const Text(
              'Languages',
              style: TextStyle(fontSize: 18)
            )
          ),
          const Divider()
        ]
      )
    );
  }
}
