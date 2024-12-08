import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';

class AboutSetting extends StatelessWidget {
  const AboutSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra
      appBar: AppBarTitle.setTitle(AppLocalizations.of(context)!.aboutTxt),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 6, left: 10, right: 10, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818)
        ),
        width: MediaQuery.sizeOf(context).width,
        height: 400,
        child: Column(
          children: [
            // Título
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'MY GUIDE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            const SizedBox(height: 60),
            // Créditos
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Móvil
                Text(AppLocalizations.of(context)!.appTxt, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const Text('- Hans Nicolás Riarte Cerda (INACAP)', style: TextStyle(fontSize: 16)),
                const Text('- Joaquín Esteban Álvarez Reyes (INACAP)', style: TextStyle(fontSize: 16)),

                const SizedBox(height: 60),

                // Web
                Text(AppLocalizations.of(context)!.webTxt, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const Text('- Cedric Marques Rocha (UFSM)', style: TextStyle(fontSize: 16)),
                const Text('- Renan Vinicius Nikodem Bick (UFSM)', style: TextStyle(fontSize: 16))
              ]
            )
          ]
        )
      )
    );
  }
}
