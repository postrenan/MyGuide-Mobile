import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart'; // Para notificar cambios
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// temas
import 'misc/themes.dart';

// import 'pages/login/screen_login.dart';
import 'debug.dart';
import 'models/category_model.dart';

Future<void> main() async {
  await dotenv.load();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(((_) = {
    runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CategoryProvider())],
        child: MyApp()
      )
    )
  }) as FutureOr Function(void value));
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
      debugShowCheckedModeBanner: kDebugMode,
      title: 'MyGuide',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('pt')
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ThemeType.lightMode,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
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
