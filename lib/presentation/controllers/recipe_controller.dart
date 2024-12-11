// import 'package:get/get.dart';
// import '../../data/models/recipe_model.dart';
// import '../../domain/usecases/get_all_recipes.dart';
// import '../../domain/usecases/add_recipe.dart';

// class RecipeController extends GetxController {
//   final GetAllRecipes getAllRecipes;
//   final AddRecipe addRecipe;

//   var recipes = <RecipeModel>[].obs;

//   RecipeController({
//     required this.getAllRecipes,
//     required this.addRecipe,
//   });

//   @override
//   void onInit() {
//     super.onInit();
//     fetchAllRecipes();
//   }

//   Future<void> fetchAllRecipes() async {
//     final recipeList = await getAllRecipes.execute(); // Wait for the result
//     recipes.value = recipeList; // Update the observable list
//   }

//   Future<void> createRecipe(String name, String ingredients, String instructions) async {
//     await addRecipe.execute(name, ingredients, instructions);
//     fetchAllRecipes(); // Refresh the recipe list after adding
//   }
// }


// import 'package:get/get.dart';
// import '../../data/models/recipe_model.dart';
// import '../../domain/usecases/get_all_recipes.dart';
// import '../../domain/usecases/add_recipe.dart';

// class RecipeController extends GetxController {
//   final GetAllRecipes getAllRecipes;
//   final AddRecipe addRecipe;

//   var recipeList = <RecipeModel>[].obs; // Observable list to bind to UI

//   RecipeController({
//     required this.getAllRecipes,
//     required this.addRecipe,
//   });

//   @override
//   void onInit() {
//     super.onInit();
//     fetchAllRecipes();
//   }

//   Future<void> fetchAllRecipes() async {
//     final recipeListResult = await getAllRecipes.execute(); // Wait for the result
//     recipeList.assignAll(recipeListResult); // Update the observable list
//   }

//   Future<void> createRecipe(String name, String ingredients, String instructions) async {
//     await addRecipe.execute(name, ingredients, instructions);
//     fetchAllRecipes(); // Refresh the recipe list after adding
//   }

//   void reorderRecipes(int oldIndex, int newIndex) {
//     if (newIndex > oldIndex) {
//       newIndex -= 1;
//     }
//     final recipe = recipeList.removeAt(oldIndex);
//     recipeList.insert(newIndex, recipe);
//   }
// }
import 'package:get/get.dart';
import '../../data/models/recipe_model.dart';
import '../../domain/usecases/get_all_recipes.dart';
import '../../domain/usecases/add_recipe.dart';

class RecipeController extends GetxController {
  final GetAllRecipes getAllRecipes;
  final AddRecipe addRecipe;

  var recipeList = <RecipeModel>[].obs; // Observable list to bind to UI

  RecipeController({
    required this.getAllRecipes,
    required this.addRecipe,
  });

  @override
  void onInit() {
    super.onInit();
    fetchAllRecipes();
  }

  Future<void> fetchAllRecipes() async {
    final recipeListResult = await getAllRecipes.execute(); // Wait for the result
    recipeList.assignAll(recipeListResult); // Update the observable list
  }

  Future<void> createRecipe(String name, String ingredients, String instructions) async {
    await addRecipe.execute(name, ingredients, instructions);
    fetchAllRecipes(); // Refresh the recipe list after adding
  }

  void reorderRecipes(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final recipe = recipeList.removeAt(oldIndex);
    recipeList.insert(newIndex, recipe);
  }
}
