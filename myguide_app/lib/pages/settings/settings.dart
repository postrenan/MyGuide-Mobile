import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';

// settings
import 'themes_setting.dart';
import 'about_setting.dart';
// import 'languages_setting.dart';


class SettingMain extends StatelessWidget {
  const SettingMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra
      appBar: AppBarTitle.setTitle(AppLocalizations.of(context)!.settingTile),

      // Opciones
      body: Column(

        children: <Widget>[
          // Temas
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ThemeSetting()));
            },
            title: Text(
              AppLocalizations.of(context)!.themeTxt,
              style: const TextStyle(fontSize: 18)
            )
            
          ),
          const Divider(),
          // Idiomas
          /*ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const LanguageSetting()));
            },
            title: Text(
              AppLocalizations.of(context)!.langTxt,
              style: const TextStyle(fontSize: 18)
            )
          ),
          const Divider()*/
          // Acerca de
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutSetting()));
            },
            title: Text(
              AppLocalizations.of(context)!.aboutTxt,
              style: const TextStyle(fontSize: 18)
            )
          ),
          const Divider()
        ]
      )
    );
  }
}
