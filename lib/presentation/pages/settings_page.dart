import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
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
                  'settings'.tr,
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
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7E8D8),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:
                        const Color(0xFFCADABF).withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'select_language'.tr,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFBC9F8B),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildLanguageDropdown(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFB5CFB7).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 63, 164, 12).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: DropdownButton<String>(
        value: Get.locale?.languageCode,
        onChanged: (String? lang) {
          if (lang != null) {
            var locale = lang == 'en' ? Locale('en', 'US') : Locale('ml', 'IN');
            Get.updateLocale(locale);
          }
        },
        items: [
          DropdownMenuItem(value: 'en', child: Text('English')),
          DropdownMenuItem(value: 'ml', child: Text('മലയാളം')),
        ],
        dropdownColor: const Color(0xFFCADABF).withOpacity(0.9),
        style: GoogleFonts.poppins(color: Color.fromARGB(255, 210, 116, 53),),
        iconEnabledColor: const Color(0xFFBC9F8B),
        iconSize: 24,
        elevation: 8,
        isExpanded: true,
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SettingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('settings'.tr)),
//       body: Center(
//         child: DropdownButton<String>(
//           value: Get.locale?.languageCode,
//           onChanged: (String? lang) {
//             if (lang != null) {
//               var locale =
//                   lang == 'en' ? Locale('en', 'US') : Locale('ml', 'IN');
//               Get.updateLocale(locale);
//             }
//           },
//           items: [
//             DropdownMenuItem(value: 'en', child: Text('English')),
//             DropdownMenuItem(value: 'ml', child: Text('മലയാളം')),
//           ],
//         ),
//       ),
//     );
//   }
// }
