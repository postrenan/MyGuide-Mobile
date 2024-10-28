import 'package:flutter/material.dart';
import 'screen_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyGuide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          LoginScreen(), // Cargará directamente la pantalla de inicio de sesión
    );
  }
}
