import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';

import 'shop_products.dart';
import 'shop_review.dart';

class ShopDetails extends StatefulWidget {
  const ShopDetails({super.key});

  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  // Variable de estado para el icono de favoritos
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Encabezado
      appBar: AppBarTitle.setTitle(
          AppLocalizations.of(context)!.shopDetailsTitle,
          size: 26,
          height: 80),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : const Color(0xFF181818),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen de la tienda
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/shops/placeholder.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Información de la tienda
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Icono de favoritos
                        IconButton(
                          icon: Image(
                            image: AssetImage(isFavorite
                                ? 'assets/icon/icon_favorite_color.png'
                                : 'assets/icon/icon_favorite.png'),
                            width: 30,
                            height: 30,
                          ),
                          onPressed: () {
                            // Cambia el estado de favoritos
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),

                        const Text(
                          'Shop Name',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Reseña
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                  'assets/icon/icon_review_color.png'),
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              '3.7', // Placeholder de reseñas
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Descripción
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'No description available.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),

                    // Ubicación
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '${AppLocalizations.of(context)!.locationTxt}: No location available.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),

                    // Categorías
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '${AppLocalizations.of(context)!.categoriesTxt}: No category available.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),

                    // Botón de Productos
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShopProducts()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEE9600),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.productsBtn,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Área inferior
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15),
            color: Theme.of(context).brightness == Brightness.light
                ? const Color(0xFFFFBD8A)
                : const Color(0xFF895329),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopReview()),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.reviewBtn,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
