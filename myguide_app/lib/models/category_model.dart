import 'package:flutter/material.dart';

class CategoryModel {
  String iconPath;
  MaterialPage page;

  CategoryModel ({
    required this.iconPath,
    required this.page
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    


    return categories;
  }

  static getCategory(int category) {
    List<CategoryModel> categories = getCategories();
    return categories[category];
  }
}
