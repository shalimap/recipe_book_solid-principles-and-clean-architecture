import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/recipe_controller.dart';
import 'recipe_detail_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final RecipeController recipeController = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFB5CFB7).withOpacity(1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(
                color: const Color(0xFFB5CFB7).withOpacity(1),
                width: 1.5,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'recipe'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 192, 133, 94),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (recipeController.recipeList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: Text(
                'home_content'.tr,
                style: GoogleFonts.poppins(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        return ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            recipeController.reorderRecipes(oldIndex, newIndex);
          },
          children: [
            for (int index = 0; index < recipeController.recipeList.length; index++)
              Padding(
                key: ValueKey(recipeController.recipeList[index].name),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    tileColor: const Color(0xFFE7E8D8),
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(Icons.fastfood, color: Colors.white),
                    ),
                    title: Text(
                      recipeController.recipeList[index].name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          'Ingredients: ${recipeController.recipeList[index].ingredients}',
                          style: GoogleFonts.poppins(color: Colors.black54),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Instructions: ${recipeController.recipeList[index].instructions}',
                          style: GoogleFonts.poppins(color: Colors.black54),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Color.fromARGB(129, 12, 0, 0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    
                    onTap: () {
                      Get.to(() => RecipeDetailPage(
                          recipe: recipeController.recipeList[index]//
                          ));
                    },
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/recipe_controller.dart';

// class HomePage extends StatelessWidget {
//   final RecipeController controller = Get.find();

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ingredientsController = TextEditingController();
//   final TextEditingController instructionsController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Recipes')),
//       body: Column(
//         children: [
//           TextField(
//             controller: nameController,
//             decoration: InputDecoration(labelText: 'Recipe Name'),
//           ),
//           TextField(
//             controller: ingredientsController,
//             decoration: InputDecoration(labelText: 'Ingredients'),
//           ),
//           TextField(
//             controller: instructionsController,
//             decoration: InputDecoration(labelText: 'Instructions'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               controller.createRecipe(
//                 nameController.text,
//                 ingredientsController.text,
//                 instructionsController.text,
//               );
//             },
//             child: Text('Add Recipe'),
//           ),
//           Obx(() {
//             if (controller.recipes.isEmpty) {
//               return Center(child: Text('No recipes available'));
//             }
//             return ListView.builder(
//               shrinkWrap: true,
//               itemCount: controller.recipes.length,
//               itemBuilder: (context, index) {
//                 final recipe = controller.recipes[index];
//                 return ListTile(
//                   title: Text(recipe.name),
//                   subtitle: Text(recipe.ingredients),
//                 );
//               },
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }