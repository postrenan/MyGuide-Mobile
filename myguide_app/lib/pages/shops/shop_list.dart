import 'package:flutter/material.dart';
import '../../misc/myguide_appbar.dart';

import '../../models/shop_model.dart';

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle.setTitle('Local Shops'),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818),
          borderRadius: BorderRadius.circular(20)
        ),

        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 30),
              child: ShopModel.setShop(name: 'Test')
            );
          }
        )
      )
    );
  }
}
