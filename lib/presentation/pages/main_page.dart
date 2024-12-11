import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'add_recipe_page.dart';
import 'settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AddRecipePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Color.fromARGB(255, 191, 77, 1).withOpacity(0.5),
              child: BottomNavigationBar(
                backgroundColor: Color.fromARGB(255, 191, 77, 1).withOpacity(0.2),
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: const Color(0xFFB5CFB7),
                unselectedItemColor: Colors.white.withOpacity(0.7),
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items:  [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'home'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    label: 'add_recipe'.tr,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'settings'.tr,
                  ),
                ],
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
// import 'home_page.dart';
// import 'add_recipe_page.dart';
// import 'settings_page.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [HomePage(), AddRecipePage(), SettingsPage()];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.home),
//             label: 'home'.tr,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.add),
//             label: 'add_recipe'.tr,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.settings),
//             label: 'settings'.tr,
//           ),
//         ],
//       ),
//     );
//   }
// }
