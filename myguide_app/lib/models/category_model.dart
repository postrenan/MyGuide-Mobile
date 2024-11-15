class CategoryModel {
  String image;
  // MaterialPageRoute page;

  CategoryModel ({
    required this.image,
    // required this.page
  });

  static List<CategoryModel> getCategories() {
    String mainPath = 'assets/images/categories';
    List<CategoryModel> categories = [];

    // TODO: Guardar categorias de la base de datos

    // book
    categories.add(CategoryModel(
      image: '$mainPath/icon_book.png'
    ));

    // clothes
    categories.add(CategoryModel(
      image: '$mainPath/icon_clothes.png'
    ));

    // food
    categories.add(CategoryModel(
      image: '$mainPath/icon_food.png'
    ));

    // game
    categories.add(CategoryModel(
      image: '$mainPath/icon_game.png'
    ));

    // gift
    categories.add(CategoryModel(
      image: '$mainPath/icon_gift.png'
    ));

    // hide
    categories.add(CategoryModel(
      image: '$mainPath/icon_hide.png'
    ));

    // jewel
    categories.add(CategoryModel(
      image: '$mainPath/icon_jewel.png'
    ));

    // makeup
    categories.add(CategoryModel(
      image: '$mainPath/icon_makeup.png'
    ));

    // photo
    categories.add(CategoryModel(
      image: '$mainPath/icon_photo.png'
    ));

    return categories;
  }

  static getCategory(int category) {
    List<CategoryModel> categories = getCategories();
    return categories[category];
  }
}
