import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';
import '../../models/shop_model.dart';

import '../shops/shop_details.dart';

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle.setTitle(AppLocalizations.of(context)!.localShopTxt),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818),
          borderRadius: BorderRadius.circular(20)
        ),

        child: ListView.separated(
          itemCount: 1,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ShopDetails()));
                },
                child: ShopModel.setShop(context, categories: [])
              )
            );
          }
        // child: Center(
        //   heightFactor: 3,
        //   child: Text(
        //     AppLocalizations.of(context)!.noShops,
        //     style: const TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //       color: Color(0xFF8B8B8B)
        //     ),
        //     textAlign: TextAlign.center,
        //   )
        // )
        )
      )
    );
  }
}
