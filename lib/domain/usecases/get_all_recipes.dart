import '../../data/models/recipe_model.dart';
import '../repositories/recipe_repository.dart';

class GetAllRecipes {
  final RecipeRepository repository;

  GetAllRecipes(this.repository);

  Future<List<RecipeModel>> execute() async {
    return repository.getAllRecipes();
  }
}
