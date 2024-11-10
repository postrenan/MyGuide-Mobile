import 'package:flutter/material.dart';

import '../../models/navbar_tile.dart';

import '../shops/shop_list.dart';
import '../shops/shop_favorites.dart';
import '../settings/settings.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFE0AF5B).withOpacity(0.6),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              //
            }
          ),

          NavBarTile.setTile('Shops', context, MaterialPageRoute(builder: (_) => const ShopList())),

          NavBarTile.setTile('Favorites', context, MaterialPageRoute(builder: (_) => const ShopFavorites())),

          ListTile(
            title: const Text('Reviews'),
            onTap: () {
              //
            }
          ),

          NavBarTile.setTile('Settings', context, MaterialPageRoute(builder: (_) => const SettingMain()))
        ]
      )
    );
  }
}
