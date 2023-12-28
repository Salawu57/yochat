import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/bindings/general_bindings.dart';
import 'package:yo_chat/pages/chat/index.dart';
import 'package:yo_chat/utils/constants/colors.dart';
// import 'package:yo_chat/authentication/screens/onboarding/onboarding.dart';
import 'package:yo_chat/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: YoAppTheme.lightTheme,
      darkTheme: YoAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: YoColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



// const Scaffold(
//         backgroundColor: YoColors.primary,
//         body: Center(
//           child: CircularProgressIndicator(
//             color: Colors.white,
//           ),
//         ),
//       ),