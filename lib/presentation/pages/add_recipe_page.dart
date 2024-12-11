import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/recipe.dart';
import '../controllers/recipe_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRecipePage extends StatefulWidget {
  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final RecipeController recipeController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController instructionsController = TextEditingController();

  void _saveRecipe() {
    final String name = nameController.text.trim();
    final String ingredients = ingredientsController.text.trim();
    final String instructions = instructionsController.text.trim();

    if (name.isNotEmpty && ingredients.isNotEmpty && instructions.isNotEmpty) {
      final newRecipe = Recipe(
        name: name,
        ingredients: ingredients,
        instructions: instructions,
      );
      recipeController.addRecipe;
      nameController.clear();
      ingredientsController.clear();
      instructionsController.clear();
      Get.back();
    } else {
      Get.snackbar('Error', 'All fields are required.',
          backgroundColor: Colors.redAccent.withOpacity(0.8),
          colorText: const Color.fromARGB(255, 141, 64, 64));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFB5CFB7)
                  .withOpacity(1), // Semi-transparent white
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(
                color: const Color(0xFFB5CFB7)
                    .withOpacity(1), // Semi-transparent white
                width: 1.5,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'add_recipe'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 192, 133, 94),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _buildGlassInputField(
                controller: nameController,
                hintText: 'add_recipe'.tr,
                icon: Icons.fastfood,
              ),
              const SizedBox(height: 16),
              _buildGlassInputField(
                controller: ingredientsController,
                hintText: 'ingredients'.tr,
                icon: Icons.list,
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              _buildGlassInputField(
                controller: instructionsController,
                hintText: 'instructions'.tr,
                icon: Icons.receipt,
                maxLines: 6,
              ),
              SizedBox(height: 24),
              _buildGlassButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    int maxLines = 1,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFCADABF),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xFFB5CFB7), width: 1.5),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            style: GoogleFonts.poppins(color: const Color(0xffBC9F8B)),
            decoration: InputDecoration(
              prefixIcon:
                  Icon(icon, color: const Color.fromARGB(255, 212, 94, 94)),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(color: const Color(0xffBC9F8B)),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: GestureDetector(
          onTap: _saveRecipe,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFFBC9F8B), const Color(0xFFB5CFB7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.orangeAccent.withOpacity(0.3),
                  offset: Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Text(
              'save_recipe'.tr,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 193, 115, 64),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/recipe_controller.dart';
// import '../models/recipe.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AddRecipePage extends StatelessWidget {
//   final recipeController = Get.find<RecipeController>();
//   final nameController = TextEditingController();
//   final ingredientsController = TextEditingController();
//   final instructionsController = TextEditingController();

//   void _clearFields() {
//     nameController.clear();
//     ingredientsController.clear();
//     instructionsController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//         'add_recipe'.tr,
//         style: GoogleFonts.poppins(
//           fontSize: 28,
//           fontWeight: FontWeight.w700,
//           color: const Color.fromARGB(255, 0, 0, 0),
//           letterSpacing: 1.2,
//         ),
//       )),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'recipe_name'.tr,
//               ),
//             ),
//             TextField(
//               controller: ingredientsController,
//               decoration: InputDecoration(labelText: 'ingredients'.tr),
//             ),
//             TextField(
//               controller: instructionsController,
//               decoration: InputDecoration(labelText: 'instructions'.tr),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final recipe = Recipe(
//                   name: nameController.text,
//                   ingredients: ingredientsController.text,
//                   instructions: instructionsController.text,
//                 );
//                 recipeController.addRecipe(recipe);
//                 _clearFields(); // Clear fields after saving
//                 Get.back(); // Navigate back to the previous screen
//               },
//               child: Text('save_recipe'.tr),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/recipe_controller.dart';
// import '../models/recipe.dart';

// class AddRecipePage extends StatelessWidget {
//   final recipeController = Get.find<RecipeController>();
//   final nameController = TextEditingController();
//   final ingredientsController = TextEditingController();
//   final instructionsController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('add_recipe'.tr)),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'recipe_name'.tr)),
//             TextField(
//                 controller: ingredientsController,
//                 decoration: InputDecoration(labelText: 'ingredients'.tr)),
//             TextField(
//                 controller: instructionsController,
//                 decoration: InputDecoration(labelText: 'instructions'.tr)),
//             ElevatedButton(
//               onPressed: () {
//                 final recipe = Recipe(
//                   name: nameController.text,
//                   ingredients: ingredientsController.text,
//                   instructions: instructionsController.text,
//                 );
//                 recipeController.addRecipe(recipe);
//                 Get.back();
//               },
//               child: Text('save_recipe'.tr),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
