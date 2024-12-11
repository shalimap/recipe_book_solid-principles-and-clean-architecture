import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_recipe_book/domain/repositories/recipe_repository.dart';
import 'package:my_recipe_book/domain/usecases/add_recipe.dart';
import 'package:my_recipe_book/domain/usecases/get_all_recipes.dart';
import 'package:my_recipe_book/presentation/controllers/recipe_controller.dart';
import 'package:my_recipe_book/data/repositories/recipe_repository_impl.dart';

import 'data/models/recipe_model.dart';

Future<void> init() async {
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeModelAdapter());
  final recipeBox = await Hive.openBox<RecipeModel>('recipes');

  // Repository
  Get.lazyPut<RecipeRepository>(() => RecipeRepositoryImpl(recipeBox));

  // UseCases
  Get.lazyPut(() => AddRecipe(Get.find())); // Pass the registered RecipeRepository
  Get.lazyPut(() => GetAllRecipes(Get.find())); // Pass the registered RecipeRepository

  // Controller
  Get.lazyPut(() => RecipeController(
        getAllRecipes: Get.find(),
        addRecipe: Get.find(),
      ));
}
