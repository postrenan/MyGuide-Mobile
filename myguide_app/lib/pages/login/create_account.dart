import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';

import 'login.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final _formKey = GlobalKey<FormState>();

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
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.createNameTxt,
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
                // Campo Email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.validationEnterEmail;
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return AppLocalizations.of(context)!.validationValidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Campo Password
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.createPasswordTxt,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!
                          .validationEnterPassword;
                    }
                    if (value.length < 6) {
                      return AppLocalizations.of(context)!
                          .validationPasswordLength;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Campo Repeat Password
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.repeatPasswordTxt,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!
                          .validationRepeatPassword;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Campo Birthday
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.createBirthdayTxt,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!
                          .validationEnterBirthday;
                    }
                    final birthdayRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
                    if (!birthdayRegex.hasMatch(value)) {
                      return AppLocalizations.of(context)!.validationDateFormat;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                // Campo Role
                DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(
                      value: 'Tourist',
                      child: Text(AppLocalizations.of(context)!.roleTourist),
                    ),
                    DropdownMenuItem(
                      value: 'Administrator',
                      child:
                          Text(AppLocalizations.of(context)!.roleAdministrator),
                    ),
                    DropdownMenuItem(
                      value: 'Owner Shop',
                      child: Text(AppLocalizations.of(context)!.roleOwnerShop),
                    ),
                  ],
                  onChanged: (value) {
                    // Acción cuando el valor cambia
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: AppLocalizations.of(context)!.createRoleTxt,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.validationSelectRole;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                // Botón de Create Account
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Crear cuenta si todas las validaciones son correctas
                      }
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
