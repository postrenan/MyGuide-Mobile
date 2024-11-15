import 'package:flutter/material.dart';

class CategoryButton {
  static IconButton setButton(String iconPath) {
    return IconButton(
      onPressed: () => {},
      icon: Image.asset(iconPath)
    );
  }
}
