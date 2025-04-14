import 'package:flutter/cupertino.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  SearchRecipesState _searchRecipesState = const SearchRecipesState();

  RecipeRepository get recipeRepository => _recipeRepository;

  SearchRecipesViewModel(this._recipeRepository);

  SearchRecipesState get searchRecipesState => _searchRecipesState;

  //view에서 모든 레시피 모델가져오는 메서드
  Future<void> fetchRecipes() async {
    _searchRecipesState = searchRecipesState.copyWith(isRecipesLoading: true);
    notifyListeners();
    _searchRecipesState = _searchRecipesState.copyWith(
      recipes: await recipeRepository.fetchRecipes(),
      isRecipesLoading: false,
    );
    notifyListeners();
  }
}
