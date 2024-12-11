import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailPage({required this.recipe});

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
                  'recipe_details'.tr,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRecipeCard(
                title: 'recipe_name'.tr,
                content: recipe.name,
              ),
              SizedBox(height: 20),
              _buildRecipeCard(
                title: 'ingredients'.tr,
                content: recipe.ingredients,
              ),
              SizedBox(height: 20),
              _buildRecipeCard(
                title: 'instructions'.tr,
                content: recipe.instructions,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A reusable widget for each section with glassmorphism effect
  Widget _buildRecipeCard({required String title, required String content}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 210, 116, 53),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Text(
                content,
                style:GoogleFonts.poppins(
                  fontSize: 16,
                        color: const Color(0xFFBC9F8B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../models/recipe.dart';

// class RecipeDetailPage extends StatelessWidget {
//   final Recipe recipe;

//   RecipeDetailPage({required this.recipe});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('recipe_details'.tr)),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('${'recipe_name'.tr}: ${recipe.name}'),
//             Text('${'ingredients'.tr}: ${recipe.ingredients}'),
//             Text('${'instructions'.tr}: ${recipe.instructions}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
