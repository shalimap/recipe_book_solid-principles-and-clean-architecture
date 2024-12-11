import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'domain/entities/recipe.dart';
import 'injection.dart' as di;

import 'presentation/pages/splash_screen.dart';
import 'translations/app_translations.dart';

void main() async {
  await di.init();
  await Hive.openBox<Recipe>('recipes');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home:  SplashScreen(),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'presentation/pages/home_page.dart';
// import 'injection.dart' as di;

// void main() async {
//   await di.init();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Recipe App',
//       home: HomePage(),
//     );
//   }
// }