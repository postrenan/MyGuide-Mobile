import 'package:flutter/material.dart';

class NavBarTile {

  static ListTile setTile(String name, String icon, BuildContext context, MaterialPageRoute route) {
    const double iconSize = 45;

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
      },
      leading: Image.asset(
        'assets/images/icon_$icon.png',
        width: iconSize,
        height: iconSize
      )
    );
  }
}
