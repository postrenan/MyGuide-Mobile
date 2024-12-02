import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/loading_model.dart';
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
    return Scaffold(
      endDrawer: const NavBar(),
      appBar: AppBarTitle.setTitle('MyGuide', lead: false),
      body: SingleChildScrollView(
        child: Column(
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
        ),
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
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/svg/search.svg',
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(Theme.of(context).brightness == Brightness.light ? Colors.grey : Colors.white, BlendMode.srcIn)
            ),
          ),
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
    var categoryProvider = Provider.of<CategoryProvider>(context);
    
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
                    Navigator.push(context, MaterialPageRoute(builder: (_) => Categories()));
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
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 50,
            height: 90,
            child: categoryProvider.loading | categoryProvider.categories.isEmpty
            ? LoadingModel.set()
            : ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return IconButton(
                  onPressed: () => {},
                  icon: Image.asset(categoryProvider.categories[index].image)
                );
              }
            ),
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
