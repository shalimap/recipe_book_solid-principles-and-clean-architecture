
import '../../data/models/recipe_model.dart';

abstract class RecipeRepository {
  Future<void> addRecipe(String name, String ingredients, String instructions);
  Future<List<RecipeModel>> getAllRecipes(); // Return Future<List<RecipeModel>>
}
