import 'package:hive_flutter/hive_flutter.dart';

part 'recipe_model.g.dart';

@HiveType(typeId: 0)
class RecipeModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String ingredients;

  @HiveField(2)
  final String instructions;

  RecipeModel({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });
}
