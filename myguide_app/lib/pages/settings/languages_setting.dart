import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra
      appBar: AppBarTitle.setTitle(AppLocalizations.of(context)!.langTxt),

      // Opciones
      body: Column(
        children: [
          // Inglés
          ListTile(
            onTap: () {
              //
            },
            title: Text(
              AppLocalizations.of(context)!.langEnglish,
              style: const TextStyle(fontSize: 18
              )
            ),
          ),

          const Divider(),

          // Español
          ListTile(
            onTap: () {
              //
            },
            title: Text(
              AppLocalizations.of(context)!.langSpanish,
              style: const TextStyle(fontSize: 18
              )
            ),
          ),

          const Divider(),

          // Portugués
          ListTile(
            onTap: () {
              //
            },
            title: Text(
              AppLocalizations.of(context)!.langPortuguese,
              style: const TextStyle(fontSize: 18
              )
            ),
          ),

          const Divider(),

        ]
      )
    );
  }
}
