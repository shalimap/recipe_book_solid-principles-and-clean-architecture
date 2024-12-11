import 'package:hive_flutter/hive_flutter.dart';
import '../models/recipe_model.dart';

abstract class RecipeLocalDataSource {
  Future<List<RecipeModel>> getAllRecipes();
  Future<void> addRecipe(RecipeModel recipe);
}

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  final Box<RecipeModel> recipeBox;

  RecipeLocalDataSourceImpl(this.recipeBox);

  @override
  Future<List<RecipeModel>> getAllRecipes() async {
    return recipeBox.values.toList();
  }

  @override
  Future<void> addRecipe(RecipeModel recipe) async {
    await recipeBox.add(recipe);
  }
}
