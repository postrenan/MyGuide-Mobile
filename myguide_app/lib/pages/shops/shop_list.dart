import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';

// import '../../models/shop_model.dart';

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

        // child: ListView.separated(
        //   itemCount: 10,
        //   separatorBuilder: (context, index) => const SizedBox(height: 10),
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 30),
        //       child: ShopModel.setShop(context, name: 'Test', categories: ['game', 'food'])
        //       // child: ShopModel.setShop(context, name: 'Test')
        //     );
        //   }
        child: Center(
          heightFactor: 3,
          child: Text(
            AppLocalizations.of(context)!.noShops,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B8B8B)
            ),
            textAlign: TextAlign.center,
          )
        )
      )
    );
  }
}
