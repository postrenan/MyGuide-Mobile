import 'package:flutter/material.dart';

class AppBarTitle {

  // Parámetros que estén dentro de una {}, vendrán con valores predeterminados
  static AppBar setTitle(String name, {bool lead = true, double size = 20, double height = 60}) {
    return AppBar(
      automaticallyImplyLeading: lead,
      iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
      title: Text(
        name,
        style: TextStyle(
          fontSize: size,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: const Color(0xFF293E56),
      toolbarHeight: height,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10)
        )
      )
    );
  }
}
