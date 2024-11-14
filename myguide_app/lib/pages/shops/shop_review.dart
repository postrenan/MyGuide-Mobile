import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopReview extends StatelessWidget {
  const ShopReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppLocalizations.of(context)!.shopReviewTitle),
      ),
      body: Center(
        child: Text(
          'Shop Review.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
