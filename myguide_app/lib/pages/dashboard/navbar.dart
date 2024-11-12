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

          NavBarTile.setTile(AppLocalizations.of(context)!.profileTile, context, MaterialPageRoute(builder: (_) => const Profile())),

          NavBarTile.setTile(AppLocalizations.of(context)!.shopTile, context, MaterialPageRoute(builder: (_) => const ShopList())),

          NavBarTile.setTile(AppLocalizations.of(context)!.favoriteTile, context, MaterialPageRoute(builder: (_) => const ShopFavorites())),

          // ListTile(
          //   title: Text(AppLocalizations.of(context)!.reviewTile),
          //   onTap: () {
          //     //
          //   }
          // ),

          NavBarTile.setTile(AppLocalizations.of(context)!.settingTile, context, MaterialPageRoute(builder: (_) => const SettingMain()))
        ]
      )
    );
  }
}
