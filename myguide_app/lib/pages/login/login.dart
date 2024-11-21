import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../misc/environment.dart';
import 'package:http/http.dart';

import 'recover_password.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// Controlador de Login
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

void login(String email, String password) async {
  try {
    Response response = await post(Uri.parse('${Environment.apiUrl}/users'),
      body: {
        'email': email,
        'password': password,
      }
    );
    if (response.statusCode == 200) {
      print('account logged');
    } else {
      print('failed');
    }
  } catch (e) {
    print(e.toString());
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo azul
          Container(
            color: const Color(0xFF293E56),
          ),

          // Fondo blanco
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 2 / 3,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo cuadrado
                  Image.asset(
                    'assets/images/login/logo_square.png',
                    height: 140,
                    width: 140,
                  ),

                  const SizedBox(height: 10),
                  // Logo del nombre de la aplicación
                  Image.asset(
                    'assets/images/login/logo_name.png',
                    height: 40,
                  ),

                  const SizedBox(height: 10),
                  // Texto del slogan
                  Text(
                    AppLocalizations.of(context)!.appSlogan,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // Cuadrado anaranjado encima del cambio de fondo
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 60, right: 20, left: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFDEC29D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Barra de Email con icono de usuario
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Color(0xFF000000)),
                      prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Barra de Password con icono de candado
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: AppLocalizations.of(context)!.passwordTxt,
                      hintStyle: const TextStyle(color: Color(0xFF000000)),
                      prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Texto de "Forgot Password?"
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RecoverPassword()),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.passwordForgot,
                        style: const TextStyle(color: Color(0xFF42A5F5)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Botón de Login
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción del botón
                        login(emailController.text.toString(), passwordController.text.toString());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEE9600),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.loginTxt,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Texto
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.askAccount,
                        style: const TextStyle(color: Color(0xFF000000))
                      ),
                      TextButton(
                        onPressed: () {
                          // Acción crear cuenta
                        },
                        child: Text(
                          AppLocalizations.of(context)!.createAccount,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
