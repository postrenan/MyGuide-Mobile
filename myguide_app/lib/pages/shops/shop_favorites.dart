import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/myguide_appbar.dart';

class ShopFavorites extends StatelessWidget {
  const ShopFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle.setTitle(AppLocalizations.of(context)!.favoriteTile),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818)
        ),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.addFavoriteTxt,
              style: const TextStyle(fontSize: 16)
            ),
          ]
        )
      )
    );
  }
}
