import '../model/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> fetchRecipes();

  Future<List<Recipe>> searchRecipes(String keyword);
}
