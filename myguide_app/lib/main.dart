import 'package:flutter/material.dart';

// temas
import 'misc/themes.dart';

// import 'pages/login/screen_login.dart';
import 'debug.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  // Campo encargado de manejar el modo de tema de la aplicación
  ThemeMode _themeMode = ThemeMode.system;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'MyGuide',
      theme: ThemeData(
        useMaterial3: true,
        // brightness: Brightness.light,
        colorScheme: ThemeType.lightMode,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        // brightness: Brightness.dark,
        colorScheme: ThemeType.darkMode,
      ),
      themeMode: _themeMode,
      // home: const LoginScreen(), // Cargará directamente la pantalla de inicio de sesión
      home: const Debug(),
    );
  }

  // método para el cambio de tema
  void changeTheme(ThemeMode themeMode) {
    setState(() => _themeMode = themeMode);
  }
}
