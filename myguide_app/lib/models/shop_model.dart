import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopModel {
  String name;
  // String category;
  // String image;
  List<Icon> categories;
  bool favorited = false;

  ShopModel({
    required this.name,
    // required this.category,
    // required this.image,
    required this.categories,
    required this.favorited
  });

  static Container setShop(BuildContext context, {String name = '', List<String> categories = const [], bool favorited = false}) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFDEC29D),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagen
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, left: 20),
                width: 160,
                height: 120,
                color: Colors.red
              )
            ]
          ),

          // Descripción
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 35),
                child: Column(
                  children: [
                    // Nombre
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Categorias
                    Text(
                      AppLocalizations.of(context)!.categoriesTxt,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFF3F3F3F)),
                    ),
                    const SizedBox(height: 15),

                    SizedBox(
                      width: 100,
                      height: 45,
                      // TODO: Hacerlo dinámica
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: categories.isNotEmpty ? List.generate(categories.length, (index) {
                          return Image.asset('assets/images/categories/icon_${categories[index]}.png');
                        }) : [const Text('None')]
                      )
                    )

                    // Calificación
                    
                    // Favorito
                  ]
                ),
              ),
            ]
          )
        ]
      )
    );
  }

  void setFavorite(String name) {
    // favorited = !favorited;
  }
}
