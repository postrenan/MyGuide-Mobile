import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';

class RecoverPassword extends StatelessWidget {
  const RecoverPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Encabezado
      appBar: AppBarTitle.setTitle(
          AppLocalizations.of(context)!.passwordForgotTitle,
          size: 26,
          height: 80),

      // Cuerpo de la pantalla
      body: Column(
        children: [
          const SizedBox(height: 100),

          Expanded(
            // Usar Expanded para ocupar el espacio restante
            child: SingleChildScrollView(
              // Permitimos el desplazamiento
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.lock_outline,
                    size: 80,
                    color: Color(0xFFEE9600),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.troubleTitle,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      AppLocalizations.of(context)!.troubleDesc,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818),
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        // Enviar el enlace de recuperación
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEE9600),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.resetBtn,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Área inferior que debe estar al fondo
          Container(
            color: Theme.of(context).brightness == Brightness.light
                ? const Color(0xFFFFBD8A)
                : const Color(0xFF895329),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () => Navigator.pop(context), // Cerrar página
              child: Text(
                AppLocalizations.of(context)!.returnBtn,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
