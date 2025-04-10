import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';

import '../model/recipe.dart';

class MockRecipeDataImpl implements RecipeDataSource {
  @override
  Future<List<Recipe>> getRecipeData() async {
    return [
      Recipe(
        imagePath: 'assets/images/bibimbop.png',
        title: 'Traditional Korean Rice \n Food\n',
        chef: 'Chef John',
        minutes: 20,
        rate: 4.0,
      ),
      Recipe(
        imagePath: 'assets/images/jjigae.png',
        title: 'Traditional Korean Stew \n Food\n',
        chef: 'Chef Kim',
        minutes: 15,
        rate: 4.5,
      ),
      Recipe(
        imagePath: 'assets/images/sushi.png',
        title: 'Traditional Japan Food \n Food\n',
        chef: 'Master Nagano',
        minutes: 10,
        rate: 5.0,
      ),
      Recipe(
        imagePath: 'assets/images/chicken.png',
        title: 'Korean Style Chicken \n Food\n',
        chef: 'Cooking Mama',
        minutes: 40,
        rate: 3.0,
      ),
    ];
  }
}
