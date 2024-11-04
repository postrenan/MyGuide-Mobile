import 'package:flutter/material.dart';
import 'main.dart';

class Settings extends StatelessWidget {
	const Settings({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			home: Scaffold(
				// Barra
				appBar: AppBar(
					title: const Text(
						'Settings',
						style: TextStyle(fontSize: 24, color: Colors.white),
						textAlign: TextAlign.left
					),
					backgroundColor: const Color(0xFF293E56),
				),

				// Opciones
				body: Column(
					children: <Widget>[
						// Temas
						ListTile(
							onTap: () {
								Navigator.push(context, MaterialPageRoute(builder: (_) => ThemeSetting()));
							},
							title: Text(
								'Themes',
								style: TextStyle(
									fontSize: 18,
									color: MyApp.of(context).getTextColor()
								)
							)
							
						),
						const Divider(),
						// Idiomas
						ListTile(
							onTap: () {
								Navigator.push(context, MaterialPageRoute(builder: (_) => LanguageSetting()));
							},
							title: Text(
								'Languages',
								style: TextStyle(
									fontSize: 18,
									color: MyApp.of(context).getTextColor()
								)
							)
						),
						const Divider()
					]
				)
			)
		);
	}
}

class ThemeSetting extends StatelessWidget {
	const ThemeSetting({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
				// Barra
				appBar: AppBar(
					primary: true,
					title: const Text(
						'Themes',
						style: TextStyle(fontSize: 24, color: Colors.white),
						textAlign: TextAlign.left
					),
					backgroundColor: const Color(0xFF293E56),
				),

				// Opciones
				// TODO: aplicar tema en toda la aplicación
				body: Column(
					children: [
						// Tema del sistema
						ListTile(
							onTap: () {
								MyApp.of(context).changeTheme(ThemeMode.system);
							},
							title: Text(
								"System's Theme",
								style: TextStyle(
									fontSize: 18,
									color: MyApp.of(context).getTextColor()
								)
							),
						),
						const Divider(),
						// Tema claro
						ListTile(
							onTap: () {
								MyApp.of(context).changeTheme(ThemeMode.light);
							},
							title: Text(
								'Light Theme',
								style: TextStyle(
									fontSize: 18,
									color: MyApp.of(context).getTextColor()
								)
							),
						),
						const Divider(),
						// Tema oscuro
						ListTile(
							onTap: () {
								MyApp.of(context).changeTheme(ThemeMode.dark);
							},
							title: Text(
								'Dark Theme',
								style: TextStyle(
									fontSize: 18,
									color: MyApp.of(context).getTextColor(),
								)
							),
						),
						const Divider()
					]
				)
		);
	}
}

class LanguageSetting extends StatelessWidget {
	const LanguageSetting({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			// Barra
			appBar: AppBar(
				primary: false,
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
						title: Text(
							'English',
							style: TextStyle(
								fontSize: 18,
								color: MyApp.of(context).getTextColor(),
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
							'Spanish',
							style: TextStyle(
								fontSize: 18,
								color: MyApp.of(context).getTextColor(),
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
							'Portuguese',
							style: TextStyle(
								fontSize: 18,
								color: MyApp.of(context).getTextColor(),
							)
						),
					),

					const Divider(),

				]
			)
		);
	}
}
