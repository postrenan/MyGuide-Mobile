import 'package:flutter/material.dart';
import '../../misc/myguide_appbar.dart';

// settings
import 'themes_setting.dart';
import 'languages_setting.dart';


class SettingMain extends StatelessWidget {
  const SettingMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra
      appBar: AppBarTitle.setTitle('Settings'),

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
