import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../models/recipe_model.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final Box<RecipeModel> recipeBox;

  RecipeRepositoryImpl(this.recipeBox);

  @override
  Future<void> addRecipe(String name, String ingredients, String instructions) async {
    final recipe = RecipeModel(name: name, ingredients: ingredients, instructions: instructions);
    await recipeBox.add(recipe);
  }

  @override
  Future<List<RecipeModel>> getAllRecipes() async {
    return recipeBox.values.toList(); // Wrap this in a Future if not already async
  }
}
