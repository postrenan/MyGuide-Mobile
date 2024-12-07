import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../misc/environment.dart';
import '../../misc/validate.dart';
import '../../misc/toast_myguide.dart';
import 'package:http/http.dart'; // Para el Response
import 'dart:convert'; // Para JSON

import '../../models/myguide_appbar.dart';
import 'package:MyGuide/pages/login/login.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

// Controlador de creación de la cuenta
TextEditingController nameController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController repeatPasswordController = TextEditingController();
TextEditingController dateController = TextEditingController();

Future<void> create(BuildContext context, String name, String username, String email, String password, String repeatPassword, String date) async {
  if (context.mounted && (name.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty || repeatPassword.isEmpty || date.isEmpty)) {
    ToastMyGuide.show(context, AppLocalizations.of(context)!.toastEmptyFields, type: 'error');
    return;
  }

  try {
    Response response = await post(
      Uri.parse('${Environment.apiUrl}/users'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'email': email,
        'name': name,
        'username': username,
        'birthday': date,
        'password': repeatPassword,
      })
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      // Crear cuenta
      if (context.mounted) {
        ToastMyGuide.show(context, 'Account created successfuly', type: 'success');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));

        await Future.delayed(const Duration(seconds: 2));
        if (context.mounted) Navigator.of(context).pop();
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        repeatPasswordController.clear();
        dateController.clear();
      }
    } else if (response.statusCode == 400) {
      // Error de datos
      if (context.mounted) ToastMyGuide.show(context, 'Invalid data', type: 'error');
    } else {
      // Error desconocido
      if (context.mounted) ToastMyGuide.show(context, 'Error: ${response.statusCode}', type: 'error');
    }
  } catch (e) {
    // Error a consultar la API
    if (context.mounted) ToastMyGuide.show(context, 'An error occurred. Please try again', type: 'error');
  }
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  void _saveForm(BuildContext context) {
    // Esconder teclado
    FocusManager.instance.primaryFocus?.unfocus();

    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    create(
      context,
      nameController.text.toString().trim(),
      usernameController.text.toString().trim(),
      emailController.text.toString().trim(),
      passwordController.text.toString().trim(),
      repeatPasswordController.text.toString().trim(),
      dateController.text.toString().trim()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle.setTitle(
        AppLocalizations.of(context)!.createAccountTitle,
        size: 26,
        height: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text(
                  AppLocalizations.of(context)!.addYourInfo,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Campo Name
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.createNameTxt,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.validationEnterName;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Campo Username
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.createUsernameTxt,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.validationEnterUsername;
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 15),
                // Campo Email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.validationEnterEmail;
                    }
                    if (Validate.email(value) != null) {
                      return AppLocalizations.of(context)!.validationValidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Campo Password
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.createPasswordTxt,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.validationEnterPassword;
                    }
                    if (Validate.password(value) != null) {
                      return AppLocalizations.of(context)!.validationPasswordLength;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Campo Repeat Password
                TextFormField(
                  controller: repeatPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.repeatPasswordTxt,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.validationRepeatPassword;
                    }

                    if (passwordController.text.isNotEmpty && passwordController.text != value) {
                      return "Passwords doesn't match";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Campo Birthday
                TextFormField(
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.createBirthdayTxt,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.validationEnterBirthday;
                    }
                    if (Validate.date(value) != null) {
                      return AppLocalizations.of(context)!.validationDateFormat;
                    }
                    return null;
                  },
                ),
                // const SizedBox(height: 15),
                // // Campo Role
                // DropdownButtonFormField<String>(
                //   items: [
                //     DropdownMenuItem(
                //       value: 'Tourist',
                //       child: Text(
                //         AppLocalizations.of(context)!.roleTourist,
                //         style: const TextStyle(color: Colors.grey),
                //       ),
                //     ),
                //     DropdownMenuItem(
                //       value: 'Administrator',
                //       child: Text(
                //         AppLocalizations.of(context)!.roleAdministrator,
                //         style: const TextStyle(color: Colors.grey),
                //       ),
                //     ),
                //     DropdownMenuItem(
                //       value: 'Owner Shop',
                //       child: Text(
                //         AppLocalizations.of(context)!.roleOwnerShop,
                //         style: const TextStyle(color: Colors.grey),
                //       ),
                //     ),
                //   ],
                //   onChanged: (value) {
                //     // Acción cuando el valor cambia
                //   },
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.white,
                //     hintText: AppLocalizations.of(context)!.createRoleTxt,
                //     hintStyle: const TextStyle(
                //         color: Colors.grey), // Color gris para el hint
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(30),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                //   style: const TextStyle(
                //       color: Colors.grey), // Estilo para el valor seleccionado
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return AppLocalizations.of(context)!.validationSelectRole;
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(height: 30),
                // Botón de Create Account
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Crear cuenta si todas las validaciones son correctas
                      _saveForm(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEE9600),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.createAccountBtn,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
