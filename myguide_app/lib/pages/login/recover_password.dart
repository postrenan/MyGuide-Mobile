import 'package:flutter/material.dart';
import 'login.dart';

class RecoverPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Encabezado
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            child: Container(
              color: Color(0xFF293E56),
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                  ),
                  Spacer(),
                  Text(
                    'FORGOT PASSWORD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          // Cuerpo de la pantalla
          Expanded(
            // Usar Expanded para ocupar el espacio restante
            child: SingleChildScrollView(
              // Permitimos el desplazamiento
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 80,
                    color: Color(0xFFEE9600),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Trouble Logging in?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Enter your email and we'll send you a link to reset your password.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
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
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        // Enviar el enlace de recuperación
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEE9600),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Reset Password',
                        style: TextStyle(
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
            color: Color(0xFFF2C29D),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              child: Text(
                'Return to Login',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
