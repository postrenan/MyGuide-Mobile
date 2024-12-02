import 'package:flutter/material.dart';

import '../../misc/environment.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CategoryModel {
  String image;
  // MaterialPageRoute page;

  CategoryModel ({
    required this.image,
    // required this.page
  });

  static Future<List<CategoryModel>> getCategories() async {
    String mainPath = 'assets/images/categories/icon_';
    List<CategoryModel> categories = [];

    await Future.delayed(const Duration(seconds: 2));

    try {
      final Response response = await get(Uri.parse('${Environment.apiUrl}/categories'));
      final List<dynamic> data = jsonDecode(response.body);

      for (var categoryRes in data) {
        final String category = categoryRes["name"].toString().toLowerCase();
        if (!categories.contains(CategoryModel(image: '$mainPath$category.png'))) {
          categories.add(CategoryModel(image: '$mainPath$category.png'));
        }
      }
    } catch (e) {
      print(e);
    }

    return categories;
  }
}

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _loading = false;

  List<CategoryModel> get categories => _categories;
  bool get loading => _loading;

  void fetchCategories() async {
    _loading = true;
    notifyListeners();
    _categories = await CategoryModel.getCategories();
    _loading = false;
    notifyListeners();
  }
}
