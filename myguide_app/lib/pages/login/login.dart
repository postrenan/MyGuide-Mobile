import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../misc/environment.dart';
import '../../misc/validate.dart';
import '../../misc/toast_myguide.dart'; // Popup Toast
import 'package:http/http.dart'; // Para el Response
import 'dart:convert'; // Para JSON
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dart:math'; // Por mientras

import 'recover_password.dart';
import '../dashboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// Controlador de Login
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

final storage = FlutterSecureStorage();

Future<void> login(BuildContext context, String email, String password) async {

  if (context.mounted && (email.isEmpty || password.isEmpty)) {
    ToastMyGuide.show(context, AppLocalizations.of(context)!.toastEmptyFields, type: 'error');
    return;
  }

  try {
    Response response = await get(Uri.parse('${Environment.apiUrl}/users/$email'));

    // TODO: Funcionalidad de Inicio sesión

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['password'] == password) {
        // Inicio de sesión con éxito

        // TODO: Hacer uso del Token (y que sea desde la Api)
        String token = Random().nextInt(10000).toString();
        await storage.write(key: 'token', value: token);
        if (context.mounted) Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const Dashboard()), (route) => false);

        await Future.delayed(const Duration(seconds: 2));
        if (context.mounted) Navigator.of(context).pop();
        emailController.clear();
        passwordController.clear();
      } else {
        // Error de Contraseña
        if (context.mounted) ToastMyGuide.show(context, AppLocalizations.of(context)!.toastWrongPass, type: 'error');
      }
    } else {
      // Usuario no encontrado
      if (context.mounted) ToastMyGuide.show(context, AppLocalizations.of(context)!.toastWrongEmail, type: 'error');
    }
  } catch (e) {
    // Error a consultar la API
    if (context.mounted) ToastMyGuide.show(context, AppLocalizations.of(context)!.toastErrorApi + e.toString(), type: 'error');
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void _saveForm(BuildContext context) {
    // TODO: Mejorar las validaciones de los campos

    // Esconder teclado
    FocusManager.instance.primaryFocus?.unfocus();
    
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      // ToastMyGuide.show(context, 'Not valid', type: 'error');
      return;
    }

    login(context, emailController.text.toString().trim(), passwordController.text.toString().trim());
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Barra de Email con icono de usuario
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818),
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.person, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none
                        ),
                      ),
                      validator: (text) {
                        if (text!.trim().isNotEmpty && Validate.email(text) != null) {

                          return AppLocalizations.of(context)!.emailValidate;
                        }
                        return null;
                      }
                    ),
                    const SizedBox(height: 10),
                    
                    // Barra de Password con icono de candado
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818),
                        hintText: AppLocalizations.of(context)!.passwordTxt,
                        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none
                        ),
                      ),
                      validator: (text) {
                        if (emailController.text.toString().trim().isNotEmpty && text!.isEmpty) {
                          return AppLocalizations.of(context)!.passwordValidate;
                        }
                        return null;
                      }
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
                          _saveForm(context);
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
          ),
        ],
      ),
    );
  }
}
