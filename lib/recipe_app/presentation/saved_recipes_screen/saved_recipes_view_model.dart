import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:recipe_app/recipe_app/domain/use_case/add_bookmark_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/remove_bookmark_use_case.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_screen_event.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_state.dart';

import '../../data/model/recipe.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final RemoveBookmarkUseCase _removeBookmarkUseCase;
  final AddBookmarkUseCase _addBookmarkUseCase;

  SavedRecipesViewModel(
    this._getSavedRecipesUseCase,
    this._removeBookmarkUseCase,
    this._addBookmarkUseCase,
  );

  List<Recipe> get recipes => _recipes;
  List<Recipe> _recipes = [];

  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesState get state => _state;

  final _eventController = StreamController<SavedRecipesScreenEvent>();

  Stream<SavedRecipesScreenEvent> get eventStream => _eventController.stream;

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }

  Future<List<Recipe>> getSavedRecipes() async {
    _state = _state.copyWith(isRecipesLoading: true);
    notifyListeners();

    _recipes = await _getSavedRecipesUseCase.execute();
    _state = _state.copyWith(isRecipesLoading: false);
    notifyListeners();
    return _recipes.toList();
  }

  void removeBookmark(int id) async {
    _removeBookmarkUseCase.execute(id);
    notifyListeners();
  }

  void addBookmark(Recipe recipe) {
    _addBookmarkUseCase.execute(recipe);
    _recipes.add(recipe.copyWith(bookMarked: true));
  }
}
