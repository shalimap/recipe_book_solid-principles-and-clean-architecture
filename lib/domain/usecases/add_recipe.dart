import '../repositories/recipe_repository.dart';

class AddRecipe {
  final RecipeRepository repository;

  AddRecipe(this.repository);

  Future<void> execute(String name, String ingredients, String instructions) async {
    await repository.addRecipe(name, ingredients, instructions);
  }
}
