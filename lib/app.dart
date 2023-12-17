import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/authentication/screens/login/login.dart';
// import 'package:yo_chat/authentication/screens/onboarding/onboarding.dart';
import 'package:yo_chat/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: YoAppTheme.lightTheme,
      darkTheme: YoAppTheme.darkTheme,
      home:const LoginScreen(),
    );
  }
}
