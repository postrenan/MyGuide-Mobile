import 'package:flutter/material.dart';

import '../../misc/myguide_appbar.dart';

class ShopFavorites extends StatelessWidget {
  const ShopFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle.setTitle('Favorites'),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818)
        ),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: const Column(
          children: [
            Text(
              'Add more favorites!',
              style: TextStyle(fontSize: 16)
            ),
          ]
        )
      )
    );
  }
}
