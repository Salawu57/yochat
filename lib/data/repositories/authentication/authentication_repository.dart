import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yo_chat/authentication/screens/login/login.dart';
import 'package:yo_chat/authentication/screens/signup/widgets/verify_email.dart';
import 'package:yo_chat/data/repositories/user/user_repository.dart';
import 'package:yo_chat/navigation_menu.dart';
import 'package:yo_chat/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:yo_chat/utils/exceptions/firebase_exceptions.dart';
import 'package:yo_chat/utils/exceptions/format_exceptions.dart';
import 'package:yo_chat/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  screenRedirect() async {
    final user = _auth.currentUser;
    if (kDebugMode) {
      print(user?.emailVerified);
      print(user?.toString());
      print(
          '===========================Am login screen=========================================');
    }
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      Get.offAll(() => const LoginScreen());
    }
    // deviceStorage.writeIfNull('IsFirstTime', true);
    // deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
  }

  //Sign In

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  //REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

// ReAuthenticate use
  Future<void> reAuthenticateWithEmalAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Delete User Account

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  //MAIL VERIFICATION

  Future<void> sendMailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (ex) {
      throw TFirebaseAuthException(ex.code).message;
    } on FirebaseException catch (ex) {
      throw TFirebaseException(ex.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (ex) {
      throw TPlatformException(ex.code).message;
    } catch (ex) {
      throw 'Something went wrong. Please try again';
    }
  }
}
