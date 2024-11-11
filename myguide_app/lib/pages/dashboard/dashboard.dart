import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/category_model.dart';
import '../../models/myguide_appbar.dart';

import '../categories/categories.dart';
import 'navbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      endDrawer: const NavBar(),
      appBar: AppBarTitle.setTitle('MyGuide', lead: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // buscador
          _searchField(),

          const SizedBox(height: 40), // Separación
          
          // categorias
          _categorySection(),

          const SizedBox(height: 60),

          // descatado
          _featuredSection(context)
        ]
      )
    );
  }

  // Contenedor Buscador
  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 40, right: 40),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFFFFF).withOpacity(0)
          )
        ]
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.searchTxt,
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818),
          contentPadding: const EdgeInsets.all(15),
          
          // icono
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
          )
        )
      )
    );
  }

  // Contenedor Categorias
  Container _categorySection() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818),
        borderRadius: BorderRadius.circular(20)
      ),
      width: MediaQuery.sizeOf(context).width,
      height: 150,
      child: Column(
        children: [
          // Título
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.categoriesTxt,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const Categories()));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.categoriesMore,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue
                    )
                  )
                )
              ],
            ),
          ),

          // categorias
          const Row(
            children: [
              // iconos
            ]
          )
        ]
      ),
    );
  }

  // Contenedor Descatado
  Container _featuredSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light ? Colors.white : const Color(0xFF181818),
        borderRadius: BorderRadius.circular(20)
      ),
      width: MediaQuery.sizeOf(context).width,
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20),
            child: Text(
              AppLocalizations.of(context)!.featuredTxt,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
            ),
          )
        ]
      )
    );
  }
}
