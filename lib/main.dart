import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yo_chat/app.dart';
import 'package:yo_chat/data/repositories/authentication/authentication_repository.dart';
import 'package:yo_chat/firebase_options.dart';

Future<void> main() async {
  // add widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //GetX local storage
  await GetStorage.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const App());
}
