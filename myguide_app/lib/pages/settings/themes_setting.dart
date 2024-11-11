import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';
import '../../main.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Barra
        appBar: AppBarTitle.setTitle(AppLocalizations.of(context)!.themeTxt),

        // Opciones
        body: Column(
          children: [
            // Tema del sistema
            ListTile(
              onTap: () {
                MyApp.of(context).changeTheme(ThemeMode.system);
              },
              title: Text(
                AppLocalizations.of(context)!.systemTxt,
                style: const TextStyle(fontSize: 18)
              ),
            ),
            const Divider(),
            // Tema claro
            ListTile(
              onTap: () {
                MyApp.of(context).changeTheme(ThemeMode.light);
              },
              title: Text(
                AppLocalizations.of(context)!.lightTxt,
                style: const TextStyle(fontSize: 18)
              ),
            ),
            const Divider(),
            // Tema oscuro
            ListTile(
              onTap: () {
                MyApp.of(context).changeTheme(ThemeMode.dark);
              },
              title: Text(
                AppLocalizations.of(context)!.darkTxt,
                style: const TextStyle(fontSize: 18)
              ),
            ),
            const Divider()
          ]
        )
    );
  }
}
