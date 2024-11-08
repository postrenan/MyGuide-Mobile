import 'package:flutter/material.dart';

class LanguageSetting extends StatelessWidget {
  const LanguageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra
      appBar: AppBar(
        primary: true,
        title: const Text(
          'Languages',
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.left
        ),
        backgroundColor: const Color(0xFF293E56),
      ),

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
