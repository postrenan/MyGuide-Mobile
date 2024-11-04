// Widgets
import 'package:flutter/material.dart';
import 'screen_login.dart';
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
	Color _textColor = Color(0xFF3F3F3F);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'MyGuide',
			theme: ThemeData(primarySwatch: Colors.blue),
			darkTheme: ThemeData.dark(),
			themeMode: getThemeMode(),
			// home: const LoginScreen(), // Cargará directamente la pantalla de inicio de sesión
			home: const Debug(),
		);
	}

	// método para el cambio de tema
	void changeTheme(ThemeMode themeMode) {
		setState(() {
			// Tema
			_themeMode = themeMode;

			// texto
			if (_themeMode == ThemeMode.dark) {
				_textColor = Color(0xFFFFFFFF);
			} else {
				_textColor = Color(0xFF3F3F3F);
			}
		});
	}

	// funciones para retornar un valor
	ThemeMode getThemeMode() {
		return _themeMode;//
	}

	Color getTextColor() {
		return _textColor;
	}
}
