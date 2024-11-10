import 'package:flutter/material.dart';
import '../../misc/myguide_appbar.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra
      appBar: AppBarTitle.setTitle('Languages'),

      // Opciones
      body: Column(
        children: [
          // Inglés
          ListTile(
            onTap: () {
              //
            },
            title: const Text(
              'English',
              style: TextStyle(fontSize: 18
              )
            ),
          ),

          const Divider(),

          // Español
          ListTile(
            onTap: () {
              //
            },
            title: const Text(
              'Spanish',
              style: TextStyle(fontSize: 18
              )
            ),
          ),

          const Divider(),

          // Portugués
          ListTile(
            onTap: () {
              //
            },
            title: const Text(
              'Portuguese',
              style: TextStyle(fontSize: 18
              )
            ),
          ),

          const Divider(),

        ]
      )
    );
  }
}
