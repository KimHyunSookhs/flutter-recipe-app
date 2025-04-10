import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';
import 'package:recipe_app/recipe_app/model/recipe.dart';
import 'package:recipe_app/recipe_app/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> fetchRecipes() async {
    final recipeList = await _recipeDataSource.getRecipeData();
    return recipeList;
  }
}
