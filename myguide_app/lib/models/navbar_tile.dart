import 'package:flutter/material.dart';

class NavBarTile {
  static ListTile setTile(String name, BuildContext context, MaterialPageRoute route) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white
        )
      ),
      onTap: () {
        Navigator.push(context, route);
      }
    );
  }
}
