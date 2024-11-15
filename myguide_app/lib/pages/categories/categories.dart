import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/myguide_appbar.dart';
import '../../models/category_model.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();

    return Scaffold(
      appBar: AppBarTitle.setTitle(AppLocalizations.of(context)!.categoriesTxt),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818)
        ),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,

        // categorias
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width - 50,
          height: 10,
          child: GridView.count(
            crossAxisCount: 4, // cantidad de objetos por fila
            children: List.generate(categories.length, (index) {
              return IconButton(
                onPressed: () => {},
                icon: Image.asset(categories[index].image)
              );
            })
          )
        )
      )
    );
  }
}
