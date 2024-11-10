import 'package:flutter/material.dart';
import '../../misc/myguide_appbar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitle.setTitle('Categories')
    );
  }
}
