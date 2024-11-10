import 'package:flutter/material.dart';

class AppBarTitle {
  static AppBar setTitle(String name, {bool lead = true}) {
    return AppBar(
      automaticallyImplyLeading: lead,
      iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: const Color(0xFF293E56)
    );
  }
}
