import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/loading_model.dart';
import '../../models/myguide_appbar.dart';
import '../../models/category_model.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // Sobreescribir la inicialización del State
  @override
  void initState() {
    super.initState();
    
    // Ejecución después de un frame para que cargue sin problemas las categorías por API
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<CategoryProvider>(context, listen: false).fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);

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
          child: categoryProvider.loading
          ? LoadingModel.set()
          : categoryProvider.categories.isNotEmpty
          ? GridView.count(
            crossAxisCount: 4, // cantidad de objetos por fila
            children: List.generate(categoryProvider.categories.length, (index) {
              return IconButton(
                onPressed: () => {},
                icon: Image.asset(categoryProvider.categories[index].image)
              );
            })
          )
          : const Center(child: Text('Error'))
        )
      )
    );
  }
}
