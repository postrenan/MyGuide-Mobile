import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/navbar_tile.dart';

import '../profile/profile.dart';
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
          const SizedBox(height: 100),

          NavBarTile.setTile(AppLocalizations.of(context)!.profileTile, 'profile', context, MaterialPageRoute(builder: (_) => const Profile())),
          const SizedBox(height: 20),

          NavBarTile.setTile(AppLocalizations.of(context)!.shopTile, 'shop', context, MaterialPageRoute(builder: (_) => const ShopList())),
          const SizedBox(height: 20),

          NavBarTile.setTile(AppLocalizations.of(context)!.favoriteTile, 'favorite', context, MaterialPageRoute(builder: (_) => const ShopFavorites())),
          const SizedBox(height: 20),

          // NavBarTile.setTile('Reviews', context, MaterialPageRoute(builder: (_) => const Reviews())),
          //const SizedBox(height: 50),

          NavBarTile.setTile(AppLocalizations.of(context)!.settingTile, 'setting', context, MaterialPageRoute(builder: (_) => const SettingMain())),
          const SizedBox(height: 20),
        ]
      )
    );
  }
}
